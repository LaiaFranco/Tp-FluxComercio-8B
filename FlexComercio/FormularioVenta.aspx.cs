using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlexComercio
{
    public partial class FormularioVenta : System.Web.UI.Page
    {
        private ClienteNegocio ClienteDatos = new ClienteNegocio();
        private ProductoNegocio ProductoDatos = new ProductoNegocio();
        private VentasNegocio VentasDatos = new VentasNegocio();

        public List<DetalleVenta> ListaDetalles
        {
            get
            {
                List<DetalleVenta> lista = Session["listaDetalles"] as List<DetalleVenta>;
                if (lista == null)
                {
                    lista = new List<DetalleVenta>();
                    Session["listaDetalles"] = lista;
                }
                return lista;
            }
            set
            {
                Session["listaDetalles"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarClientes();
                CargarProductos();
                CargarDetallesGvProductos();

                if (Session["idVenta"] != null)
                {
                    int idVenta;
                    if (int.TryParse(Session["idVenta"].ToString(), out idVenta))
                    {
                        CargarCampos(idVenta);
                        Session.Remove("idVenta");
                    }
                    else
                    {
                        Session.Remove("idVenta");
                    }
                }
            }
        }

        private void CargarClientes()
        {
            List<Dominio.Cliente> Clientes = ClienteDatos.Listar().Where(c => c.Activo).ToList();
            var listaClientes = Clientes.Select(c => new
            {
                Id = c.Id,
                NombreCompleto = c.Nombre + " " + c.Apellido
            }).ToList();
            ddlCliente.DataSource = listaClientes;
            ddlCliente.DataTextField = "NombreCompleto";
            ddlCliente.DataValueField = "Id";
            ddlCliente.DataBind();
        }

        private void CargarProductos()
        {
            List<Dominio.Producto> productos = ProductoDatos.Listar().Where(c => c.Activo && c.StockActual > 0).ToList();
            Session["Productos"] = productos;
            gvProductos.DataSource = productos;
            gvProductos.DataBind();
        }

        private void CargarDetallesGvProductos()
        {
            gvDetalles.DataSource = ListaDetalles;
            gvDetalles.DataBind();
            decimal total = ListaDetalles.Sum(d => (decimal)d.Subtotal);
            lblTotal.Text = $"Total: {total:C2}";
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            // Ocultar mensaje de error previo
            lblErrorStock.Visible = false;

            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument);
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            TextBox txtCantidad = (TextBox)row.FindControl("txtCantidad");
            int cantidad = Convert.ToInt32(txtCantidad.Text);

            if (cantidad <= 0) cantidad = 1;

            List<Dominio.Producto> productos = Session["Productos"] as List<Dominio.Producto>;
            if (productos == null)
            {
                productos = ProductoDatos.Listar();
                Session["Productos"] = productos;
            }

            Dominio.Producto producto = productos.FirstOrDefault(p => p.Id == id);
            if (producto == null) return;

            // ========== VALIDACIÓN DE STOCK ==========
            int stockDisponible = producto.StockActual;
            var existente = ListaDetalles.FirstOrDefault(d => d.Producto.Id == id);
            int cantidadActualEnDetalle = existente != null ? existente.Cantidad : 0;
            int cantidadTotalSolicitada = cantidadActualEnDetalle + cantidad;

            if (cantidadTotalSolicitada > stockDisponible)
            {
                lblErrorStock.Text = $"Stock insuficiente. Solo hay {stockDisponible} unidad(es) disponible(s).";
                lblErrorStock.Visible = true;
                // Refrescamos el panel del modal para mostrar el error
                upProductos.Update();
                return;
            }
            // =========================================

            float precioUnitario = (float)producto.Precio;
            float subtotal = cantidad * precioUnitario;

            DetalleVenta detalle = new DetalleVenta
            {
                Producto = producto,
                Cantidad = cantidad,
                PrecioUnitario = precioUnitario,
                Subtotal = subtotal
            };

            if (existente != null)
            {
                existente.Cantidad += cantidad;
                existente.Subtotal = existente.Cantidad * existente.PrecioUnitario;
            }
            else
            {
                ListaDetalles.Add(detalle);
            }

            Session["listaDetalles"] = ListaDetalles;
            CargarDetallesGvProductos();

            // Actualizar el panel de detalles (fuera del modal)
            upDetalles.Update();
            // También actualizar el panel del modal (por si se modificó la tabla de productos, aunque no sea necesario)
            upProductos.Update();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument);
            var itemAEliminar = ListaDetalles.FirstOrDefault(d => d.Id == id);
            if (itemAEliminar != null)
            {
                ListaDetalles.Remove(itemAEliminar);
                Session["listaDetalles"] = ListaDetalles;
                CargarDetallesGvProductos();

                upDetalles.Update();
            }
        }

        protected void btnGuardarModal_Click(object sender, EventArgs e)
        {
            bool guardadoExitoso = false;
            if (guardadoExitoso)
            {
                ListaDetalles.Clear();
                Session["listaDetalles"] = ListaDetalles;
                CargarDetallesGvProductos();
                string script = "$('#modalProductos').modal('hide');";
                ScriptManager.RegisterStartupScript(this, GetType(), "CerrarModal", script, true);
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ddlCliente.SelectedValue))
            {
                MostrarMensaje("Seleccione un cliente.", "danger");
                return;
            }

            DateTime fecha;
            if (!DateTime.TryParse(txtFecha.Text, out fecha))
            {
                MostrarMensaje("Fecha inválida.", "danger");
                return;
            }

            if (ListaDetalles == null || ListaDetalles.Count == 0)
            {
                MostrarMensaje("Agregue al menos un producto.", "warning");
                return;
            }

            Dominio.Venta venta = new Dominio.Venta();
            venta.Cliente = new Dominio.Cliente { Id = int.Parse(ddlCliente.SelectedValue) };
            Usuario usuario = (Usuario)Session["usuarioIngresado"];
            venta.Usuario = new Dominio.Usuario();
            venta.Usuario.Id = usuario.Id;
            venta.Detalle = ListaDetalles;
            venta.Fecha = fecha;

            try
            {
                if (Session["idVenta"] != null)
                {
                    venta.Id = Convert.ToInt32(Session["idVenta"]);
                    VentasDatos.Modificar(venta);
                    Session.Remove("idVenta");
                    MostrarMensaje("Venta actualizada con éxito.", "success");
                }
                else
                {
                    VentasDatos.Agregar(venta);
                    MostrarMensaje("Venta registrada con éxito.", "success");
                }

                CargarProductos();
                LimpiarFormulario();
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al procesar la venta: " + ex.Message, "danger");
            }
        }

        private void MostrarMensaje(string texto, string tipo)
        {
            if (string.IsNullOrEmpty(texto))
            {
                lblMensaje.Visible = false;
                lblMensaje.CssClass = "alert d-none";
                return;
            }

            lblMensaje.Visible = true;
            lblMensaje.Text = texto;
            lblMensaje.CssClass = $"alert alert-{tipo}";
        }

        private void LimpiarFormulario()
        {
            ddlCliente.SelectedIndex = 0;
            txtFecha.Text = DateTime.Now.ToString("yyyy-MM-dd");
            txtNumFactura.Text = "";
            ListaDetalles.Clear();
            Session["listaDetalles"] = ListaDetalles;
            CargarDetallesGvProductos();
            lblTotal.Text = "$0.00";
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            LimpiarFormulario();
            MostrarMensaje("", "");
            upDetalles.Update();
        }

        private void CargarCampos(int idVenta)
        {
            Venta venta = VentasDatos.VerVenta(idVenta);
            if (venta == null) return;

            ddlCliente.SelectedValue = venta.Cliente.Id.ToString();
            txtFecha.Text = venta.Fecha.ToString("yyyy-MM-dd");

            List<DetalleVenta> detalles = VentasDatos.GetDetalle(idVenta);
            Session["listaDetalles"] = detalles;
            CargarDetallesGvProductos();
            upDetalles.Update();
        }

        protected void txtBuscarProducto_TextChanged(object sender, EventArgs e)
        {
            List<Dominio.Producto> productos = ProductoDatos.Listar().Where(c => c.Activo && c.StockActual > 0).ToList();
            string filtro = txtBuscarProducto.Text.Trim();
            List<Dominio.Producto> filtrados = productos;

            if (!string.IsNullOrEmpty(filtro))
            {
                filtrados = productos.Where(p => p.Nombre.ToLower().Contains(filtro.ToLower())).ToList();
            }

            gvProductos.DataSource = filtrados;
            gvProductos.DataBind();
        }
    }
}