using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio; // Asumiendo que Dominio contiene las entidades

namespace FlexComercio
{
    public partial class EditarEstadoVenta : System.Web.UI.Page
    {
        private VentasNegocio VentaDatos = new VentasNegocio();
        private EstadoVentasNegocio EstadoDatos = new EstadoVentasNegocio();
        private int idVenta;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (Session["idVenta"] != null)
                {
                    idVenta = Convert.ToInt32(Session["idVenta"]);
                    Session.Remove("idVenta"); 
                    CargarDatos(idVenta);
                    CargarEstados();
                }
                else
                {
                    MostrarMensaje("No se ha seleccionado una venta.", "danger");
                    btnGuardar.Enabled = false;
                }
            }
        }

        private void CargarDatos(int id)
        {
            Venta venta = VentaDatos.VerVenta(id);
            if (venta == null)
            {
                MostrarMensaje("La venta no existe.", "danger");
                btnGuardar.Enabled = false;
                return;
            }

            lblFactura.Text = $"Factura N° {venta.NumFactura}";
            lblCliente.Text = $"{venta.Cliente.Nombre} {venta.Cliente.Apellido}";
            lblTotal.Text = $"${venta.Total:N2}";
            lblFecha.Text = venta.Fecha.ToString("dd/MM/yyyy HH:mm");
            lblEstadoActual.Text = venta.Estado.Nombre;
            lblEstadoActual.CssClass = GetEstadoClass(venta.Estado.Nombre);

            ViewState["IdVenta"] = id;
        }

        private void CargarEstados()
        {
            var estados = EstadoDatos.Listar();
            ddlNuevoEstado.DataSource = estados;
            ddlNuevoEstado.DataTextField = "Nombre";
            ddlNuevoEstado.DataValueField = "Id";
            ddlNuevoEstado.DataBind();

            if (lblEstadoActual.Text != "-" && !string.IsNullOrEmpty(lblEstadoActual.Text))
            {
                string estadoActual = lblEstadoActual.Text;
                foreach (ListItem item in ddlNuevoEstado.Items)
                {
                    if (item.Text == estadoActual)
                    {
                        item.Selected = true;
                        break;
                    }
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (ViewState["IdVenta"] == null)
            {
                MostrarMensaje("No se puede guardar: falta el ID de la venta.", "danger");
                return;
            }

            int id = Convert.ToInt32(ViewState["IdVenta"]);
            int nuevoEstadoId = Convert.ToInt32(ddlNuevoEstado.SelectedValue);

            try
            {
                VentaDatos.EditarEstado(id, nuevoEstadoId);
                MostrarMensaje("Estado actualizado correctamente.", "success");
          
                Response.Redirect("Ventas.aspx");
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al actualizar el estado: " + ex.Message, "danger");
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Ventas.aspx");
        }

        private void MostrarMensaje(string texto, string tipo)
        {
            lblMensaje.Visible = true;
            lblMensaje.Text = texto;
            lblMensaje.CssClass = $"alert alert-{tipo}";
        }

        private string GetEstadoClass(string estado)
        {
            switch (estado)
            {
                case "Pendiente": return "estado-pendiente";
                case "En preparación": return "estado-preparacion";
                case "Lista para retirar": return "estado-listaretiro";
                case "Entregada": return "estado-entregada";
                default: return "";
            }
        }
    }
}