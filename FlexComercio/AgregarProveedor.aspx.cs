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
    public partial class AgregarProveedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtCuil.Text == "" || txtNombre.Text == "" || txtEmail.Text == "")
                {
                    lblMensaje.Text = "Debe completar CUIL, nombre y email.";
                    return;
                };

                Dominio.Proveedor nuevo = new Dominio.Proveedor();

                nuevo.Cuil = txtCuil.Text;
                nuevo.Nombre = txtNombre.Text;
                nuevo.Email = txtEmail.Text;
                nuevo.Telefono = txtTelefono.Text;
                nuevo.Direccion = txtDireccion.Text;
                nuevo.Activo = true;

                ProveedorNegocio negocio = new ProveedorNegocio();
                negocio.Agregar(nuevo);

                Response.Redirect("Proveedor.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
            //Response.Redirect("Proveedor.aspx");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Proveedor.aspx");
        }
    }
}