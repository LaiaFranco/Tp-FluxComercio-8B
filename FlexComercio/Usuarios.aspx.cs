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

            Session["listaUsuarios"] = usuariosLista;
            gvUsuarios.DataSource = usuariosLista;
            gvUsuarios.DataBind();
        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            string filtro = txtBuscar.Text.Trim().ToUpper();

            List<Usuario> usuariosLista = (List<Usuario>)Session["listaUsuarios"];

            if (usuariosLista == null)
            {
                usuariosLista = UsuarioDatos.Listar().Where(u => u.Activo).ToList();
                Session["listaUsuarios"] = usuariosLista;
            }

            if (!string.IsNullOrEmpty(filtro))
            {
                usuariosLista = usuariosLista.Where(u =>
                    (u.Nombre != null && u.Nombre.ToUpper().Contains(filtro)) ||
                    (u.Email != null && u.Email.ToUpper().Contains(filtro)) ||
                    (u.Rol != null && u.Rol.Nombre != null && u.Rol.Nombre.ToUpper().Contains(filtro))
                ).ToList();
            }

            gvUsuarios.DataSource = usuariosLista;
            gvUsuarios.DataBind();
        }

        private void CargarInputs(int id)
        {
            UsuarioDatos.GetUsuario(id);
        }


        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormularioUsuario.aspx");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;


            string idStr = btn.CommandArgument;


            if (int.TryParse(idStr, out int id))
            {


                Session["idUsuarioEliminar"] = id;
                Response.Redirect("FormularioUsuario.aspx");
            }


        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;


            string idStr = btn.CommandArgument;


            if (int.TryParse(idStr, out int id))
            {


                Session["idUsuarioModificar"] = id;
                Response.Redirect("FormularioUsuario.aspx" );
            }
              
        }
    }
}
