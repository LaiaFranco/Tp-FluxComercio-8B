using Negocio;
using Dominio;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlexComercio
{
    public partial class FormularioCliente : System.Web.UI.Page
    {
        private ClienteNegocio ClienteDatos = new ClienteNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["idClienteBorrar"] != null)
                {
                    int idBorrar = Convert.ToInt32(Session["idClienteBorrar"]);
                    Session.Remove("idClienteBorrar");
                    CargarClienteParaBorrar(idBorrar);
                   
                    return;
                }

                string clienteId = Request.QueryString["cliente"];
                if (!string.IsNullOrEmpty(clienteId) && int.TryParse(clienteId, out int id))
                {
                    CargarClienteParaEdicion(id);
                }
                else
                {
                    ConfigurarModoCreacion();
                }
            }
        }

        private void CargarClienteParaBorrar(int id)
        {
            Dominio.Cliente cliente = ClienteDatos.GetCliente(id);
            if (cliente == null)
            {
                lblMensaje.Text = "Cliente no encontrado.";
                lblMensaje.CssClass = "alert alert-danger";
                lblMensaje.Visible = true;
                return;
            }

            // Ocultar el formulario de edición y mostrar el panel de confirmación
            divFormulario.Visible = false;
            divConfirmarEliminar.Visible = true;

            // Cambiar el título de la tarjeta
            lblTitulo.Text = "Eliminar Cliente";

            // Llenar los labels de confirmación
            lblConfirmDNI.Text = cliente.Dni;
            lblConfirmNombre.Text = cliente.Nombre;
            lblConfirmApellido.Text = cliente.Apellido;
            lblConfirmEmail.Text = cliente.Email;
            lblConfirmTelefono.Text = cliente.Telefono;
            lblConfirmDireccion.Text = cliente.Direccion;

            // Guardar ID para el botón Eliminar
            ViewState["ClienteIdBorrar"] = id;
        }

        private void CargarClienteParaEdicion(int id)
        {
            Dominio.Cliente cliente = ClienteDatos.GetCliente(id);
            if (cliente != null)
            {
                txtDNI.Text = cliente.Dni;
                txtNombre.Text = cliente.Nombre;
                txtApellido.Text = cliente.Apellido;
                txtEmail.Text = cliente.Email;
                txtTelefono.Text = cliente.Telefono;
                txtDireccion.Text = cliente.Direccion;

                txtDNI.Enabled = false;
                ViewState["ClienteId"] = id;
                btnGuardar.Text = "Actualizar Cliente";
                lblTitulo.Text = "Editar Cliente";

                // Asegurar que el formulario esté visible y el panel de confirmación oculto
                divFormulario.Visible = true;
                divConfirmarEliminar.Visible = false;
            }
        }

        private void ConfigurarModoCreacion()
        {
            txtDNI.Enabled = true;
            txtNombre.Enabled = true;
            txtApellido.Enabled = true;
            txtEmail.Enabled = true;
            txtTelefono.Enabled = true;
            txtDireccion.Enabled = true;

            btnGuardar.Visible = true;
            btnGuardar.Text = "Guardar Cliente";
            lblTitulo.Text = "Registro de Cliente";

            divFormulario.Visible = true;
            divConfirmarEliminar.Visible = false;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            string dni = txtDNI.Text.Trim();
            string nombre = txtNombre.Text.Trim();

            if (!System.Text.RegularExpressions.Regex.IsMatch(dni, @"^\d{7,8}$"))
            {
                lblMensaje.Text = "DNI inválido (debe tener 7 u 8 dígitos).";
                lblMensaje.CssClass = "alert alert-danger";
                lblMensaje.Visible = true;
                return;
            }

            if (string.IsNullOrEmpty(nombre))
            {
                lblMensaje.Text = "El nombre es obligatorio.";
                lblMensaje.CssClass = "alert alert-danger";
                lblMensaje.Visible = true;
                return;
            }

            Dominio.Cliente cliente = new Dominio.Cliente();
            cliente.Dni = txtDNI.Text.Trim();
            cliente.Nombre = txtNombre.Text.Trim();
            cliente.Apellido = txtApellido.Text.Trim();
            cliente.Email = txtEmail.Text.Trim();
            cliente.Telefono = txtTelefono.Text.Trim();
            cliente.Direccion = txtDireccion.Text.Trim();
            cliente.Activo = true;

            if (ViewState["ClienteId"] != null)
            {
                cliente.Id = (int)ViewState["ClienteId"];
                ClienteDatos.Modificar(cliente);
                lblMensaje.Text = "Cliente actualizado exitosamente.";
                Response.Redirect("Cliente.aspx");
            }
            else
            {
                ClienteDatos.Agregar(cliente);
                lblMensaje.Text = "Cliente guardado exitosamente.";
            }

            lblMensaje.CssClass = "alert alert-success";
            lblMensaje.Visible = true;
            LimpiarCampos();
        }

        protected void btnBorrar_Click(object sender, EventArgs e)
        {
            if (ViewState["ClienteIdBorrar"] != null)
            {
                int id = (int)ViewState["ClienteIdBorrar"];
                ClienteDatos.Eliminar(id);
                Response.Redirect("Cliente.aspx");
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cliente.aspx");
        }

        private void LimpiarCampos()
        {
            txtDNI.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtEmail.Text = "";
            txtTelefono.Text = "";
            txtDireccion.Text = "";
            ViewState["ClienteId"] = null;
            btnGuardar.Text = "Guardar Cliente";
        }
    }
}