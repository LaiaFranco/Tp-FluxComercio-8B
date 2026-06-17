using Dominio;
using Negocio; 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlexComercio
{
    public partial class AgregarCategoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Categoria categoria = new Categoria();
            CategoriaNegocio negocio = new CategoriaNegocio();

            categoria.Nombre = txtNombre.Text;
            categoria.Descripcion = txtDescripcion.Text;
            string opcion = ddlEstado.SelectedValue;
            bool op = opcion == "Activo";

            categoria.Activo = op; 

            bool ok = negocio.Agregar(categoria);
            if (ok)
            {
                string script = @"
                    Swal.fire({
                        title: 'Éxito',
                        text: 'La categoria se agrego correctamente',
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
                    text: 'No se pudo agregar la categoria',
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
}