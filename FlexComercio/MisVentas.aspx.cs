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
        private VentasNegocio VentasDatos = new VentasNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuario usuario = new Usuario();
                VentasNegocio negocio = new VentasNegocio();

                usuario = (Usuario)Session["usuarioIngresado"];

                DateTime hoy = DateTime.Today;

                List<Venta> listaVenta = negocio.Listar();
                List<Venta> listaFiltrada = listaVenta.Where(c => c.Usuario.Id == usuario.Id && c.Fecha.Date.Day == hoy.Day && c.Fecha.Date.Month == hoy.Month && c.Fecha.Date.Year == hoy.Year).ToList();

                int cantidad = listaFiltrada.Count();

                float totalAcumulado = (float)listaFiltrada.Sum(v => v.Total);
                
                lblFecha.Text = DateTime.Today.ToString("dd/MM/yyyy");
                lblCantidadVentas.Text = cantidad.ToString();
                lblTotalAcumulado.Text = totalAcumulado.ToString();  

                var datos = listaFiltrada.Select(v => new
                {
                    v.Id,
                    v.NumFactura,
                    v.Fecha,
                    Cliente = v.Cliente.Nombre + " " + v.Cliente.Apellido,
                    CantidadProductos = VentasDatos.GetDetalle(v.Id).Count,
                    v.Estado,
                    v.Total
                }).ToList();
                
                dgvVentas.DataSource = datos;
                dgvVentas.DataBind();
            } 
        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnVerFactura_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int idVenta = Convert.ToInt32(btn.CommandArgument);

            Session["idVenta"] = idVenta;
            Response.Redirect("VerDetalleVenta.aspx");
        }

        protected void btnEditarEstado_Click(object sender, EventArgs e)
        {

            Button btn = (Button)sender;
            int idVenta = Convert.ToInt32(btn.CommandArgument);

            Session["idVenta"] = idVenta;
            Response.Redirect("EditarEstadoVenta.aspx");
        }
    }
}