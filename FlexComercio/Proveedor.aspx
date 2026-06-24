<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Proveedor.aspx.cs" Inherits="FlexComercio.Proveedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid py-4">

    <!-- Encabezado -->
    <div class="d-flex justify-content-between align-items-start mb-4">
        <div>
            <h1 class="fw-bold text-dark mb-0">Proveedores</h1>
            <p class="text-secondary fs-4 mb-0">Gestión de proveedores</p>
        </div>

        <a href="AgregarProveedor.aspx"
           class="btn btn-dark btn-lg px-4 py-3 rounded-4">
            <i class="bi bi-plus-lg me-2"></i> Nuevo Proveedor
        </a>
    </div>

    <!-- Card principal -->
    <div class="card shadow-sm border-0 rounded-4">

        <!-- Buscador -->
        <div class="card-header bg-white border-bottom p-4">
            <div class="input-group">
                <span class="input-group-text bg-white border-end-0 rounded-start-4">
                    <i class="bi bi-search text-secondary fs-4"></i>
                </span>
                <input type="text"
                       class="form-control border-start-0 rounded-end-4 py-3"
                       placeholder="Buscar por nombre, email o CUIT..." />
            </div>
        </div>

        <!-- Lista Proveedores (MISMO ESTILO CLIENTES) -->
        <div class="container-fluid mt-4">

            <asp:GridView ID="dgvProveedores" runat="server"
                AutoGenerateColumns="false"
                CssClass="table"
                DataKeyNames="id"
                OnRowCommand="dgvProveedores_RowCommand">

                <Columns>

                    <asp:TemplateField>
                        <ItemTemplate>

                            <!-- CARD PROVEEDOR (IGUAL A CLIENTES) -->
                            <div class="card rounded-4 mb-4 p-3 proveedor-card">

                                <div class="row g-0 align-items-center">

                                    <!-- ICONO (igual estilo cliente) -->
                                    <div class="col-md-2 col-lg-1 text-center">
                                        <div class="rounded-4 p-4 d-inline-block"
                                             style="background: linear-gradient(135deg, #fff3cd, #ffe8a1);">
                                            <i class="bi bi-truck fs-1 text-warning"></i>
                                        </div>
                                    </div>

                                    <!-- DATOS (MISMO FORMATO CLIENTES) -->
                                    <div class="col-md-7 col-lg-8">

                                        <h3 class="fw-bold mb-1 text-dark">
                                            <%# Eval("nombre") %>
                                        </h3>

                                        <div class="row g-2 mt-2">

                                            <div class="col-sm-6 col-lg-4">
                                                <span class="badge bg-light text-dark p-2 w-100 text-start">
                                                    <i class="bi bi-credit-card me-1"></i>
                                                    <strong>CUIL:</strong> <%# Eval("cuil") %>
                                                </span>
                                            </div>

                                            <div class="col-sm-6 col-lg-4">
                                                <span class="badge bg-light text-dark p-2 w-100 text-start">
                                                    <i class="bi bi-envelope me-1"></i>
                                                    <strong>Email:</strong> <%# Eval("email") %>
                                                </span>
                                            </div>

                                            <div class="col-sm-6 col-lg-4">
                                                <span class="badge bg-light text-dark p-2 w-100 text-start">
                                                    <i class="bi bi-phone me-1"></i>
                                                    <strong>Teléfono:</strong> <%# Eval("telefono") %>
                                                </span>
                                            </div>

                                            <div class="col-12">
                                                <span class="badge bg-light text-dark p-2 w-100 text-start">
                                                    <i class="bi bi-geo-alt me-1"></i>
                                                    <strong>Dirección:</strong> <%# Eval("direccion") %>
                                                </span>
                                            </div>

                                        </div>

                                    </div>

                                    <!-- BOTONES (IGUAL CLIENTES) -->
                                    <div class="col-md-3 col-lg-3 text-end mt-3 mt-md-0">

                                        <div class="d-flex flex-wrap justify-content-end gap-2">

                                            <asp:Button ID="btnEliminar" runat="server"
                                                Text="Eliminar"
                                                CommandName="EliminarProveedor"
                                                CommandArgument='<%# Eval("id") %>'
                                                CssClass="btn btn-outline-danger rounded-pill px-4 py-2"
                                                OnClientClick="return confirm('¿Deseas eliminar este proveedor?');" />

                                            <asp:Button ID="btnModificar" runat="server"
                                                Text="Editar"
                                                CommandName="ModificarProveedor"
                                                CommandArgument='<%# Eval("id") %>'
                                                CssClass="btn btn-outline-warning rounded-pill px-4 py-2" />

                                        </div>

                                    </div>

                                </div>

                            </div>

                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

    </div>
</div>
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
</asp:Content>
