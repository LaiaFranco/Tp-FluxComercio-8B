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
                if (e.CommandName == "EliminarProveedor")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    int id = Convert.ToInt32(dgvProveedores.DataKeys[index].Value);

                    ProveedorNegocio negocio = new ProveedorNegocio();
                    negocio.Eliminar(id);

                    Response.Redirect("Proveedor.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
    }

}