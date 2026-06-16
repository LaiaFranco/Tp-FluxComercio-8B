using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace FlexComercio
{
    public partial class Producto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ProductoNegocio negocio = new ProductoNegocio();
                Session.Add("listaProductos",negocio.Listar());
                dgvProductos.DataSource = Session["listaProductos"];
                dgvProductos.DataBind();

            }
        }
    }
}