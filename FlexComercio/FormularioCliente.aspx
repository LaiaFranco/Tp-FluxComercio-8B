<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="FormularioCliente.aspx.cs" Inherits="FlexComercio.FormularioCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- ========== CONTENEDOR DEL FORMULARIO ========== -->
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0">Registro de Cliente</h4>
                </div>
                <div class="card-body">

                    <!-- Mensaje de éxito/error (opcional) -->
                    <asp:Label ID="lblMensaje" runat="server" CssClass="alert alert-info w-100" Visible="false" />

                    <!-- DNI (requerido, 7-8 dígitos) -->
                    <div class="mb-3">
                        <label for="txtDNI" class="form-label">DNI <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtDNI" runat="server" CssClass="form-control" placeholder="Ej: 12345678" MaxLength="20" />
                        <asp:RequiredFieldValidator ID="rfvDNI" runat="server"
                            ControlToValidate="txtDNI"
                            ErrorMessage="El DNI es obligatorio."
                            CssClass="text-danger small"
                            Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revDNI" runat="server"
                            ControlToValidate="txtDNI"
                            ValidationExpression="^\d{7,8}$"
                            ErrorMessage="Debe tener 7 u 8 dígitos numéricos."
                            CssClass="text-danger small"
                            Display="Dynamic" />
                    </div>

                    <!-- Nombre (requerido) -->
                    <div class="mb-3">
                        <label for="txtNombre" class="form-label">Nombre <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Ingrese su nombre" MaxLength="255" />
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server"
                            ControlToValidate="txtNombre"
                            ErrorMessage="El nombre es obligatorio."
                            CssClass="text-danger small"
                            Display="Dynamic" />
                    </div>

                    <!-- Apellido (opcional) -->
                    <div class="mb-3">
                        <label for="txtApellido" class="form-label">Apellido</label>
                        <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeholder="Ingrese su apellido" MaxLength="255" />
                    </div>

                    <!-- Email (opcional, con validación de formato) -->
                    <div class="mb-3">
                        <label for="txtEmail" class="form-label">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="ejemplo@correo.com" MaxLength="255" TextMode="Email" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server"
                            ControlToValidate="txtEmail"
                            ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                            ErrorMessage="Ingrese un correo electrónico válido."
                            CssClass="text-danger small"
                            Display="Dynamic" />
                    </div>

                    <!-- Teléfono (opcional) -->
                    <div class="mb-3">
                        <label for="txtTelefono" class="form-label">Teléfono</label>
                        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" placeholder="Ej: 555-123456" MaxLength="255" />
                    </div>

                    <!-- Dirección (opcional) -->
                    <div class="mb-3">
                        <label for="txtDireccion" class="form-label">Dirección</label>
                        <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" placeholder="Calle, número, ciudad" MaxLength="255" />
                    </div>

                    <!-- Resumen de validación -->
                    <asp:ValidationSummary ID="vsResumen" runat="server"
                        CssClass="alert alert-danger"
                        HeaderText="<strong>Por favor, corrija los siguientes errores:</strong>"
                        DisplayMode="BulletList" />

                    <!-- Botón Guardar -->
                    <div class="d-grid">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar Cliente"
                            CssClass="btn btn-success btn-lg"
                            OnClick="btnGuardar_Click" />
                    </div>

                </div> <!-- /card-body -->
            </div> <!-- /card -->
        </div> <!-- /col -->
    </div> <!-- /row -->
</div> <!-- /container -->

</asp:Content>
