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
    public partial class EliminarCategoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Categoria categoria = new Categoria();
                categoria = (Categoria)Session["categoriaSeleccionada"];

                if (categoria != null)
                {
                    txtNombre.Text = categoria.Nombre.ToString();
                    txtDescripcion.Text = categoria.Descripcion.ToString();
                    txtEstado.Text = categoria.Activo ? "Activa" : "Inactiva";
                }
                else
                {
                    Response.Write("La categoria es nula");
                }

            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            CategoriaNegocio negocio = new CategoriaNegocio();
            Categoria categoria = new Categoria();
            categoria = (Categoria)Session["categoriaSeleccionada"];

            int id = categoria.Id;
            bool activo = categoria.Activo;

            bool exito = negocio.Eliminar(id, activo);
            if (exito)
            {
                string script = @"
                    Swal.fire({
                        title: 'Éxito',
                        text: 'La categoria se elimino ',
                        icon: 'success',
                        confirmButtonText: 'Aceptar'
                    }).then(() => {
                        window.location = 'MarcaYCategoria.aspx';
                    });
                ";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, true);

            }
            else
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

        protected void btnCancelar_Click(object sender, EventArgs e)
        {

        }
    }
}