
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;

namespace FlexComercio
{
    public partial class Ventas : System.Web.UI.Page
    {
        private VentasNegocio VentaNegocio = new VentasNegocio();
        
        public List<Venta> ListaVentas { get; set; }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListaVentas = VentaNegocio.Listar();

                if(ListaVentas == null) {
                    ListaVentas = new List<Venta>();
                    
                }
            }
        }

        protected void btnPuntoVenta_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormularioVenta.aspx");
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = btn.CommandArgument;

            if (!string.IsNullOrEmpty(id) || id != null)
            {
                Session["idVenta"] = id;
                Response.Redirect("FormularioVenta.aspx");
            }
            else
            {
                // Manejar error: mostrar mensaje o redirigir
                Response.Redirect("Ventas.aspx");
            }
        }
    }
}