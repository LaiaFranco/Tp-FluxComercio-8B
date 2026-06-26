using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;

namespace FlexComercio
{
    public partial class Stock : System.Web.UI.Page
    {
        private Producto producto = new Producto();
        public ProductoNegocio negocio = new ProductoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Dominio.Producto> listaProdouct = negocio.Listar().Where(x => x.Activo).ToList();

                    Session["Productos"] = listaProdouct;

                    dgvStock.DataSource = listaProdouct;
                    dgvStock.DataBind();

                CargarCategorias();
                ActualizarCards(listaProdouct);
            }
        }

        protected string ObtenerClaseStock(object stockObj, object minObj)
        {
            int stock = Convert.ToInt32(stockObj);
            int min = Convert.ToInt32(minObj);

            if (stock == 0)
                return "badge bg-danger";

            if (stock <= min)
                return "badge bg-warning text-dark";

            return "badge bg-success";

        }

        protected string ObtenerEstadoStock(object stockObj, object minObj)
        {
            int stock = Convert.ToInt32(stockObj);
            int min = Convert.ToInt32(minObj);

            if (stock == 0)
                return "Sin stock";

            if (stock <= min)
                return "Stock bajo";

            return "Disponible";
        }

     

        protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {

            List<Dominio.Producto> lista = (List<Dominio.Producto>)Session["Productos"];

            if (ddlCategoria.SelectedValue != "0")
            {
                int id = int.Parse(ddlCategoria.SelectedValue);
                lista = lista.Where(x => x.Categoria.Id == id).ToList();
            }

            dgvStock.DataSource = lista;
            dgvStock.DataBind();

            ActualizarCards(lista);
        }

        private void ActualizarCards(List<Dominio.Producto> lista)
        {
            lblTotalProductos.Text = lista.Count.ToString();
            lblConStock.Text = lista.Count(x => x.StockActual > x.StockMinimo).ToString();
            lblStockBajo.Text = lista.Count(x => x.StockActual <= x.StockMinimo && x.StockActual != 0).ToString();
            lblSinStock.Text = lista.Count(x => x.StockActual == 0).ToString();
        }
        private void CargarCategorias()
        {
            CategoriaNegocio catNeg = new CategoriaNegocio();

            List<Categoria> listaCategoria = catNeg.Listar().Where(x => x.Activo).ToList();

            ddlCategoria.DataSource = listaCategoria;
            ddlCategoria.DataValueField = "Id";
            ddlCategoria.DataTextField = "Nombre";
            ddlCategoria.DataBind();

            // IMPORTANTE: opción "todas"
            ddlCategoria.Items.Insert(0, new ListItem("Todas", "0"));
        }

        protected void tmrBuscar_Tick(object sender, EventArgs e)
        {
           List<Dominio.Producto> lista = (List<Dominio.Producto>)Session["Productos"];

            if (!string.IsNullOrWhiteSpace(txtBuscar.Text))
            {
                string texto = txtBuscar.Text.ToLower();

                lista = lista.Where(x =>
                    x.Nombre.ToLower().Contains(texto) ||
                    x.Marca.Nombre.ToLower().Contains(texto)
                ).ToList();
            }

            dgvStock.DataSource = lista;
            dgvStock.DataBind();

            ActualizarCards(lista);
        }
    }

}