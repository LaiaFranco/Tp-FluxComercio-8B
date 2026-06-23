using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
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
            try
            {
                if (!IsPostBack)
                {
                    if (Session["idProveedorModificar"] != null)
                    {
                        int id = int.Parse(Session["idProveedorModificar"].ToString());

                        ProveedorNegocio negocio = new ProveedorNegocio();
                        Dominio.Proveedor seleccionado = negocio.ListarPorId(id);

                        txtCuil.Text = seleccionado.Cuil;
                        txtNombre.Text = seleccionado.Nombre;
                        txtEmail.Text = seleccionado.Email;
                        txtTelefono.Text = seleccionado.Telefono;
                        txtDireccion.Text = seleccionado.Direccion;
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtCuil.Text == "" || txtNombre.Text == "" || txtEmail.Text == "")
                {
                    lblMensaje.Text = "Debe completar CUIL, nombre y email.";
                    return;
                }

                Dominio.Proveedor proveedor = new Dominio.Proveedor();

                proveedor.Cuil = txtCuil.Text;
                proveedor.Nombre = txtNombre.Text;
                proveedor.Email = txtEmail.Text;
                proveedor.Telefono = txtTelefono.Text;
                proveedor.Direccion = txtDireccion.Text;
                proveedor.Activo = true;

                ProveedorNegocio negocio = new ProveedorNegocio();

                if (Session["idProveedorModificar"] != null)
                {
                    proveedor.Id = int.Parse(Session["idProveedorModificar"].ToString());
                    negocio.Modificar(proveedor);

                    Session.Remove("idProveedorModificar");
                }
                else
                {
                    negocio.Agregar(proveedor);
                }

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
            Session.Remove("idProveedorModificar");
            Response.Redirect("Proveedor.aspx");
        }
    }
}