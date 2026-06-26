using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio; 

namespace FlexComercio
{
    public partial class Reporte : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Cliente cliente = new Cliente();
            ClienteNegocio cliNeg = new ClienteNegocio();

            List<Dominio.Cliente> listCliente = cliNeg.Listar().Where(x => x.Activo).ToList();
            int cantClientes = listCliente.Count();

            lblClientes.Text = cantClientes.ToString();

            Venta venta = new Venta();
            VentasNegocio ventNegocio = new VentasNegocio();
            
            DateTime hoy = DateTime.Today;
            List<Venta> listVenta = ventNegocio.Listar().Where(x => x.Fecha.Month == hoy.Month).ToList();
            int cantVentasMes = listVenta.Count();

            lblVentasTotales.Text = cantVentasMes.ToString();

        }
    }
}