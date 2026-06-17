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
            if (!IsPostBack)
            {
                string clienteId = Request.QueryString["cliente"];
                if (!string.IsNullOrEmpty(clienteId) && int.TryParse(clienteId, out int id))
                {
                    txtDNI.Enabled = false;
                    Dominio.Cliente cliente = ClienteDatos.GetCliente(id);
                    if (cliente != null)
                    {
                        txtDNI.Text = cliente.Dni;
                        txtNombre.Text = cliente.Nombre;
                        txtApellido.Text = cliente.Apellido;
                        txtEmail.Text = cliente.Email;
                        txtTelefono.Text = cliente.Telefono;
                        txtDireccion.Text = cliente.Direccion;
                        ViewState["ClienteId"] = id;
                        btnGuardar.Text = "Actualizar Cliente";
                    }
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            string dni = txtDNI.Text.Trim();
            string nombre = txtNombre.Text.Trim();

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

            Dominio.Cliente cliente = new Dominio.Cliente();
            cliente.Dni = txtDNI.Text.Trim();
            cliente.Nombre = txtNombre.Text.Trim();
            cliente.Apellido = txtApellido.Text.Trim();
            cliente.Email = txtEmail.Text.Trim();
            cliente.Telefono = txtTelefono.Text.Trim();
            cliente.Direccion = txtDireccion.Text.Trim();
            cliente.Activo = true;

            if (ViewState["ClienteId"] != null)
            {
                cliente.Id = (int)ViewState["ClienteId"];
                ClienteDatos.Modificar(cliente);
                lblMensaje.Text = "Cliente actualizado exitosamente.";
                Response.Redirect("Cliente.aspx");
            }
            else
            {
                ClienteDatos.Agregar(cliente);
                lblMensaje.Text = "Cliente guardado exitosamente.";
            }

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
            ViewState["ClienteId"] = null;
            btnGuardar.Text = "Guardar Cliente";
        }
    }
}