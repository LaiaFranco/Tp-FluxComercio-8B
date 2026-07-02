using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlexComercio
{
    public partial class BackupDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarModulo();
            }
        }

        protected void rpt_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Habilitar")
            {
                int id = Convert.ToInt32(e.CommandArgument);

                string modulo = Request.QueryString["modulo"];
                string mensaje = "";

                switch (modulo)
                {
                    case "usuarios":
                        new UsuarioNegocio().Habilitar(id);
                        mensaje = "Usuario restaurado correctamente.";
                        break;

                    case "clientes":
                        new ClienteNegocio().Habilitar(id);
                        mensaje = "Cliente restaurado correctamente.";
                        break;

                    case "productos":
                        new ProductoNegocio().Habilitar(id);
                        mensaje = "Producto restaurado correctamente.";
                        break;

                    case "proveedores":
                        new ProveedorNegocio().Habilitar(id);
                        mensaje = "Proveedor restaurado correctamente.";
                        break;

                    case "marcas":
                        new MarcaNegocio().Habilitar(id);
                        mensaje = "Marca restaurada correctamente.";
                        break;

                    case "categorias":
                        new CategoriaNegocio().Habilitar(id);
                        mensaje = "Categoría restaurada correctamente.";
                        break;
                }

                CargarModulo();

                MostrarSweetAlert(
                    "Éxito",
                    mensaje,
                    "success");
            }
        }
        private void CargarModulo()
        {
            string modulo = Request.QueryString["modulo"];

            switch (modulo)
            {
                case "usuarios":
                    lblTitulo.Text = "Usuarios dados de baja";
                    mvBackup.SetActiveView(vwUsuarios);
                    rptUsuarios.DataSource = new UsuarioNegocio()
                        .Listar()
                        .Where(x => !x.Activo)
                        .ToList();

                    rptUsuarios.DataBind();
                    break;

                case "clientes":
                    lblTitulo.Text = "Clientes dados de baja";
                    mvBackup.SetActiveView(vwClientes);
                    rptClientes.DataSource = new ClienteNegocio()
                        .Listar()
                        .Where(x => !x.Activo)
                        .ToList();
                    rptClientes.DataBind();
                    break;

                case "productos":
                    lblTitulo.Text = "Productos dados de baja";
                    mvBackup.SetActiveView(vwProductos);
                    rptProductos.DataSource = new ProductoNegocio()
                       .Listar()
                       .Where(x => !x.Activo)
                       .ToList();
                    rptProductos.DataBind();
                    break;

                case "proveedores":
                    lblTitulo.Text = "Proveedores dados de baja";
                    mvBackup.SetActiveView(vwProveedores);
                    rptProveedores.DataSource = new ProveedorNegocio()
                        .Listar()
                        .Where(x => !x.Activo)
                        .ToList();
                    rptProveedores.DataBind();
                    break;

                case "marcas":
                    lblTitulo.Text = "Marcas dadas de baja";
                    mvBackup.SetActiveView(vwMarcas);
                    rptMarcas.DataSource = new MarcaNegocio()
                       .Listar()
                       .Where(x => !x.Activo)
                       .ToList();
                    rptMarcas.DataBind();
                    break;

                case "categorias":
                    lblTitulo.Text = "Categorías dadas de baja";
                    mvBackup.SetActiveView(vwCategorias);
                    rptCategorias.DataSource = new CategoriaNegocio()
                       .Listar()
                       .Where(x => !x.Activo)
                       .ToList();
                    rptCategorias.DataBind();
                    break;
            }

           
        }

        private void MostrarSweetAlert(string titulo, string mensaje, string icono)
        {
            string script = $@"
        Swal.fire({{
            title: '{titulo}',
            text: '{mensaje}',
            icon: '{icono}',
            confirmButtonText: 'Aceptar'
        }});";

            ClientScript.RegisterStartupScript(
                this.GetType(),
                Guid.NewGuid().ToString(),
                script,
                true);
        }
    }
    
}
    