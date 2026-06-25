using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace FlexComercio
{
    public partial class Cotizaciones : System.Web.UI.Page
    {
        private ProductoNegocio ProductosDatos = new ProductoNegocio();
        [Serializable]  
        public class ItemCotizacion
        {
            public int IdProducto { get; set; }
            public string Nombre { get; set; }
            public int Cantidad { get; set; }
            public float PrecioUnitario { get; set; }
            public float Subtotal => Cantidad * PrecioUnitario;
        }

        private List<ItemCotizacion> Items
        {
            get
            {
                if (ViewState["ItemsCotizacion"] == null)
                    ViewState["ItemsCotizacion"] = new List<ItemCotizacion>();
                return (List<ItemCotizacion>)ViewState["ItemsCotizacion"];
            }
            set => ViewState["ItemsCotizacion"] = value;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatos();
                ActualizarVista();
            }
        }

        private void CargarDatos()
        {
            // Obtener productos activos y con stock > 0
            var productos = ProductosDatos.Listar()
                .Where(p => p.Activo && p.StockActual > 0)
                .Select(p => new
                {
                    p.Id,
                    Texto = $"{p.Nombre} - ${p.Precio:F2}"
                })
                .ToList();

            ddlProductos.DataSource = productos;
            ddlProductos.DataTextField = "Texto";
            ddlProductos.DataValueField = "Id";
            ddlProductos.DataBind();

            // Agregar opción por defecto
            ddlProductos.Items.Insert(0, new ListItem("Seleccionar producto...", ""));
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ddlProductos.SelectedValue))
                return;

            int idProducto = Convert.ToInt32(ddlProductos.SelectedValue);
            int cantidad = Convert.ToInt32(txtCantidad.Text.Trim());
            if (cantidad < 1) cantidad = 1;

            // Buscar el producto en la lista original (no en la base de datos)
            var producto = ProductosDatos.Listar()
                .FirstOrDefault(p => p.Id == idProducto && p.Activo && p.StockActual > 0);

            if (producto == null)
                return;

            var items = Items;
            var existente = items.Find(p => p.IdProducto == idProducto);
            if (existente != null)
            {
                existente.Cantidad += cantidad;
            }
            else
            {
                items.Add(new ItemCotizacion
                {
                    IdProducto = idProducto,
                    Nombre = producto.Nombre,
                    Cantidad = cantidad,
                    PrecioUnitario = producto.Precio
                });
            }
            Items = items;

            txtCantidad.Text = "1";
            ActualizarVista();
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            Items = new List<ItemCotizacion>();
            ActualizarVista();
        }

        private void ActualizarVista()
        {
            var items = Items;

            // GridView
            gvProductos.DataSource = items;
            gvProductos.DataBind();

            // Repeater Resumen
            rptResumen.DataSource = items;
            rptResumen.DataBind();

            // Mostrar/Ocultar mensaje "Sin productos"
            phSinProductos.Visible = (items.Count == 0);

            // Totales
            float total = 0;
            int totalCantidad = 0;
            foreach (var item in items)
            {
                total += item.Subtotal;
                totalCantidad += item.Cantidad;
            }
            lblTotal.InnerText = total.ToString("C2");
            lblCantidadResumen.InnerText = totalCantidad + " producto" + (totalCantidad != 1 ? "s" : "");
        }
    }
}