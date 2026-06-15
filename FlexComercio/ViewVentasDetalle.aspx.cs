using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;

namespace FlexComercio
{
    public partial class ViewVentasDetalle : System.Web.UI.Page
    {

        private VentasNegocio datos = new VentasNegocio();
        public DetalleVenta detalle { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string idDetalle = Request.QueryString["id"];

                if (!string.IsNullOrEmpty(idDetalle) && int.TryParse(idDetalle, out int parseIdDetalle))
                {
                    
                  
                    //detalle = datos.VerDetalle(parseIdDetalle);
                }
             

                if(string.IsNullOrEmpty(idDetalle)) {
                   // Response.Redirect("Ventas.aspx");
                }

            }
        }
    }
}