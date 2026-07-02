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
        private int? idUsuarioEliminar = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarRoles();

                if (Session["idUsuarioEliminar"] != null)
                {
                    idUsuarioEliminar = Convert.ToInt32(Session["idUsuarioEliminar"]);
                    Session.Remove("idUsuarioEliminar");
                    CargarUsuarioParaBorrar(idUsuarioEliminar.Value);
                    return;
                }

                if (Session["idUsuarioModificar"] != null)
                {
                    idUsuarioEdicion = Convert.ToInt32(Session["idUsuarioModificar"]);
                    Session.Remove("idUsuarioModificar");
                    CargarUsuarioParaEdicion(idUsuarioEdicion.Value);
                    return;
                }

                if (Request.QueryString["usuario"] != null)
                {
                    int id;
                    if (int.TryParse(Request.QueryString["usuario"], out id))
                    {
                        idUsuarioEdicion = id;
                        CargarUsuarioParaEdicion(id);
                        return;
                    }
                }

                ConfigurarModoCreacion();
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

        private void CargarUsuarioParaBorrar(int id)
        {
            Usuario usuario = usuarioNegocio.GetUsuario(id);
            if (usuario == null)
            {
                MostrarMensaje("Usuario no encontrado.", "danger");
                return;
            }

            divFormulario.Visible = false;
            divConfirmarEliminar.Visible = true;
            lblTitulo.Text = "Eliminar Usuario";

            lblConfirmNombre.Text = usuario.Nombre;
            lblConfirmEmail.Text = usuario.Email;
            lblConfirmRol.Text = usuario.Rol?.Nombre ?? "Sin rol";

            ViewState["UsuarioIdBorrar"] = id;
        }

        private void CargarUsuarioParaEdicion(int id)
        {
            Usuario usuario = usuarioNegocio.GetUsuario(id);
            if (usuario != null)
            {
                txtNombre.Text = usuario.Nombre;
                txtEmail.Text = usuario.Email;
                txtPassword.Text = usuario.Password;
                ddlRol.SelectedValue = usuario.Rol.Id.ToString();

                ViewState["UsuarioId"] = id;
                btnGuardar.Text = "Actualizar usuario";
                lblTitulo.Text = "Editar Usuario";
                lblPassword.Text = "Contraseña (dejar en blanco para mantener)";
                txtPassword.Attributes["placeholder"] = "Dejar en blanco para mantener la actual";

                txtPassword.Enabled = true;
                rfvPassword.Enabled = false;
                revPassword.Enabled = false;

                divFormulario.Visible = true;
                divConfirmarEliminar.Visible = false;
            }
        }

        private void ConfigurarModoCreacion()
        {
            txtPassword.Enabled = true;
            rfvPassword.Enabled = true;
            revPassword.Enabled = true;
            lblPassword.Text = "Contraseña";
            txtPassword.Attributes["placeholder"] = "";

            btnGuardar.Text = "Guardar usuario";
            lblTitulo.Text = "Nuevo Usuario";

            divFormulario.Visible = true;
            divConfirmarEliminar.Visible = false;
            ViewState["UsuarioId"] = null;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid && rfvPassword.Enabled)
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
                bool esEdicion = ViewState["UsuarioId"] != null;

                Usuario usuario = new Usuario();
                usuario.Nombre = nombre;
                usuario.Email = email;
                Rol rol = new Rol { Id = idRol };
                usuario.Rol = rol;
                usuario.Activo = true;

                if (esEdicion)
                {
                    usuario.Id = (int)ViewState["UsuarioId"];

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
                        Usuario existente = usuarioNegocio.GetUsuario(usuario.Id);
                        usuario.Password = existente.Password;
                    }

                    usuarioNegocio.Modificar(usuario);
                    
                    MostrarSweetAlert(
                        "Éxito",
                        "Usuario modificado correctamente.",
                        "success",
                        true
                    );
                }
                else
                {
                    if (string.IsNullOrEmpty(password) || password.Length < 6)
                    {
                        MostrarMensaje("La contraseña es obligatoria y debe tener al menos 6 caracteres.", "danger");
                        return;
                    }
                    usuario.Password = password;
                    usuarioNegocio.Agregar(usuario);

                    MostrarSweetAlert(
                        "Éxito",
                        "Usuario agregado correctamente.",
                        "success",
                        true
                    );
                }
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("duplicate") || ex.Message.Contains("UNIQUE"))
                    MostrarMensaje("El email ya está registrado. Por favor, use otro.", "danger");
                else
                    MostrarMensaje("Error al guardar: " + ex.Message, "danger");
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (ViewState["UsuarioIdBorrar"] != null)
            {
                int id = (int)ViewState["UsuarioIdBorrar"];
                usuarioNegocio.Eliminar(id);

                MostrarSweetAlert(
                    "Éxito",
                    "Usuario eliminado correctamente.",
                    "success",
                    true
                );
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usuarios.aspx");
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
            ViewState["UsuarioId"] = null;
            btnGuardar.Text = "Guardar usuario";
            lblTitulo.Text = "Nuevo Usuario";
        }

        private void MostrarSweetAlert(string titulo, string mensaje, string icono, bool redirigir = false)
        {
            string script;

            if (redirigir)
            {
                script = $@"
            Swal.fire({{
                title: '{titulo}',
                text: '{mensaje}',
                icon: '{icono}',
                confirmButtonText: 'Aceptar'
            }}).then(() => {{
                window.location = 'Usuarios.aspx';
            }});";
            }
            else
            {
                script = $@"
            Swal.fire({{
                title: '{titulo}',
                text: '{mensaje}',
                icon: '{icono}',
                confirmButtonText: 'Aceptar'
            }});";
            }

            ClientScript.RegisterStartupScript(
                this.GetType(),
                Guid.NewGuid().ToString(),
                script,
                true);
        }
    }
}