using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlexComercio
{
    public partial class Default : System.Web.UI.Page
    {
        ProductoNegocio productoNegocio = new ProductoNegocio();
        VentasNegocio ventasNegocio = new VentasNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDashboard();
            }
        }

        private void CargarDashboard()
        {
            // Productos
            List<Dominio.Producto> productos = productoNegocio.Listar();

            lblProductos.Text =  productos.Count.ToString();

            lblStockBajo.Text = productos
                .Count(p => p.StockActual <= p.StockMinimo)
                .ToString();

            // Ventas
            decimal ventasHoy = ventasNegocio.ObtenerVentasDelDia();

            lblVentasDia.Text =  ventasHoy.ToString("C2");

            decimal ganancia =  ventasNegocio.ObtenerGananciaDelDia();

            lblGanancia.Text =  ganancia.ToString("C2");
        }

    }
}