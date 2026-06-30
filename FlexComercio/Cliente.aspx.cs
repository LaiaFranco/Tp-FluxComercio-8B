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
    public partial class Cliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarClientes();
            }

        }

        private void CargarClientes()
        {
            ClienteNegocio negocio = new ClienteNegocio();
            List<Dominio.Cliente> listaCompleta = negocio.Listar();
            List<Dominio.Cliente> listaActivos = listaCompleta.Where(c => c.Activo).ToList();
            Session.Add("listaClientes", listaActivos);
            dgvClientes.DataSource = Session["listaClientes"];
            dgvClientes.DataBind();
        }

        protected void btnNuevoCliente_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormularioCliente.aspx");
        }

        protected void btnConfirmarEliminar_Click(object sender, EventArgs e)
        {

            string valorId = hfClienteId.Value?.Trim();
            ClienteNegocio negocio = new ClienteNegocio();
            negocio.Eliminar(int.Parse(valorId));
            
            CargarClientes();
        
        }


        protected void dgvClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")
            {
                
                hfClienteId.Value = e.CommandArgument.ToString();

             
                ClientScript.RegisterStartupScript(this.GetType(), "abrirModal", "abrirModal();", true);
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int id = (int)dgvClientes.DataKeys[row.RowIndex].Value;
            Response.Redirect("FormularioCliente.aspx?cliente=" + id);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            Session["idClienteBorrar"] = id;

            Response.Redirect("FormularioCliente.aspx");
        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            string filtro = txtBuscar.Text.Trim();

            ClienteNegocio negocio = new ClienteNegocio();

            List < Dominio. Cliente> lista = negocio.Listar();

            if (!string.IsNullOrEmpty(filtro))
            {
                lista = lista.Where(x =>
                    x.Nombre.ToUpper().Contains(filtro.ToUpper()) ||
                    x.Apellido.ToUpper().Contains(filtro.ToUpper()) ||
                    x.Email.ToUpper().Contains(filtro.ToUpper()) ||
                    x.Dni.ToString().Contains(filtro)
                ).ToList();
            }

            dgvClientes.DataSource = lista;
            dgvClientes.DataBind();
        }
    }
   

}
