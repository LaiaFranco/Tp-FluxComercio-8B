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
    public partial class MisVentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuario usuario = new Usuario();
                VentasNegocio negocio = new VentasNegocio(); 

                usuario = (Usuario)Session["usuarioIngresado"];

                DateTime hoy = DateTime.Today; 
                
                List<Venta> listaVenta = negocio.Listar();
                listaVenta = listaVenta.Where(x => ( x.Usuario != null && x.Usuario.Id == usuario.Id && x.Fecha.Date.Day == hoy.Day && x.Fecha.Date.Month == hoy.Month && x.Fecha.Date.Year == hoy.Year)).ToList();
                
                int cantidad = listaVenta.Count;

                lblFecha.Text = DateTime.Today.ToString("dd/MM/yyyy");
                lblCantidadVentas.Text = cantidad.ToString();

            }
        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnVerFactura_Click(object sender, EventArgs e)
        {

        }
    }
}