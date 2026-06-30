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

                Session.Add("listaMarcas", negocioMarca.Listar().Where(n=>n.Activo).ToList());
                dgvMarcas.DataSource = Session["listaMarcas"];
                
                dgvMarcas.DataBind();

               
                CategoriaNegocio negocioCategoria = new CategoriaNegocio();

                Session.Add("listaCategorias", negocioCategoria.Listar().Where(n=>n.Activo).ToList());
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
            Response.Redirect("AgregarMarca.aspx"); 
        }

        protected void btnNuevaMarca_Click(object sender, EventArgs e)
        {
            Session.Remove("marcaSeleccionada");
            Response.Redirect("AgregarMarca.aspx");
        }

        protected void btnNuevaCategoria_Click(object sender, EventArgs e)
        {
            Session.Remove("categoriaSeleccionada"); 
            Response.Redirect("AgregarCategoria.aspx"); 
        }

        
        protected void btnModificarCategoria_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int indice = int.Parse(btn.CommandArgument);
            List<Categoria> listaCategoria = (List<Categoria>)Session["listaCategorias"];

            Categoria categoria = listaCategoria[indice];
            Session["categoriaSeleccionada"] = categoria;
            Response.Redirect("AgregarCategoria.aspx");
        }

        protected void btnEliminarCategoria_Click1(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int indice = int.Parse(btn.CommandArgument);
            List<Categoria> listaCategoria = (List<Categoria>)Session["listaCategorias"];

            Categoria categoria = listaCategoria[indice];
            Session["categoriaSeleccionada"] = categoria;
            Response.Redirect("EliminarCategoria.aspx");
        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            AplicarFiltros();
        }

        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            AplicarFiltros();
        }

        private void AplicarFiltros()
        {
            string texto = txtBuscar.Text.Trim().ToUpper();

            List<Marca> marcas = (List<Marca>)Session["listaMarcas"];
            List<Categoria> categorias = (List<Categoria>)Session["listaCategorias"];

            // Filtrar por texto
            if (!string.IsNullOrEmpty(texto))
            {
                marcas = marcas.Where(x =>
                    x.Nombre.ToUpper().Contains(texto) ||
                    x.Descripcion.ToUpper().Contains(texto)).ToList();

                categorias = categorias.Where(x =>
                    x.Nombre.ToUpper().Contains(texto) ||
                    x.Descripcion.ToUpper().Contains(texto)).ToList();
            }

            // Mostrar según el ddl
            switch (ddlFiltro.SelectedValue)
            {
                case "Marca":
                    dgvMarcas.Visible = true;
                    dgvCategorias.Visible = false;
                    break;

                case "Categoria":
                    dgvMarcas.Visible = false;
                    dgvCategorias.Visible = true;
                    break;

                default:
                    dgvMarcas.Visible = true;
                    dgvCategorias.Visible = true;
                    break;
            }

            dgvMarcas.DataSource = marcas;
            dgvMarcas.DataBind();

            dgvCategorias.DataSource = categorias;
            dgvCategorias.DataBind();
        }


    }
}