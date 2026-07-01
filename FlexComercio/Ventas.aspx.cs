using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace FlexComercio
{
    public partial class Ventas : System.Web.UI.Page
    {
        private VentasNegocio VentasDatos = new VentasNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarVentas();
            }
        }

        private void CargarVentas()
        {
            List<Venta> lista = VentasDatos.Listar(); // Asegúrate de tener este método
            if (lista != null && lista.Count > 0)
            {
                gvVentas.DataSource = lista;
                gvVentas.DataBind();
                phSinVentas.Visible = false;
                gvVentas.Visible = true;
            }
            else
            {
                gvVentas.Visible = false;
                phSinVentas.Visible = true;
            }
        }

        protected void gvVentas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "VerDetalle")
            {
                int idVenta = Convert.ToInt32(e.CommandArgument);
                Session["idVenta"] = idVenta;
                Response.Redirect("VerDetalleVenta.aspx");
            }
        }

        protected void btnPuntoVenta_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormularioVenta.aspx");
        }

        protected string GetEstadoClass(string estado)
        {
            switch (estado)
            {
                case "Pendiente":
                    return "estado-pendiente";
                case "En preparación":
                    return "estado-preparacion";
                case "Lista para retirar":
                    return "estado-listaretiro";
                case "Entregada":
                    return "estado-entregada";
                default:
                    return "";
            }
        }


    }
}