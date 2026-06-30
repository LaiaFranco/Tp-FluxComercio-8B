<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Cliente.aspx.cs" Inherits="FlexComercio.Cliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <div class="container-fluid py-4">

        <!-- Encabezado -->
        <div class="d-flex justify-content-between align-items-start mb-4">
            <div>
                <h1 class="fw-bold text-dark mb-0">Clientes</h1>
                <p class="text-secondary fs-4 mb-0">Gestión de clientes</p>
            </div>
            <asp:LinkButton ID="btnNuevoCliente" runat="server"
                CssClass="btn btn-dark btn-lg px-4 py-3 rounded-4"
                OnClick="btnNuevoCliente_Click">
                <i class="bi bi-plus-lg me-2"></i> Nuevo Cliente
            </asp:LinkButton>
        </div>

        <!-- Card Principal -->
        <div class="card shadow-sm border-0 rounded-4">

            <!-- Buscador -->
            <div class="card-header bg-white border-bottom p-4">
                <div class="input-group">
                    <span class="input-group-text bg-white border-end-0 rounded-start-4">
                        <i class="bi bi-search text-secondary fs-4"></i>
                    </span>
                    <input type="text" class="form-control border-start-0 rounded-end-4 py-3"
                           placeholder="Buscar por nombre, email o DNI..." />
                </div>
            </div>

           <!-- Lista de Clientes - Versión mejorada -->
<div class="container-fluid mt-4">
    <asp:GridView ID="dgvClientes" runat="server"
        AutoGenerateColumns="false"
        CssClass="table "
        DataKeyNames="Id">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <!-- Card con diseño mejorado -->
                    <div class="card  rounded-4 mb-4 p-3">
                        <div class="row g-0 align-items-center">

                            <!-- COLUMNA DEL ICONO (más grande y con fondo degradado) -->
                            <div class="col-md-2 col-lg-1 text-center">
                                <div class="bg-gradient-primary rounded-4 p-4 d-inline-block" style="background: linear-gradient(135deg, #e0e7ff, #f0f4ff);">
                                    <i class="bi bi-person-fill fs-1 text-primary"></i>
                                </div>
                            </div>

                            <!-- COLUMNA DE DATOS (mejor presentación) -->
                            <div class="col-md-7 col-lg-8">
                                <h3 class="fw-bold mb-1 text-dark">
                                    <%# Eval("Nombre") %> <%# Eval("Apellido") %>
                                </h3>
                                <div class="row g-2 mt-2">
                                    <div class="col-sm-6 col-lg-4">
                                        <span class="badge bg-light text-dark p-2 w-100 text-start">
                                            <i class="bi bi-person-badge me-1"></i> <strong>DNI:</strong> <%# Eval("Dni") %>
                                        </span>
                                    </div>
                                    <div class="col-sm-6 col-lg-4">
                                        <span class="badge bg-light text-dark p-2 w-100 text-start">
                                            <i class="bi bi-envelope me-1"></i> <strong>Email:</strong> <%# Eval("Email") %>
                                        </span>
                                    </div>
                                    <div class="col-sm-6 col-lg-4">
                                        <span class="badge bg-light text-dark p-2 w-100 text-start">
                                            <i class="bi bi-phone me-1"></i> <strong>Teléfono:</strong> <%# Eval("Telefono") %>
                                        </span>
                                    </div>
                                    <div class="col-12">
                                        <span class="badge bg-light text-dark p-2 w-100 text-start">
                                            <i class="bi bi-geo-alt me-1"></i> <strong>Dirección:</strong> <%# Eval("Direccion") %>
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <!-- COLUMNA DE BOTONES (más grandes y con iconos) -->
                            <div class="col-md-3 col-lg-3 text-end mt-3 mt-md-0">
                              <div class="d-flex flex-wrap justify-content-end gap-2">
    <!-- Botón Eliminar -->
    <asp:Button ID="btnEliminar" runat="server"
        Text="Eliminar"
        CssClass="btn btn-outline-danger rounded-pill px-4 py-2"
        CommandArgument='<%# Eval("Id") %>'
        OnClick="btnEliminar_Click" />

    <!-- Botón Modificar -->
    <asp:Button ID="btnModificar" runat="server"
        Text="Editar"
        CssClass="btn btn-outline-warning rounded-pill px-4 py-2"
        OnClick="btnModificar_Click" />
</div>
                            </div>

                        </div>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>

<!-- (Opcional) Estilo adicional para mejorar el contraste y la fluidez -->
<style>
    /* Sombra más suave al hacer hover */
    .card {
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }
    .card:hover {
        transform: translateY(-2px);
        box-shadow: 0 1rem 3rem rgba(0,0,0,.175) !important;
    }
    /* Badges con mejor legibilidad */
    .badge.bg-light {
        font-weight: 400;
        font-size: 0.95rem;
        border: 1px solid #dee2e6;
        border-radius: 0.5rem !important;
    }
    /* Iconos dentro de badges */
    .badge i {
        font-size: 1.1rem;
    }
    /* Botones más atractivos */
    .btn-outline-danger, .btn-outline-warning {
        border-width: 2px;
        font-weight: 600;
    }
    .btn-outline-danger:hover, .btn-outline-warning:hover {
        transform: scale(1.02);
        transition: all 0.15s ease;
    }
</style>

    <!-- ========== MODAL DE CONFIRMACIÓN ========== -->
    <div id="divConfirmarEliminar" runat="server" visible="false">
    <div class="card p-4 border-0 shadow-sm">
        <h3 class="text-danger mb-3">
            <i class="bi bi-exclamation-triangle-fill me-2"></i>Eliminar Cliente
        </h3>

        <p class="fs-5">¿Está seguro de que desea eliminar este cliente?</p>
        <p class="text-muted">Esta acción no se puede deshacer.</p>

        <hr />

        <div class="d-flex gap-3 mt-4">
            <asp:Button ID="btnConfirmarEliminar" runat="server"
                Text="Aceptar"
                CssClass="btn btn-danger btn-lg rounded-pill px-5"
                OnClick="btnConfirmarEliminar_Click" />

            <button type="button"
                class="btn btn-secondary btn-lg rounded-pill px-5"
                onclick="history.back();">
                Cancelar
            </button>
        </div>
    </div>
</div>
   
<asp:HiddenField ID="hfClienteId" runat="server" Value="0" ClientIDMode="Static" />

    <script type="text/javascript">
        function guardarIdYMostrarModal(id) {
            document.getElementById('hfClienteId').value = id;
            var myModal = new bootstrap.Modal(document.getElementById('modalConfirmar'));
            myModal.show();
        }
    </script>
</asp:Content>
