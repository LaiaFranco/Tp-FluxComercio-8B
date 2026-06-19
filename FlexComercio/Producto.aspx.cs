using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlexComercio
{
    public partial class Producto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ProductoNegocio negocio = new ProductoNegocio();
                Session.Add("listaProductos",negocio.Listar().Where(n=>n.Activo).ToList());
                dgvProductos.DataSource = Session["listaProductos"];
                dgvProductos.DataBind();

            }
        }

        protected void btnNuevoProducto_Click(object sender, EventArgs e)
        {
            Session.Remove("productoSeleccionado");
            Response.Redirect("AgregarProducto.aspx");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int indice = int.Parse(btn.CommandArgument);
            List<Dominio.Producto> listaProducto = (List<Dominio.Producto>)Session["listaProductos"];

            Dominio.Producto producto = listaProducto[indice];
            Session["productoSeleccionado"] = producto;
            Response.Redirect("AgregarProducto.aspx");
        }
    }
}