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
    public partial class FormularioVentas : System.Web.UI.Page
    {
        private ClienteNegocio ClienteDatos = new ClienteNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                // listar clientes 

                List<Dominio.Cliente> Clientes = ClienteDatos.Listar();

                var listaClientes = Clientes.Select(c => new {
                    Id = c.Id,
                    NombreCompleto = c.Nombre + " " + c.Apellido
                }).ToList();


                ddlCliente.DataSource = listaClientes;

                ddlCliente.DataTextField = "NombreCompleto";        
                ddlCliente.DataValueField = "Id";

                ddlCliente.DataBind();

            }
        }
    }
}