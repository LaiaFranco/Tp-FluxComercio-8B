using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlexComercio
{
    public partial class EliminarProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Dominio.Producto producto = (Dominio.Producto)Session["productoSeleccionado"];

                if (producto != null)
                {
                    txtNombre.Text = producto.Nombre;
                    txtDescripcion.Text = producto.Descripcion;
                    txtEstado.Text = producto.Activo ? "Activo" : "Inactivo";
                }
                else
                {
                    Response.Write("El producto es nulo");
                }
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ProductoNegocio negocio = new ProductoNegocio();

            Dominio.Producto producto = (Dominio.Producto)Session["productoSeleccionado"];

            if (producto == null)
            {
                Response.Write("No hay producto seleccionado");
                return;
            }

            int id = producto.Id;
            bool activo = false;

            bool exito = negocio.Eliminar(id, activo);

            if (exito)
            {
                string script = @"
                    Swal.fire({
                        title: 'Éxito',
                        text: 'El producto se eliminó correctamente',
                        icon: 'success',
                        confirmButtonText: 'Aceptar'
                    }).then(() => {
                        window.location = 'Producto.aspx';
                    });
                ";

                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, true);
            }
            else
            {
                string script = @"
                    Swal.fire({
                        title: 'Error',
                        text: 'No se pudo eliminar el producto',
                        icon: 'error',
                        confirmButtonText: 'Aceptar'
                    });
                ";

                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlertError", script, true);
            }
        }
    
    }
}