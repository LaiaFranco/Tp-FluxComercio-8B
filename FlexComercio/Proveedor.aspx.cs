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
    }
}