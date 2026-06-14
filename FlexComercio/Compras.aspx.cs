using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
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

                Session.Add("listaCompra", negocio.Listar());
                dgvCompraDetalles.DataSource = Session["listaCompra"];
                dgvCompraDetalles.DataBind();
            }
        }
    }
}