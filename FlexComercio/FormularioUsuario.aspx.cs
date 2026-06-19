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
    public partial class FormularioUsuario : System.Web.UI.Page
    {
        private RolNegocio RolDatos = new RolNegocio();
        private UsuarioNegocio UsuarioDatos = new UsuarioNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarRoles();
            }
        }

        private void CargarRoles()
        {
            ddlRol.DataSource = RolDatos.Listar();

            ddlRol.DataTextField = "Nombre";
            ddlRol.DataValueField = "Id";

            ddlRol.DataBind();
        }

        private void MostrarMensaje(string mensaje, string tipo)
        {
            lblMensaje.Text = mensaje;
            lblMensaje.CssClass = $"alert alert-{tipo} w-100";
            lblMensaje.Visible = true;
        }

        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        private void LimpiarCampos()
        {
            txtNombre.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            ddlRol.SelectedIndex = 0;
       
        }


        protected void btnGuardar_Click(object sender, EventArgs e)
        {
           
            if (!Page.IsValid)
            {
                MostrarMensaje("Por favor, corrija los errores marcados en el formulario.", "danger");
                return;
            }

        
            string nombre = txtNombre.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            int idRol = 0;

            // Validar nombre
            if (string.IsNullOrEmpty(nombre))
            {
                MostrarMensaje("El nombre es obligatorio.", "danger");
                return;
            }

            // Validar email
            if (string.IsNullOrEmpty(email))
            {
                MostrarMensaje("El email es obligatorio.", "danger");
                return;
            }
            if (!IsValidEmail(email))
            {
                MostrarMensaje("El formato del email no es válido.", "danger");
                return;
            }

            // Validar contraseña
            if (string.IsNullOrEmpty(password))
            {
                MostrarMensaje("La contraseña es obligatoria.", "danger");
                return;
            }
            if (password.Length < 6)
            {
                MostrarMensaje("La contraseña debe tener al menos 6 caracteres.", "danger");
                return;
            }

            // Validar rol
            if (!int.TryParse(ddlRol.SelectedValue, out idRol) || idRol <= 0)
            {
                MostrarMensaje("Debe seleccionar un rol válido.", "danger");
                return;
            }

            // 3. Todas las validaciones pasaron, intentamos guardar
            try
            {
                Usuario nuevoUsuario = new Usuario();
                nuevoUsuario.Nombre = nombre;
                nuevoUsuario.Email = email;
                nuevoUsuario.Password = (password);

                Rol NuevoRol = new Rol();
                NuevoRol.Id = idRol;

                nuevoUsuario.Rol = NuevoRol;
                nuevoUsuario.Activo = true;

                 UsuarioDatos.Agregar(nuevoUsuario);

                MostrarMensaje($"¡Usuario creado exitosamente !", "success");

                // Opcional: limpiar campos después de guardar
                LimpiarCampos();
            }
            catch (Exception ex)
            {
                // Capturar errores como email duplicado
                if (ex.Message.Contains("duplicate") || ex.Message.Contains("UNIQUE") || ex.Message.Contains("Violation of UNIQUE KEY"))
                {
                    MostrarMensaje("El email ya está registrado. Por favor, use otro.", "danger");
                }
                else
                {
                    MostrarMensaje($"Error al guardar: {ex.Message}", "danger");
                }
            }
            ;

        }
    }
}