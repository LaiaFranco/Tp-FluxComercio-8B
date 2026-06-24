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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();

            string user;
            string pass;

            user = txtEmail.Text;
            pass = txtPassword.Text;

            usuario = negocio.GetUsuarioCredenciales(user, pass);

            if (usuario != null)
            {
                Session.Add("usuarioIngresado", usuario);
                if (usuario.Rol.Id == 1)
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Response.Redirect("DefaultVendedor.aspx");
                }
            }
            else
            {
                lblError.Text = "Usuario y/o contraseña incorrecta";
                lblError.Visible = true;
            }
        }
    }
    
}