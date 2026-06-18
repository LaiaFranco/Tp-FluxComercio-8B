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
    public partial class Usuarios : System.Web.UI.Page
    {
        private UsuarioNegocio UsuarioDatos = new UsuarioNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                CargarUsuarios();
            }

        }


       private void CargarUsuarios()
        {
            List<Usuario> usuariosLista = UsuarioDatos.Listar().Where(u => u.Activo).ToList();

            gvUsuarios.DataSource = usuariosLista;
            gvUsuarios.DataBind();
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormularioUsuario.aspx");
        }
    }
}