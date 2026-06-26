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

                try
                {
                    UsuarioDatos.Eliminar(id);
                    CargarUsuarios();
                    string script = @"
                    Swal.fire({
                        title: 'Éxito',
                        text: 'La categoria se elimino ',
                        icon: 'success',
                        confirmButtonText: 'Aceptar'
                    }).then(() => {
                       
                    });
                ";
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, true);

                } catch (Exception)
                {

                    string script = @"
                Swal.fire({
                    title: 'Error',
                    text: 'No se pudo eliminar la categoria',
                    icon: 'error',
                    confirmButtonText: 'Aceptar'
                });
                ";

                    ClientScript.RegisterStartupScript(
                           this.GetType(),
                           "SweetAlertError",
                           script,
                           true
                    );

                }
                

            }


        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;


            string idStr = btn.CommandArgument;


            if (int.TryParse(idStr, out int id))
            {
                Response.Redirect("FormularioUsuario.aspx?usuario="+id);
            }
              
        }
    }
}