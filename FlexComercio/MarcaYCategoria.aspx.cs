using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlexComercio
{
    public partial class MarcaYCategoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                MarcaNegocio negocioMarca = new MarcaNegocio();

                Session.Add("listaMarcas", negocioMarca.Listar());
                dgvMarcas.DataSource = Session["listaMarcas"];
                dgvMarcas.DataBind();

               
                CategoriaNegocio negocioCategoria = new CategoriaNegocio();

                Session.Add("listaCategorias", negocioCategoria.Listar());
                dgvCategorias.DataSource = Session["listaCategorias"];
                dgvCategorias.DataBind();
            }
        }

    
    }
}