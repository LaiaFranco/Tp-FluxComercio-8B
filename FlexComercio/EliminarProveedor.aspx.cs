using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace FlexComercio
{
    public partial class EliminarProveedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Session["idProveedorEliminar"] == null)
                    {
                        Response.Redirect("Proveedor.aspx", false);
                        return;
                    }

                    int id = (int)Session["idProveedorEliminar"];

                    ProveedorNegocio negocio = new ProveedorNegocio();
                    Dominio.Proveedor seleccionado = negocio.ListarPorId(id);

                    txtCuil.Text = seleccionado.Cuil;
                    txtNombre.Text = seleccionado.Nombre;
                    txtEmail.Text = seleccionado.Email;
                    txtTelefono.Text = seleccionado.Telefono;
                    txtDireccion.Text = seleccionado.Direccion;
                    txtEstado.Text = seleccionado.Activo ? "Activo" : "Inactivo";
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["idProveedorEliminar"] == null)
                {
                    Response.Redirect("Proveedor.aspx", false);
                    return;
                }

                int id = (int)Session["idProveedorEliminar"];

                ProveedorNegocio negocio = new ProveedorNegocio();
                negocio.Eliminar(id);

                Session.Remove("idProveedorEliminar");

                Response.Redirect("Proveedor.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Session.Remove("idProveedorEliminar");
            Response.Redirect("Proveedor.aspx", false);
        }
    }
}