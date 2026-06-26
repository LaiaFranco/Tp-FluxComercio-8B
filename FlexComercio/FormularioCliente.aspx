<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="FormularioCliente.aspx.cs" Inherits="FlexComercio.FormularioCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid mt-4">
    <div class="row justify-content-center">
        <div class="col-12 col-xl-10">
            <div class="card shadow-lg border-0 rounded-4">
                <div class="card-header bg-lima text-black rounded-top-4" style="background-color: #bfff00 !important; border-bottom: 3px solid #9acd32;">
                    <h4 class="mb-0 fw-bold">
                        <i class="bi bi-person-plus me-2"></i>
                        <asp:Label ID="lblTitulo" runat="server" Text="Registro de Cliente" />
                    </h4>
                </div>
                <div class="card-body p-4 p-lg-5">

                    <asp:Label ID="lblMensaje" runat="server" CssClass="alert alert-info w-100" Visible="false" />

                    <!-- ========== PANEL DE CONFIRMACIÓN PARA ELIMINAR ========== -->
                    <div id="divConfirmarEliminar" runat="server" visible="false">
                        <div class="card p-4 border-0 shadow-sm">
                            <h3 class="text-danger mb-3">
                                <i class="bi bi-exclamation-triangle-fill me-2"></i>Eliminar Cliente
                            </h3>
                            <p class="fs-5">¿Estás seguro de que deseas eliminar este cliente?</p>
                            <hr />
                            <dl class="row mt-3">
                                <dt class="col-sm-3 fw-bold">Nombre</dt>
                                <dd class="col-sm-9"><asp:Label ID="lblConfirmNombre" runat="server" CssClass="fw-semibold" /></dd>

                                <dt class="col-sm-3 fw-bold">Apellido</dt>
                                <dd class="col-sm-9"><asp:Label ID="lblConfirmApellido" runat="server" CssClass="fw-semibold" /></dd>

                                <dt class="col-sm-3 fw-bold">DNI</dt>
                                <dd class="col-sm-9"><asp:Label ID="lblConfirmDNI" runat="server" CssClass="fw-semibold" /></dd>

                                <dt class="col-sm-3 fw-bold">Email</dt>
                                <dd class="col-sm-9"><asp:Label ID="lblConfirmEmail" runat="server" CssClass="fw-semibold" /></dd>

                                <dt class="col-sm-3 fw-bold">Teléfono</dt>
                                <dd class="col-sm-9"><asp:Label ID="lblConfirmTelefono" runat="server" CssClass="fw-semibold" /></dd>

                                <dt class="col-sm-3 fw-bold">Dirección</dt>
                                <dd class="col-sm-9"><asp:Label ID="lblConfirmDireccion" runat="server" CssClass="fw-semibold" /></dd>
                            </dl>
                            <div class="d-flex gap-3 mt-4">
                                <asp:Button ID="btnEliminarConfirm" runat="server" Text="Eliminar"
                                    CssClass="btn btn-danger btn-lg rounded-pill px-5"
                                    OnClick="btnBorrar_Click" />
                                <asp:Button ID="btnCancelarConfirm" runat="server" Text="Cancelar"
                                    CssClass="btn btn-secondary btn-lg rounded-pill px-5"
                                    OnClick="btnCancelar_Click" />
                            </div>
                        </div>
                    </div>

                    <!-- ========== FORMULARIO DE EDICIÓN / CREACIÓN ========== -->
                    <div id="divFormulario" runat="server" visible="true">
                        <div class="row g-4">
                            <div class="col-md-6">
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
                                <div class="mb-3">
                                    <label for="txtApellido" class="form-label fw-semibold">Apellido</label>
                                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control form-control-lg rounded-pill" placeholder="Ingrese su apellido" MaxLength="255" />
                                </div>
                            </div>
                            <div class="col-md-6">
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
                                <div class="mb-3">
                                    <label for="txtTelefono" class="form-label fw-semibold">Teléfono</label>
                                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control form-control-lg rounded-pill" placeholder="Ej: 555-123456" MaxLength="255" />
                                </div>
                                <div class="mb-3">
                                    <label for="txtDireccion" class="form-label fw-semibold">Dirección</label>
                                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control form-control-lg rounded-pill" placeholder="Calle, número, ciudad" MaxLength="255" />
                                </div>
                            </div>
                        </div>

                        <asp:ValidationSummary ID="vsResumen" runat="server"
                            CssClass="alert alert-danger mt-3"
                            HeaderText="<strong>Por favor, corrija los siguientes errores:</strong>"
                            DisplayMode="BulletList" />

                        <div class="d-grid mt-4">
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar Cliente"
                                CssClass="btn btn-lg rounded-pill fw-bold text-black"
                                style="background-color: #bfff00; border: 2px solid #9acd32;"
                                OnClick="btnGuardar_Click" />
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .card { background-color: #ffffff; border: 1px solid #e0e0e0; }
    .form-control { background-color: #fafafa; border: 2px solid #d0d0d0; transition: border-color 0.3s ease, box-shadow 0.3s ease; }
    .form-control:focus { border-color: #bfff00; box-shadow: 0 0 0 0.25rem rgba(191, 255, 0, 0.25); }
    .text-danger.small { font-weight: 500; margin-top: 4px; display: block; }
    .btn-outline-lima { background-color: #bfff00; border-color: #9acd32; color: #000; }
    .btn-outline-lima:hover { background-color: #a3d000; border-color: #7cb342; color: #000; transform: scale(1.02); transition: all 0.2s ease; }
    @media (max-width: 768px) { .card-body { padding: 1.5rem !important; } }
    .bi-person-plus { font-size: 1.5rem; vertical-align: middle; }
    /* Estilo para los dt/dd en el panel de confirmación */
    dl.row dt { font-weight: 600; }
    dl.row dd { margin-bottom: 0.5rem; }
</style>
</asp:Content>