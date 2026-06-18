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
                if (Session["categoriaSeleccionada"] != null)
                {
                    Categoria categoria = (Categoria)Session["categoriaSeleccionada"];

                    txtNombre.Text = categoria.Nombre;
                    txtDescripcion.Text = categoria.Descripcion;

                    pnlEstado.Visible = false;

                    btnGuardar.Text = "Modificar";
                    lblTitulo.Text = "Modificar Categoría";
                }
                else
                {
                    pnlEstado.Visible = true;

                    btnGuardar.Text = "Agregar";
                    lblTitulo.Text = "Agregar Categoría";
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            CategoriaNegocio negocio = new CategoriaNegocio();
            Categoria categoria;
            bool ok;

            if (Session["categoriaSeleccionada"] != null)
            {
                categoria = (Categoria)Session["categoriaSeleccionada"];

                categoria.Nombre = txtNombre.Text;
                categoria.Descripcion = txtDescripcion.Text;

                ok = negocio.Modificar(categoria);

                Session.Remove("categoriaSeleccionada");
            }
            else
            {
                categoria = new Categoria();

                categoria.Nombre = txtNombre.Text;
                categoria.Descripcion = txtDescripcion.Text;
                categoria.Activo = bool.Parse(ddlEstado.SelectedValue);

                ok = negocio.Agregar(categoria);
            }

            if (ok)
            {
                string script = @"
                Swal.fire({
                    title: 'Éxito',
                    text: 'La operación se realizó correctamente',
                    icon: 'success',
                    confirmButtonText: 'Aceptar'
                }).then(() => {
                    window.location = 'MarcaYCategoria.aspx';
                });";

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
                });";

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