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
                    string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";

                    if (id != "")
                    {
                        ProveedorNegocio negocio = new ProveedorNegocio();
                        Dominio.Proveedor seleccionado = negocio.ListarPorId(int.Parse(id));

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
                if (!Page.IsValid)
                    return;

                Dominio.Proveedor proveedor = new Dominio.Proveedor();

                proveedor.Cuil = txtCuil.Text;
                proveedor.Nombre = txtNombre.Text;
                proveedor.Email = txtEmail.Text;
                proveedor.Telefono = txtTelefono.Text;
                proveedor.Direccion = txtDireccion.Text;
                proveedor.Activo = true;

                proveedor.Nombre = txtNombre.Text;
                proveedor.Nombre = CultureInfo.CurrentCulture.TextInfo
                   .ToTitleCase(txtNombre.Text.Trim().ToUpper());
                string nombre = txtNombre.Text.Trim();

                ProveedorNegocio negocio = new ProveedorNegocio();

                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";

                if (id != "")
                {
                    if (negocio.ExisteProveedor(txtNombre.Text, txtCuil.Text))
                    {
                        lblError.Text = "Ya existe un proveedor con ese nombre o CUIL.";
                        lblError.Visible = true;
                        return;
                    }
                    else
                    {
                        proveedor.Id = int.Parse(id);
                        negocio.Modificar(proveedor);
                    }
                }
                else
                {
                    if (negocio.ExisteProveedor(txtNombre.Text, txtCuil.Text))
                    {
                        lblError.Text = "Ya existe un proveedor con ese nombre o CUIL.";
                        lblError.Visible = true;
                        return;
                    }
                    else
                    {
                        negocio.Agregar(proveedor);
                    }
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
            Response.Redirect("Proveedor.aspx");
        }
    }
}