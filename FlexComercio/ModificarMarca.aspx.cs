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
    public partial class ModificarMarca : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                 Marca marca = new Marca();
                 marca = (Marca)Session["marcaSeleccionada"];
                txtNombre.Text = marca.Nombre;
                txtDescripcion.Text = marca.Descripcion;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Marca marca = new Marca();
            MarcaNegocio negocio = new MarcaNegocio(); 

            marca = (Marca)Session["marcaSeleccionada"];
            marca.Nombre = txtNombre.Text;
            marca.Descripcion = txtDescripcion.Text;

            bool exito = negocio.Modificar(marca); 
            if (exito)
            {
                string script = @"
                    Swal.fire({
                        title: 'Éxito',
                        text: 'La marca se modificó correctamente',
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
                    text: 'No se pudo modificar la marca',
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