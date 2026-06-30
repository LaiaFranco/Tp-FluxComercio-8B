using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace FlexComercio
{
    public partial class Compras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CompraNegocio negocio = new CompraNegocio();

                Session.Add("listaCompras", negocio.Listar());
                dgvCompras.DataSource = Session["listaCompras"];
                dgvCompras.DataBind();
            }
        }

        protected void dgvCompras_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvCompras.SelectedDataKey.Value.ToString();
            Response.Redirect("CompraDetalle.aspx?id=" + id);
        }

        protected void btnNuevaCompra_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarCompra.aspx"); 
        }
    }
}
