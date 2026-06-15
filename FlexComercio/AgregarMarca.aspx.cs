using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio; 


namespace FlexComercio
{
    public partial class AgregarMarca : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Marca marca = new Marca();
            MarcaNegocio negocio = new MarcaNegocio(); 

            marca.Nombre = txtNombre.Text;
            marca.Descripcion = txtDescripcion.Text;
            string opcion = ddlEstado.SelectedValue;
            bool op = opcion == "Activo";

            bool ok = negocio.Agregar(marca);
            if (ok)
            {
                string script = @"
                    Swal.fire({
                        title: 'Éxito',
                        text: 'La marca se agrego correctamente',
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
                    text: 'No se pudo agregar la marca',
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