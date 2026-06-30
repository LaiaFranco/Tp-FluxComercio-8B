using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlexComercio
{
    public partial class Proveedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ProveedorNegocio negocio = new ProveedorNegocio();

                Session.Add("listaProveedores", negocio.Listar());
                dgvProveedores.DataSource = Session["listaProveedores"];
                dgvProveedores.DataBind();
            }
        }
        protected void dgvProveedores_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int id = Convert.ToInt32(dgvProveedores.DataKeys[index].Value);

                if (e.CommandName == "EliminarProveedor")
                {
                    Session["idProveedorEliminar"] = id;
                    Response.Redirect("EliminarProveedor.aspx", false);
                }

                if (e.CommandName == "ModificarProveedor")
                {
                    Session.Add("idProveedorModificar", id);
                    Response.Redirect("AgregarProveedor.aspx", false);
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
           
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {

        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            string filtro = txtBuscar.Text.Trim();

            ProveedorNegocio negocio = new ProveedorNegocio();

            List<Dominio.Proveedor> lista = negocio.Listar();

            if (!string.IsNullOrEmpty(filtro))
            {
                lista = lista.Where(p =>
                    p.Nombre.ToUpper().Contains(filtro.ToUpper()) ||
                    p.Email.ToUpper().Contains(filtro.ToUpper()) ||
                    p.Cuil.ToUpper().Contains(filtro.ToUpper())
                ).ToList();
            }

            dgvProveedores.DataSource = lista;
            dgvProveedores.DataBind();
        }

    }

}