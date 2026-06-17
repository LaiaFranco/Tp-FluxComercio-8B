using Negocio;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlexComercio
{
    public partial class FormularioCliente : System.Web.UI.Page
    {

        private ClienteNegocio ClienteDatos = new ClienteNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            string dni = txtDNI.Text.Trim();
            string nombre = txtNombre.Text.Trim();

            // Validaciones extra (por si el cliente desactiva JavaScript)
            if (!System.Text.RegularExpressions.Regex.IsMatch(dni, @"^\d{7,8}$"))
            {
                lblMensaje.Text = "DNI inválido (debe tener 7 u 8 dígitos).";
                lblMensaje.CssClass = "alert alert-danger";
                lblMensaje.Visible = true;
                return;
            }

            if (string.IsNullOrEmpty(nombre))
            {
                lblMensaje.Text = "El nombre es obligatorio.";
                lblMensaje.CssClass = "alert alert-danger";
                lblMensaje.Visible = true;
                return;
            }


            Dominio.Cliente NuevoCliente = new Dominio.Cliente();

            NuevoCliente.Dni = txtDNI.Text.Trim();
            NuevoCliente.Nombre = txtNombre.Text.Trim();
            NuevoCliente.Apellido = txtApellido.Text.Trim();
            NuevoCliente.Email = txtEmail.Text.Trim();
            NuevoCliente.Telefono = txtTelefono.Text.Trim();
            NuevoCliente.Direccion = txtDireccion.Text.Trim();
            NuevoCliente.Activo = true;

            ClienteDatos.Agregar(NuevoCliente);

         

            // Aquí guardas en BD...
            lblMensaje.Text = "Cliente guardado exitosamente.";
            lblMensaje.CssClass = "alert alert-success";
            lblMensaje.Visible = true;

            LimpiarCampos();
        }


        private void LimpiarCampos()
        {
            txtDNI.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtEmail.Text = "";
            txtTelefono.Text = "";
            txtDireccion.Text = "";
        }
    }
}