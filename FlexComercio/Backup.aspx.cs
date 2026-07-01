using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlexComercio
{
    public partial class Backup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnMostrar_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            ViewState["Modulo"] = btn.CommandArgument;

            ScriptManager.RegisterStartupScript(
                this,
                GetType(),
                "modal",
                "var modal = new bootstrap.Modal(document.getElementById('modalPassword')); modal.show();",
                true);
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            Usuario usuario = Session["usuarioIngresado"] as Usuario;

            if (usuario == null)
            {
                lblError.Visible = true;
                lblError.Text = "No hay ningún usuario en la sesión.";
                return;
            }

            if (string.IsNullOrEmpty(usuario.Password))
            {
                lblError.Visible = true;
                lblError.Text = "El usuario no tiene contraseña cargada.";
                return;
            }

            if (txtPassword.Text.Trim() == usuario.Password.Trim())
            {
                Response.Redirect("BackupDetalle.aspx?modulo=" + ViewState["Modulo"]);
            }

            lblError.Visible = true;
            lblError.Text = "Contraseña incorrecta.";

            ScriptManager.RegisterStartupScript(
                this,
                GetType(),
                "modal",
                "var modal = new bootstrap.Modal(document.getElementById('modalPassword')); modal.show();",
                true);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {

        }
    }
}