using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Microsoft.Win32;

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

        protected void dgvMarcas_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnEliminarMarca_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int indice = int.Parse(btn.CommandArgument);
            List<Marca> listaMarca = (List<Marca>)Session["listaMarcas"];

            Marca marca = listaMarca[indice];
            Session["marcaSeleccionada"] = marca;
            Response.Redirect("EliminarMarca.aspx");
        }

        protected void btnModificarMarca_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int indice = int.Parse(btn.CommandArgument);
            List<Marca> listaMarca = (List<Marca>)Session["listaMarcas"];

            Marca marca = listaMarca[indice];
            Session["marcaSeleccionada"] = marca;
            Response.Redirect("ModificarMarca.aspx"); 
        }

        protected void btnNuevaMarca_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarMarca.aspx");
        }

        protected void btnNuevaCategoria_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarCategoria.aspx"); 
        }

        protected void btnEliminarCategoria_Click(object sender, EventArgs e)
        {

        }

        protected void btnModificarCategoria_Click(object sender, EventArgs e)
        {

        }
    }
}