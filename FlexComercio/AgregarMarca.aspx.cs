using Dominio;
using Negocio; 
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace FlexComercio
{
    public partial class AgregarMarca : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                MarcaNegocio negocio = new MarcaNegocio();

                if (Session["marcaSeleccionada"] != null)
                {
                    Marca marca = (Marca)Session["marcaSeleccionada"];
                    txtNombre.Text = marca.Nombre;
                    txtDescripcion.Text = marca.Descripcion;
                    pnlEstado.Visible = false;
                    btnGuardar.Text = "Modificar";
                    lblTitulo.Text = "Modificar Marca"; 
                    
                }
                else
                {
                    pnlEstado.Visible = false;
                    btnGuardar.Text = "Agregar";
                    lblTitulo.Text = "Agregar Marca"; 
                }

            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            MarcaNegocio negocio = new MarcaNegocio();
            Marca marca = new Marca();
            bool ok;

            if (Session["marcaSeleccionada"] != null)
            {

                marca = (Marca)Session["marcaSeleccionada"];
                
                txtNombre.Text = marca.Nombre;
                marca.Nombre = CultureInfo.CurrentCulture.TextInfo
                   .ToTitleCase(txtNombre.Text.Trim().ToLower());
                string nombre = txtNombre.Text.Trim();

                txtDescripcion.Text = marca.Descripcion;
                
                if (negocio.ExisteMarca(nombre))
                {
                    lblError.Text = "Ya existe una marca con esas caracteristicas.";
                    lblError.Visible = true;
                    return;
                }

                ok = negocio.Modificar(marca);
                Session.Remove("marcaSeleccionada");

            }
            else
            {
                marca.Nombre = txtNombre.Text;
                marca.Nombre = CultureInfo.CurrentCulture.TextInfo
                   .ToTitleCase(txtNombre.Text.Trim().ToLower());
                string nombre = txtNombre.Text.Trim();


                marca.Descripcion = txtDescripcion.Text;
                pnlEstado.Visible = false;
                
                marca.Activo = true; 
                if (negocio.ExisteMarca(nombre))
                {
                    lblError.Text = "Ya existe una marca con esas caracteristicas.";
                    lblError.Visible = true;
                    return;
                }
                else
                {
                    ok = negocio.Agregar(marca);

                }
                
            }
            if (ok){
                string script = @"
                Swal.fire({
                    title: 'Éxito',
                    text: 'La operación se realizó correctamente',
                    icon: 'success',
                    confirmButtonText: 'Aceptar'
                }).then(() => {
                    window.location = 'MarcaYCategoria.aspx';
                });
                 ";

               ClientScript.RegisterStartupScript(
                            this.GetType(),
                            "SweetAlert",
                            script,
                            true
               );
            }
            else
            {
                string script = @"
                Swal.fire({
                    title: 'Error',
                    text: 'No se pudo completar la operación',
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