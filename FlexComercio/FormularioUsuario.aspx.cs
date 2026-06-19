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
        private UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
        private int? idUsuarioEdicion = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarRoles();

                if (Request.QueryString["venta"] != null)
                {
                    int id;
                    if (int.TryParse(Request.QueryString["venta"], out id))
                    {
                        idUsuarioEdicion = id;
                        CargarUsuario(id);
                        ConfigurarModoEdicion();
                    }
                }
            }
        }

        private void CargarRoles()
        {
            var roles = new RolNegocio().Listar();
            ddlRol.DataSource = roles;
            ddlRol.DataTextField = "nombre";
            ddlRol.DataValueField = "id";
            ddlRol.DataBind();
            ddlRol.Items.Insert(0, new ListItem("-- Seleccione --", ""));
        }

        private void CargarUsuario(int id)
        {
            Usuario usuario = usuarioNegocio.GetUsuario(id);
            if (usuario != null)
            {
                txtNombre.Text = usuario.Nombre;
                txtEmail.Text = usuario.Email;
                txtPassword.Text = usuario.Password;
                ddlRol.SelectedValue = usuario.Rol.Id.ToString();
            }
            else
            {
                MostrarMensaje("Usuario no encontrado.", "danger");
            }
        }

        private void ConfigurarModoEdicion()
        {
            lblPassword.Text = "Contraseña (dejar en blanco para mantener)";
            txtPassword.Attributes["placeholder"] = "Dejar en blanco para mantener la actual";
            txtPassword.Enabled = false;
            rfvPassword.Enabled = false;
            revPassword.Enabled = false;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                MostrarMensaje("Por favor, corrija los errores marcados.", "danger");
                return;
            }

            string nombre = txtNombre.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            int idRol;
            if (!int.TryParse(ddlRol.SelectedValue, out idRol) || idRol <= 0)
            {
                MostrarMensaje("Debe seleccionar un rol válido.", "danger");
                return;
            }

            if (string.IsNullOrEmpty(nombre))
            {
                MostrarMensaje("El nombre es obligatorio.", "danger");
                return;
            }
            if (string.IsNullOrEmpty(email) || !IsValidEmail(email))
            {
                MostrarMensaje("El email es obligatorio y debe tener formato válido.", "danger");
                return;
            }

            try
            {
                if (idUsuarioEdicion.HasValue)
                {
                    Usuario usuario = new Usuario();
                    usuario.Id = idUsuarioEdicion.Value;
                    usuario.Nombre = nombre;
                    usuario.Email = email;

                    if (!string.IsNullOrEmpty(password))
                    {
                        if (password.Length < 6)
                        {
                            MostrarMensaje("La contraseña debe tener al menos 6 caracteres.", "danger");
                            return;
                        }
                        usuario.Password = password;
                    }
                    else
                    {
                        Usuario existente = usuarioNegocio.GetUsuario(idUsuarioEdicion.Value);
                        usuario.Password = existente.Password;
                    }

                    Rol NuevoRol = new Rol();
                    NuevoRol.Id = idRol;
                    usuario.Rol = NuevoRol;
                    usuario.Activo = true;

                    usuarioNegocio.Modificar(usuario);
                    MostrarMensaje("Usuario actualizado correctamente.", "success");
                }
                else
                {
                    if (string.IsNullOrEmpty(password) || password.Length < 6)
                    {
                        MostrarMensaje("La contraseña es obligatoria y debe tener al menos 6 caracteres.", "danger");
                        return;
                    }

                    Usuario nuevo = new Usuario();
                    nuevo.Nombre = nombre;
                    nuevo.Email = email;
                    nuevo.Password = password;
                    Rol NuevaRol = new Rol();
                    NuevaRol.Id = idRol;
                    nuevo.Rol = NuevaRol;
                    nuevo.Activo = true;

                    usuarioNegocio.Agregar(nuevo);
                    MostrarMensaje($"Usuario creado exitosamente", "success");
                    LimpiarCampos();
                }
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("duplicate") || ex.Message.Contains("UNIQUE"))
                {
                    MostrarMensaje("El email ya está registrado. Por favor, use otro.", "danger");
                }
                else
                {
                    MostrarMensaje("Error al guardar: " + ex.Message, "danger");
                }
            }
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

        private void MostrarMensaje(string mensaje, string tipo)
        {
            lblMensaje.Text = mensaje;
            lblMensaje.CssClass = $"alert alert-{tipo} w-100";
            lblMensaje.Visible = true;
        }

        private void LimpiarCampos()
        {
            txtNombre.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            ddlRol.SelectedIndex = 0;
        }
    }
}