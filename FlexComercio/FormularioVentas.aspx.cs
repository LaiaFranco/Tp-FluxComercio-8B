using Dominio;
using Negocio;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebSockets;
using System.Xml.Linq;



namespace FlexComercio
{
    public partial class FormularioVentas : System.Web.UI.Page
    {
        private ClienteNegocio ClienteDatos = new ClienteNegocio();
        private ProductoNegocio ProductoDatos = new ProductoNegocio();

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
            }
        }

        private void CargarClientes()
        {
            List<Dominio.Cliente> Clientes = ClienteDatos.Listar();
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
            List<Dominio.Producto> productos = ProductoDatos.Listar();
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

            float precioUnitario = (float)producto.Precio;
            float subtotal = cantidad * precioUnitario;

            DetalleVenta detalle = new DetalleVenta
            {
                Producto = producto,
                Cantidad = cantidad,
                PrecioUnitario = precioUnitario,
                Subtotal = subtotal
            };

            var existente = ListaDetalles.FirstOrDefault(d => d.Producto.Id == id);
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
    }
}