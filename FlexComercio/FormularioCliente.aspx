<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="FormularioCliente.aspx.cs" Inherits="FlexComercio.FormularioCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid mt-4" style="min-height: 100vh; background-color: #ffffff; padding: 20px;">

    <div class="row justify-content-center">

        <div class="col-md-8 col-lg-6">

            <div style="background-color: #ffffff; border-radius: 10px; padding: 30px;">

                <!-- TITULO -->
                <h2 class="mb-4"
                    style="color: #1a1a1a; border-bottom: 2px solid #32CD32; padding-bottom: 10px; font-weight: 600;">
                    <asp:Label ID="lblTitulo" runat="server" Text="Registro de Cliente" />
                </h2>

                <asp:Label ID="lblMensaje" runat="server" CssClass="alert alert-info w-100" Visible="false" />

                <!-- ========== PANEL ELIMINAR ========== -->
                <div id="divConfirmarEliminar" runat="server" visible="false">

                    <div class="card p-4 border-0 shadow-sm">

                        <h3 class="text-danger mb-3">
                            <i class="bi bi-exclamation-triangle-fill me-2"></i>Eliminar Cliente
                        </h3>

                        <p class="fs-5">¿Estás seguro de que deseas eliminar este cliente?</p>

                        <hr />

                        <dl class="row mt-3">

                            <dt class="col-sm-3 fw-bold">Nombre</dt>
                            <dd class="col-sm-9">
                                <asp:Label ID="lblConfirmNombre" runat="server" CssClass="fw-semibold" />
                            </dd>

                            <dt class="col-sm-3 fw-bold">Apellido</dt>
                            <dd class="col-sm-9">
                                <asp:Label ID="lblConfirmApellido" runat="server" CssClass="fw-semibold" />
                            </dd>

                            <dt class="col-sm-3 fw-bold">DNI</dt>
                            <dd class="col-sm-9">
                                <asp:Label ID="lblConfirmDNI" runat="server" CssClass="fw-semibold" />
                            </dd>

                            <dt class="col-sm-3 fw-bold">Email</dt>
                            <dd class="col-sm-9">
                                <asp:Label ID="lblConfirmEmail" runat="server" CssClass="fw-semibold" />
                            </dd>

                            <dt class="col-sm-3 fw-bold">Teléfono</dt>
                            <dd class="col-sm-9">
                                <asp:Label ID="lblConfirmTelefono" runat="server" CssClass="fw-semibold" />
                            </dd>

                            <dt class="col-sm-3 fw-bold">Dirección</dt>
                            <dd class="col-sm-9">
                                <asp:Label ID="lblConfirmDireccion" runat="server" CssClass="fw-semibold" />
                            </dd>

                        </dl>

                        <div class="d-flex gap-3 mt-4">

                            <asp:Button ID="btnEliminarConfirm" runat="server"
                                Text="Eliminar"
                                CssClass="btn btn-danger btn-lg rounded-pill px-5"
                                OnClick="btnBorrar_Click" />

                            <asp:Button ID="btnCancelarConfirm" runat="server"
                                Text="Cancelar"
                                CssClass="btn btn-secondary btn-lg rounded-pill px-5"
                                OnClick="btnCancelar_Click" />

                        </div>

                    </div>

                </div>

                <!-- ========== FORMULARIO ========== -->
                <div id="divFormulario" runat="server" visible="true">

                    <!-- DNI -->
                    <div class="mb-3">
                        <label class="form-label" style="color:#1a1a1a; font-weight:500;">
                            DNI *
                        </label>

                        <asp:TextBox ID="txtDNI" runat="server"
                            CssClass="form-control"
                            style="border-color:#dcdcdc; border-width:2px;" />

                        <asp:RequiredFieldValidator runat="server"
                            ControlToValidate="txtDNI"
                            ErrorMessage="El DNI es obligatorio."
                            CssClass="text-danger"
                            Display="Dynamic" />
                    </div>

                    <!-- Nombre -->
                    <div class="mb-3">
                        <label class="form-label" style="color:#1a1a1a; font-weight:500;">
                            Nombre *
                        </label>

                        <asp:TextBox ID="txtNombre" runat="server"
                            CssClass="form-control"
                            style="border-color:#dcdcdc; border-width:2px;" />

                        <asp:RequiredFieldValidator runat="server"
                            ControlToValidate="txtNombre"
                            ErrorMessage="El nombre es obligatorio."
                            CssClass="text-danger"
                            Display="Dynamic" />
                    </div>

                    <!-- Apellido -->
                    <div class="mb-3">
                        <label class="form-label" style="color:#1a1a1a; font-weight:500;">
                            Apellido
                        </label>

                        <asp:TextBox ID="txtApellido" runat="server"
                            CssClass="form-control"
                            style="border-color:#dcdcdc; border-width:2px;" />
                    </div>

                    <!-- Email -->
                    <div class="mb-3">
                        <label class="form-label" style="color:#1a1a1a; font-weight:500;">
                            Email
                        </label>

                        <asp:TextBox ID="txtEmail" runat="server"
                            CssClass="form-control"
                            TextMode="Email"
                            style="border-color:#dcdcdc; border-width:2px;" />

                        <asp:RegularExpressionValidator runat="server"
                            ControlToValidate="txtEmail"
                            ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w+$"
                            ErrorMessage="Email inválido."
                            CssClass="text-danger"
                            Display="Dynamic" />
                    </div>

                    <!-- Teléfono -->
                    <div class="mb-3">
                        <label class="form-label" style="color:#1a1a1a; font-weight:500;">
                            Teléfono
                        </label>

                        <asp:TextBox ID="txtTelefono" runat="server"
                            CssClass="form-control"
                            style="border-color:#dcdcdc; border-width:2px;" />
                    </div>

                    <!-- Dirección -->
                    <div class="mb-3">
                        <label class="form-label" style="color:#1a1a1a; font-weight:500;">
                            Dirección
                        </label>

                        <asp:TextBox ID="txtDireccion" runat="server"
                            CssClass="form-control"
                            style="border-color:#dcdcdc; border-width:2px;" />
                    </div>

                    <!-- BOTONES -->
                    <div class="d-flex gap-2">

                        <asp:Button ID="btnGuardar" runat="server"
                            Text="Guardar Cliente"
                            CssClass="btn"
                            style="background-color:#32CD32; color:#fff; border:none; padding:10px 25px; font-weight:600;"
                            OnClick="btnGuardar_Click" />

                        <a href="javascript:history.back()"
                            class="btn"
                            style="background-color:#f5f5f5; color:#1a1a1a; border:2px solid #dcdcdc; padding:10px 25px;">
                            Cancelar
                        </a>

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