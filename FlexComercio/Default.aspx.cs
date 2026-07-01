using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using System.Globalization;

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
                CargarDatosDashboard();
            }
        }

        private void CargarDatosDashboard()
        {
            InicioNegocio negocio = new InicioNegocio();

            decimal totalVentas =
                negocio.ObtenerTotalVentasDelDia();

            int cantidadProductos =
                negocio.ObtenerCantidadProductosActivos();

            int cantidadProductosBajoStock =
                negocio.ObtenerCantidadProductosBajoStock();

            decimal gananciaEstimada =
                negocio.ObtenerGananciaEstimadaVentas();

            lblVentasDelDia.Text =
                "$" + totalVentas.ToString(
                    "N2",
                    CultureInfo.InvariantCulture
                );

            lblProductosRegistrados.Text =
                cantidadProductos.ToString();

            lblProductosBajoStock.Text =
                cantidadProductosBajoStock.ToString();

            lblGananciaEstimada.Text =
                "$" + gananciaEstimada.ToString(
                    "N2",
                    CultureInfo.InvariantCulture
                );
        }

    }
}