<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="FormularioCliente.aspx.cs" Inherits="FlexComercio.FormularioCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<!-- REGISTRO DE CLIENTE  -->
<div class="container-fluid mt-4">
    <div class="row justify-content-center">
        <div class="col-12 col-xl-10">
            <div class="card shadow-lg border-0 rounded-4">
                <!-- Encabezado con color lima y texto negro -->
                <div class="card-header bg-lima text-black rounded-top-4" style="background-color: #bfff00 !important; border-bottom: 3px solid #9acd32;">
                    <h4 class="mb-0 fw-bold">
                        <i class="bi bi-person-plus me-2"></i>Registro de Cliente
                    </h4>
                </div>
                <div class="card-body p-4 p-lg-5">

                    <!-- Mensaje de éxito/error (opcional) -->
                    <asp:Label ID="lblMensaje" runat="server" CssClass="alert alert-info w-100" Visible="false" />

                    <!-- Formulario en dos columnas (responsive) -->
                    <div class="row g-4">
                        <!-- Columna izquierda -->
                        <div class="col-md-6">

                            <!-- DNI (requerido, 7-8 dígitos) -->
                            <div class="mb-3">
                                <label for="txtDNI" class="form-label fw-semibold">
                                    DNI <span class="text-danger">*</span>
                                </label>
                                <asp:TextBox ID="txtDNI" runat="server" CssClass="form-control form-control-lg rounded-pill" placeholder="Ej: 12345678" MaxLength="20"  />
                                <asp:RequiredFieldValidator ID="rfvDNI" runat="server"
                                    ControlToValidate="txtDNI"
                                    ErrorMessage="El DNI es obligatorio."
                                    CssClass="text-danger small"
                                    Display="Dynamic"  />
                                <asp:RegularExpressionValidator ID="revDNI" runat="server"
                                    ControlToValidate="txtDNI"
                                    ValidationExpression="^\d{7,8}$"
                                    ErrorMessage="Debe tener 7 u 8 dígitos numéricos."
                                    CssClass="text-danger small"
                                    Display="Dynamic"  />
                            </div>

                            <!-- Nombre (requerido) -->
                            <div class="mb-3">
                                <label for="txtNombre" class="form-label fw-semibold">
                                    Nombre <span class="text-danger">*</span>
                                </label>
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control form-control-lg rounded-pill" placeholder="Ingrese su nombre" MaxLength="255" />
                                <asp:RequiredFieldValidator ID="rfvNombre" runat="server"
                                    ControlToValidate="txtNombre"
                                    ErrorMessage="El nombre es obligatorio."
                                    CssClass="text-danger small"
                                    Display="Dynamic" />
                            </div>

                            <!-- Apellido (opcional) -->
                            <div class="mb-3">
                                <label for="txtApellido" class="form-label fw-semibold">Apellido</label>
                                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control form-control-lg rounded-pill" placeholder="Ingrese su apellido" MaxLength="255" />
                            </div>

                        </div> <!-- /col izquierda -->

                        <!-- Columna derecha -->
                        <div class="col-md-6">

                            <!-- Email (opcional, con validación) -->
                            <div class="mb-3">
                                <label for="txtEmail" class="form-label fw-semibold">Email</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control form-control-lg rounded-pill" placeholder="ejemplo@correo.com" MaxLength="255" TextMode="Email" />
                                <asp:RegularExpressionValidator ID="revEmail" runat="server"
                                    ControlToValidate="txtEmail"
                                    ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                                    ErrorMessage="Ingrese un correo electrónico válido."
                                    CssClass="text-danger small"
                                    Display="Dynamic" />
                            </div>

                            <!-- Teléfono (opcional) -->
                            <div class="mb-3">
                                <label for="txtTelefono" class="form-label fw-semibold">Teléfono</label>
                                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control form-control-lg rounded-pill" placeholder="Ej: 555-123456" MaxLength="255" />
                            </div>

                            <!-- Dirección (opcional) -->
                            <div class="mb-3">
                                <label for="txtDireccion" class="form-label fw-semibold">Dirección</label>
                                <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control form-control-lg rounded-pill" placeholder="Calle, número, ciudad" MaxLength="255" />
                            </div>

                        </div> <!-- /col derecha -->
                    </div> <!-- /row de columnas -->

                    <!-- Resumen de validación -->
                    <asp:ValidationSummary ID="vsResumen" runat="server"
                        CssClass="alert alert-danger mt-3"
                        HeaderText="<strong>Por favor, corrija los siguientes errores:</strong>"
                        DisplayMode="BulletList" />

                    <!-- Botón Guardar (color lima) -->
                    <div class="d-grid mt-4">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar Cliente"
                            CssClass="btn btn-lg rounded-pill fw-bold text-black"
                            style="background-color: #bfff00; border: 2px solid #9acd32;"
                            OnClick="btnGuardar_Click" />
                    </div>

                </div> <!-- /card-body -->
            </div> <!-- /card -->
        </div> <!-- /col -->
    </div> <!-- /row -->
</div> <!-- /container-fluid -->

<!-- (Opcional) Estilos adicionales para los campos y validadores -->
<style>
    /* Fondo y bordes en blanco/negro */
    .card {
        background-color: #ffffff;
        border: 1px solid #e0e0e0;
    }
    .form-control {
        background-color: #fafafa;
        border: 2px solid #d0d0d0;
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }
    .form-control:focus {
        border-color: #bfff00;
        box-shadow: 0 0 0 0.25rem rgba(191, 255, 0, 0.25);
    }
    /* Mensajes de validación */
    .text-danger.small {
        font-weight: 500;
        margin-top: 4px;
        display: block;
    }
    /* Botón con efecto hover */
    .btn-outline-lima {
        background-color: #bfff00;
        border-color: #9acd32;
        color: #000;
    }
    .btn-outline-lima:hover {
        background-color: #a3d000;
        border-color: #7cb342;
        color: #000;
        transform: scale(1.02);
        transition: all 0.2s ease;
    }
    /* Separación entre columnas en móviles */
    @media (max-width: 768px) {
        .card-body {
            padding: 1.5rem !important;
        }
    }
    /* Ícono en encabezado */
    .bi-person-plus {
        font-size: 1.5rem;
        vertical-align: middle;
    }
</style>
</asp:Content>
