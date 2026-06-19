using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace FlexComercio
{
    public partial class EliminarMarca : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Marca marca = new Marca();
                marca = (Marca)Session["marcaSeleccionada"];

                if (marca != null)
                {
                    txtNombre.Text = marca.Nombre.ToString();
                    txtDescripcion.Text = marca.Descripcion.ToString();
                    txtEstado.Text = marca.Activo ? "Activa" : "Inactiva";
                }
                else
                {
                    Response.Write("La marca es nula");
                }

            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            MarcaNegocio negocio = new MarcaNegocio();
            Marca marca = new Marca();
            marca = (Marca)Session["marcaSeleccionada"];

            int id = marca.Id;
            bool activo = false;
           

            bool exito = negocio.Eliminar(id, activo);
            if (exito)
            {
                string script = @"
                    Swal.fire({
                        title: 'Éxito',
                        text: 'La marca se elimino ',
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
                    text: 'No se pudo eliminar la marca',
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
            Response.Redirect("MarcaYCategoria.aspx"); 
        }
    }
}