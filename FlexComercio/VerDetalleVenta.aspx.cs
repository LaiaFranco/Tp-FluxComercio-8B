using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace FlexComercio
{
    public partial class DetalleVenta : System.Web.UI.Page
    {
        private VentasNegocio VentasDatos = new VentasNegocio();
        public Venta DatosVenta = new Venta();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                int? idVenta = Session["idVenta"] as int?;
                if (idVenta == null)
                {
                    Response.Redirect("Ventas.aspx");
                    return;
                }

            
                CargarDatosVenta(idVenta.Value);
            }
        }

        private void CargarDatosVenta(int idVenta)
        {
           
            Venta venta = VentasDatos.VerVenta(idVenta);  
            if (venta != null)
            {
                lblCliente.Text = venta.Cliente.Nombre ?? "Sin cliente";
                lblFecha.Text = venta.Fecha.ToString("dd/MM/yyyy HH:mm");
                lblVendedor.Text = venta.Cliente.Nombre ?? "Sin vendedor";
                lblTotalDetalle.Text = venta.Total.ToString("C2");

                DatosVenta = venta;   
            }

      
            List<Dominio.DetalleVenta> detalles = VentasDatos.VerDetallesPorVenta(idVenta); 
            gvDetalleProductos.DataSource = detalles;
            gvDetalleProductos.DataBind();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Ventas.aspx");
        }
    }
}