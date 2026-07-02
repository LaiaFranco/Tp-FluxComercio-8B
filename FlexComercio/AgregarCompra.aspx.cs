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
    public partial class AgregarCompra : System.Web.UI.Page
    {
        private CompraNegocio compraNegocio;
        private ProveedorNegocio proveedorNegocio;

        public AgregarCompra()
        {
            compraNegocio = new CompraNegocio();
            proveedorNegocio = new ProveedorNegocio();
        }

        private List<DetalleCompra> ListaDetalles
        {
            get
            {
                List<DetalleCompra> lista =
                    Session["listaDetallesCompra"]
                    as List<DetalleCompra>;

                if (lista == null)
                {
                    lista =
                        new List<DetalleCompra>();

                    Session["listaDetallesCompra"] =
                        lista;
                }

                return lista;
            }
            set
            {
                Session["listaDetallesCompra"] =
                    value;
            }
        }

        protected void Page_Load(
            object sender,
            EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["usuarioIngresado"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                ListaDetalles =
                    new List<DetalleCompra>();

                txtFecha.Text =
                    DateTime.Today.ToString("yyyy-MM-dd");

                txtNumeroCompra.Text =
                    "Se genera al guardar";

                Usuario usuario =
                    (Usuario)Session["usuarioIngresado"];

                txtComprador.Text =
                    usuario.Nombre;

                CargarProveedores();
                CargarProductos();
                CargarDetalles();
            }
        }

        private void CargarProveedores()
        {
            try
            {
                List<Dominio.Proveedor> proveedores =
                    proveedorNegocio
                        .Listar()
                        .Where(p => p.Activo)
                        .ToList();

                ddlProveedor.DataSource =
                    proveedores;

                ddlProveedor.DataTextField =
                    "Nombre";

                ddlProveedor.DataValueField =
                    "Id";

                ddlProveedor.DataBind();

                ddlProveedor.Items.Insert(
                    0,
                    new ListItem(
                        "-- Seleccionar proveedor --",
                        ""
                    )
                );
            }
            catch (Exception ex)
            {
                MostrarMensaje(
                    "No se pudieron cargar los proveedores: "
                    + ex.Message
                );
            }
        }

        private void CargarProductos(
            string filtro = "")
        {
            try
            {
                List<Dominio.Producto> productos =
                    new List<Dominio.Producto>();

                int idProveedor;

                if (int.TryParse(
                    ddlProveedor.SelectedValue,
                    out idProveedor))
                {
                    productos =
                        compraNegocio
                            .ListarPorProveedor(
                                idProveedor
                            )
                            .Where(p => p.Activo)
                            .ToList();

                    if (!string.IsNullOrWhiteSpace(
                        filtro))
                    {
                        productos = productos
                            .Where(p =>
                                p.Nombre
                                    .ToLower()
                                    .Contains(
                                        filtro.ToLower()
                                    )
                            )
                            .ToList();
                    }
                }

                Session["productosCompra"] =
                    productos;

                gvProductos.DataSource =
                    productos;

                gvProductos.DataBind();
            }
            catch (Exception ex)
            {
                MostrarMensaje(
                    "No se pudieron cargar los productos: "
                    + ex.Message
                );
            }
        }

        private void CargarDetalles()
        {
            gvDetalles.DataSource =
                ListaDetalles;

            gvDetalles.DataBind();

            decimal total =
                ListaDetalles.Sum(
                    d => (decimal)d.Subtotal
                );

            lblTotal.Text =
                total.ToString("C2");
        }

        protected void ddlProveedor_SelectedIndexChanged(
            object sender,
            EventArgs e)
        {
            ListaDetalles =
                new List<DetalleCompra>();

            txtBuscarProducto.Text =
                "";

            CargarDetalles();
            CargarProductos();
        }

        protected void btnAgregar_Click(
            object sender,
            EventArgs e)
        {
            Button boton =
                (Button)sender;

            int idProducto =
                Convert.ToInt32(
                    boton.CommandArgument
                );

            GridViewRow fila =
                (GridViewRow)boton.NamingContainer;

            TextBox txtCantidad =
                (TextBox)fila.FindControl(
                    "txtCantidad"
                );

            int cantidad;

            if (!int.TryParse(
                txtCantidad.Text,
                out cantidad))
            {
                MostrarMensaje(
                    "La cantidad ingresada no es válida."
                );

                return;
            }

            if (cantidad <= 0)
            {
                MostrarMensaje(
                    "La cantidad debe ser mayor a cero."
                );

                return;
            }

            List<Dominio.Producto> productos =
                Session["productosCompra"]
                as List<Dominio.Producto>;

            if (productos == null)
            {
                MostrarMensaje(
                    "No se encontró la lista de productos."
                );

                return;
            }

            Dominio.Producto producto =
                productos.FirstOrDefault(
                    p => p.Id == idProducto
                );

            if (producto == null)
            {
                MostrarMensaje(
                    "No se encontró el producto seleccionado."
                );

                return;
            }

            DetalleCompra existente =
                ListaDetalles.FirstOrDefault(
                    d =>
                        d.Producto.Id
                        == idProducto
                );

            if (existente != null)
            {
                existente.Cantidad +=
                    cantidad;

                existente.Subtotal =
                    existente.Cantidad
                    * existente.PrecioUnitario;
            }
            else
            {
                DetalleCompra detalle =
                    new DetalleCompra();

                detalle.Producto =
                    producto;

                detalle.Cantidad =
                    cantidad;

                detalle.PrecioUnitario =
                    producto.Precio;

                detalle.Subtotal =
                    cantidad
                    * producto.Precio;

                ListaDetalles.Add(
                    detalle
                );
            }

            Session["listaDetallesCompra"] =
                ListaDetalles;

            CargarDetalles();
        }

        protected void btnAumentar_Click(
            object sender,
            EventArgs e)
        {
            CambiarCantidad(
                sender,
                1
            );
        }

        protected void btnDisminuir_Click(
            object sender,
            EventArgs e)
        {
            CambiarCantidad(
                sender,
                -1
            );
        }

        private void CambiarCantidad(
            object sender,
            int diferencia)
        {
            Button boton =
                (Button)sender;

            int idProducto =
                Convert.ToInt32(
                    boton.CommandArgument
                );

            DetalleCompra detalle =
                ListaDetalles.FirstOrDefault(
                    d =>
                        d.Producto.Id
                        == idProducto
                );

            if (detalle == null)
                return;

            detalle.Cantidad +=
                diferencia;

            if (detalle.Cantidad <= 0)
            {
                ListaDetalles.Remove(
                    detalle
                );
            }
            else
            {
                detalle.Subtotal =
                    detalle.Cantidad
                    * detalle.PrecioUnitario;
            }

            Session["listaDetallesCompra"] =
                ListaDetalles;

            CargarDetalles();
        }

        protected void btnEliminar_Click(
            object sender,
            EventArgs e)
        {
            Button boton =
                (Button)sender;

            int idProducto =
                Convert.ToInt32(
                    boton.CommandArgument
                );

            DetalleCompra detalle =
                ListaDetalles.FirstOrDefault(
                    d =>
                        d.Producto.Id
                        == idProducto
                );

            if (detalle != null)
            {
                ListaDetalles.Remove(
                    detalle
                );
            }

            Session["listaDetallesCompra"] =
                ListaDetalles;

            CargarDetalles();
        }

        protected void btnRegistrarCompra_Click(
            object sender,
            EventArgs e)
        {
            int idProveedor;

            if (!int.TryParse(
                ddlProveedor.SelectedValue,
                out idProveedor))
            {
                MostrarMensaje(
                    "Debe seleccionar un proveedor."
                );

                return;
            }

            DateTime fecha;

            if (!DateTime.TryParse(
                txtFecha.Text,
                out fecha))
            {
                MostrarMensaje(
                    "La fecha ingresada no es válida."
                );

                return;
            }

            if (ListaDetalles == null
                || ListaDetalles.Count == 0)
            {
                MostrarMensaje(
                    "Debe agregar al menos un producto."
                );

                return;
            }

            Usuario usuario =
                Session["usuarioIngresado"]
                as Usuario;

            if (usuario == null)
            {
                Response.Redirect(
                    "Login.aspx"
                );

                return;
            }

            Compra compra =
                new Compra();

            compra.Fecha =
                fecha;

            compra.Proveedor =
                new Dominio.Proveedor();

            compra.Proveedor.Id =
                idProveedor;

            compra.Usuario =
                new Usuario();

            compra.Usuario.Id =
                usuario.Id;

            compra.Detalles =
                ListaDetalles;

            try
            {
                int idCompra =
                    compraNegocio.Agregar(
                        compra
                    );

                txtNumeroCompra.Text =
                    idCompra.ToString();

                ListaDetalles =
                    new List<DetalleCompra>();

                Session["listaDetallesCompra"] =
                    ListaDetalles;

                CargarDetalles();
                CargarProductos();

                string script = @"
                    Swal.fire({
                        title: 'Éxito',
                        text: 'Compra agregada correctamente',
                        icon: 'success',
                        confirmButtonText: 'Aceptar'
                    }).then(() => {
                        window.location = 'Compras.aspx';
                    });
                    ";

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "SweetAlertCompra",
                    script,
                    true
                );
            }
            catch (Exception ex)
            {
                MostrarMensaje(
                    "No se pudo registrar la compra: "
                    + ex.Message
                );
            }
        }

        protected void btnLimpiar_Click(
            object sender,
            EventArgs e)
        {
            ListaDetalles =
                new List<DetalleCompra>();

            Session["listaDetallesCompra"] =
                ListaDetalles;

            ddlProveedor.SelectedIndex =
                0;

            txtFecha.Text =
                DateTime.Today.ToString(
                    "yyyy-MM-dd"
                );

            txtNumeroCompra.Text =
                "Se genera al guardar";

            txtBuscarProducto.Text =
                "";

            CargarDetalles();
            CargarProductos();
        }

        protected void txtBuscarProducto_TextChanged(
            object sender,
            EventArgs e)
        {
            CargarProductos(
                txtBuscarProducto
                    .Text
                    .Trim()
            );

            ScriptManager.RegisterStartupScript(
                this,
                GetType(),
                "abrirModalProductos",
                "abrirModalProductos();",
                true
            );
        }

        private void MostrarMensaje(
            string mensaje)
        {
            string textoSeguro =
                HttpUtility
                    .JavaScriptStringEncode(
                        mensaje
                    );

            ClientScript.RegisterStartupScript(
                GetType(),
                "mensajeCompra",
                "alert('"
                    + textoSeguro
                    + "');",
                true
            );
        }
    }
}
