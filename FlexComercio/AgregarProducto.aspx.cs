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
    public partial class AgregarProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                CategoriaNegocio catNegocio = new CategoriaNegocio();
                MarcaNegocio marcaNegocio = new MarcaNegocio();
                ProveedorNegocio provNegocio = new ProveedorNegocio();

                if (Session["productoSeleccionado"] != null)
                {
                    Dominio.Producto producto = (Dominio.Producto)Session["productoSeleccionado"];
                    txtNombre.Text = producto.Nombre;
                    ddlMarca.DataTextField = producto.Marca.Nombre;
                    ddlCategoria.DataTextField = producto.Categoria.Nombre;
                    ddlProveedor.DataTextField = producto.Proveedor.Nombre;
                    txtDescripcion.Text = producto.Descripcion;
                    txtStockActual.Text = producto.StockActual.ToString();
                    txtStockMinimo.Text = producto.StockMinimo.ToString();
                    txtPrecio.Text = producto.Precio.ToString();
                    txtGanancia.Text = producto.PorcentajeGanancia.ToString();
                    imgPreview.ImageUrl = producto.Imagen.Url;
                    ddlEstado.Visible = false;
                }
                else
                {
                    List<Categoria> listaCategoria = catNegocio.Listar().Where(n => n.Activo).ToList();
                    List<Marca> listaMarca = marcaNegocio.Listar().Where(n => n.Activo).ToList();
                    List<Dominio.Proveedor> listaProveedor = provNegocio.Listar().Where(n => n.Activo).ToList();

                    ddlCategoria.DataSource = listaCategoria;
                    ddlCategoria.DataValueField = "Id";
                    ddlCategoria.DataTextField = "Nombre";
                    ddlCategoria.DataBind();

                    ddlMarca.DataSource = listaMarca;
                    ddlMarca.DataValueField = "Id";
                    ddlMarca.DataTextField = "Nombre";
                    ddlMarca.DataBind();

                    ddlProveedor.DataSource = listaProveedor;
                    ddlProveedor.DataValueField = "Id";
                    ddlProveedor.DataTextField = "Nombre";
                    ddlProveedor.DataBind();
                    pnlEstado.Visible = false;
                }

            }
        }

        protected void txtUrlImagen_TextChanged(object sender, EventArgs e)
        {
            imgPreview.ImageUrl = txtUrlImagen.Text;
        }



        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            ProductoNegocio negocio = new ProductoNegocio();
            Dominio.Producto producto = new Dominio.Producto();

            bool ok;
            pnlEstado.Visible = false;
            producto.Nombre = txtNombre.Text;
            producto.Descripcion = txtDescripcion.Text;
            producto.StockActual = int.Parse(txtStockActual.Text);
            producto.StockMinimo = int.Parse(txtStockMinimo.Text);
            producto.Precio = float.Parse(txtPrecio.Text);
            producto.PorcentajeGanancia = float.Parse(txtGanancia.Text);
            producto.Activo = true;

            producto.Categoria = new Categoria();
            producto.Categoria.Id = int.Parse(ddlCategoria.SelectedValue);

            producto.Marca = new Marca();
            producto.Marca.Id = int.Parse(ddlMarca.SelectedValue);

            producto.Proveedor = new Dominio.Proveedor();
            producto.Proveedor.Id = int.Parse(ddlProveedor.SelectedValue);

            producto.Imagen = new Imagen();
            producto.Imagen.Url = txtUrlImagen.Text;

            ok = negocio.Agregar(producto);

            if (ok)
            {
                string script = @"
                    Swal.fire({
                        title: 'Éxito',
                        text: 'Producto agregado correctamente',
                        icon: 'success',
                        confirmButtonText: 'Aceptar'
                    }).then(() => {
                        window.location = 'Producto.aspx';
                    });
                    ";

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "SweetAlert",
                    script,
                    true
                );
            }
            else
            {
                string script = @"
                    Swal.fire({
                        title: 'Error',
                        text: 'No se pudo agregar el producto',
                        icon: 'error',
                        confirmButtonText: 'Aceptar'
                    });
                    ";

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "SweetAlertError",
                    script,
                    true
                );
            }
        }

        protected void btnAgregarImagen_Click(object sender, EventArgs e)
        {
            imgPreview.ImageUrl = txtUrlImagen.Text;
        }
    }
}