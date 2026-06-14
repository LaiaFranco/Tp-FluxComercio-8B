using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio; 

namespace FlexComercio
{
    public partial class Cliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClienteNegocio negocio = new ClienteNegocio();
                Session.Add("listaClientes",negocio.Listar());
                dgvClientes.DataSource = Session["listaClientes"];
                dgvClientes.DataBind();
            }

        }
    }
}