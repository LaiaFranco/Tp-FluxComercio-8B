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
    public partial class CompraDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";

                if (id == "")
                {
                    Response.Redirect("Compras.aspx");
                }

                try
                {
                    int idCompra = int.Parse(id);

                    Compra compra = buscarCompra(idCompra);

                    if (compra == null)
                    {
                        Response.Redirect("Compras.aspx");
                    }

                    cargarCompra(compra);
                    cargarDetalle(idCompra);
                }
                catch (Exception ex)
                {
                    Session.Add("error", ex.ToString());
                    Response.Redirect("Compras.aspx");
                }
            }
        }

        private Compra buscarCompra(int idCompra)
        {
            List<Compra> listaCompras = Session["listaCompras"] as List<Compra>;

            if (listaCompras == null)
            {
                CompraNegocio compraNegocio = new CompraNegocio();
                listaCompras = compraNegocio.Listar();
            }

            foreach (Compra item in listaCompras)
            {
                if (item.Id == idCompra)
                    return item;
            }

            return null;
        }

        private void cargarCompra(Compra compra)
        {
            lblIdCompra.Text = compra.Id.ToString();
            lblFecha.Text = compra.Fecha.ToString("dd/MM/yyyy");
            lblProveedor.Text = compra.Proveedor.Nombre;
            lblUsuario.Text = compra.Usuario.Nombre;
            lblTotal.Text = compra.Total.ToString("C2");
        }

        private void cargarDetalle(int idCompra)
        {
            DetalleCompraNegocio detalleNegocio = new DetalleCompraNegocio();

            dgvDetalleCompra.DataSource = detalleNegocio.ListarPorCompra(idCompra);
            dgvDetalleCompra.DataBind();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Compras.aspx");
        }
    }
}