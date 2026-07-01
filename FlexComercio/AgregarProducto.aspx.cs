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
                    

                if (Session["productoSeleccionado"] != null)
                {
                    Dominio.Producto producto = (Dominio.Producto)Session["productoSeleccionado"];
                    txtNombre.Text = producto.Nombre;
                    ddlMarca.SelectedValue = producto.Marca.Id.ToString();
                    ddlCategoria.SelectedValue = producto.Categoria.Id.ToString();
                    ddlProveedor.SelectedValue = producto.Proveedor.Id.ToString();
                    txtDescripcion.Text = producto.Descripcion;
                    txtStockActual.Text = producto.StockActual.ToString();
                    txtStockMinimo.Text = producto.StockMinimo.ToString();
                    txtPrecio.Text = producto.Precio.ToString();
                    txtGanancia.Text = producto.PorcentajeGanancia.ToString();
                    txtUrlImagen.Text = producto.Imagen.Url;

                    
                    lblTitulo.Text = "Modificar Producto";
                    btnGuardar.Text = "Modificar";
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

            int stockActual = int.Parse(txtStockActual.Text);
            int stockMinimo = int.Parse(txtStockMinimo.Text);
            float precio = float.Parse(txtPrecio.Text);
            float porcentajeGanancia = float.Parse(txtGanancia.Text);

            if (stockActual < 0 || stockMinimo < 0 || precio < 0 || porcentajeGanancia < 0)
            {
                        string script = @"
                Swal.fire({
                    title: 'Error',
                    text: 'El stock, el precio y el porcentaje de ganancia no pueden ser negativos.',
                    icon: 'error',
                    confirmButtonText: 'Aceptar'
                });
            ";

                        ClientScript.RegisterStartupScript(
                            this.GetType(),
                            "ValoresNegativos",
                            script,
                            true
                        );

                        return;
                    }

            ProductoNegocio negocio = new ProductoNegocio();
            Dominio.Producto producto = new Dominio.Producto();

            if (Session["productoSeleccionado"] != null)
            {
                producto.Id = ((Dominio.Producto)Session["productoSeleccionado"]).Id;
            }

            bool ok;
            
            producto.Nombre = txtNombre.Text;
            producto.Descripcion = txtDescripcion.Text;
            producto.StockActual = stockActual;
            producto.StockMinimo = stockMinimo;
            producto.Precio = precio;
            producto.PorcentajeGanancia = porcentajeGanancia;
            producto.Activo = true;

            producto.Categoria = new Categoria();
            producto.Categoria.Id = int.Parse(ddlCategoria.SelectedValue);

            producto.Marca = new Marca();
            producto.Marca.Id = int.Parse(ddlMarca.SelectedValue);

            producto.Proveedor = new Dominio.Proveedor();
            producto.Proveedor.Id = int.Parse(ddlProveedor.SelectedValue);

            producto.Imagen = new Imagen();
            producto.Imagen.Url = txtUrlImagen.Text;


            if (Session["productoSeleccionado"] != null)
            {
                ok = negocio.Modificar(producto); 
            }
            else
            {
                ok = negocio.Agregar(producto);

            }


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