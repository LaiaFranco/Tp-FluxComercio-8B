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

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Usuario NuevoUsuario = new Usuario();

            UsuarioDatos.Agregar(NuevoUsuario);

        }
    }
}