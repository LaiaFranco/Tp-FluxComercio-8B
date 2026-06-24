<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="FlexComercio.Producto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid py-4">

    <!-- ENCABEZADO -->
    <div class="d-flex justify-content-between align-items-start mb-4">

        <div>
            <h1 class="fw-bold text-dark mb-0">Productos</h1>
            <p class="text-secondary fs-4 mb-0">Gestión de productos</p>
        </div>

        <asp:Button ID="btnNuevoProducto"
            runat="server"
            Text="+ Nuevo Producto"
            CssClass="btn btn-dark btn-lg px-4 py-3 rounded-4"
            OnClick="btnNuevoProducto_Click" />

    </div>

    <!-- CARD PRINCIPAL -->
    <div class="card shadow-sm border-0 rounded-4">

        <!-- BUSCADOR -->
        <div class="card-header bg-white border-bottom p-4">
            <div class="input-group">

                <span class="input-group-text bg-white border-end-0 rounded-start-4">
                    <i class="bi bi-search text-secondary fs-4"></i>
                </span>

                <input type="text"
                       class="form-control border-start-0 rounded-end-4 py-3"
                       placeholder="Buscar productos..." />

            </div>
        </div>

        <!-- LISTA PRODUCTOS -->
        <div class="container-fluid mt-4">

            <asp:GridView ID="dgvProductos"
                runat="server"
                AutoGenerateColumns="false"
                CssClass="table"
                DataKeyNames="Id">

                <Columns>

                    <asp:TemplateField>

                        <ItemTemplate>

                            <!-- CARD PRODUCTO -->
                            <div class="card producto-card rounded-4 mb-4 p-3">

                                <div class="row g-0 align-items-center">

                                    <!-- IMAGEN -->
                                    <div class="col-md-2 col-lg-2 text-center">

                                        <div class="bg-light rounded-4 p-3">

                                            <img src='<%# Eval("Imagen.Url") %>'
                                                 class="img-fluid rounded-3"
                                                 style="max-height:130px; object-fit:contain;" />

                                        </div>

                                    </div>

                                    <!-- DATOS -->
                                    <div class="col-md-7 col-lg-7">

                                        <h3 class="fw-bold mb-2 text-dark">
                                            <%# Eval("Nombre") %>
                                        </h3>

                                        <div class="row g-2 mt-2 fs-5">

                                            <div class="col-12">
                                                <span class="badge bg-light text-dark p-3 w-100 text-start">
                                                    <i class="bi bi-card-text me-1"></i>
                                                    <strong>Descripción:</strong> <%# Eval("Descripcion") %>
                                                </span>
                                            </div>

                                            <div class="col-sm-6">
                                                <span class="badge bg-light text-dark p-3 w-100 text-start">
                                                    <i class="bi bi-tag me-1"></i>
                                                    <strong>Marca:</strong> <%# Eval("Marca.Nombre") %>
                                                </span>
                                            </div>

                                            <div class="col-sm-6">
                                                <span class="badge bg-light text-dark p-3 w-100 text-start">
                                                    <i class="bi bi-list me-1"></i>
                                                    <strong>Categoría:</strong> <%# Eval("Categoria.Nombre") %>
                                                </span>
                                            </div>

                                            <div class="col-sm-6">
                                                <span class="badge bg-light text-dark p-3 w-100 text-start">
                                                    <i class="bi bi-boxes me-1"></i>
                                                    <strong>Stock:</strong> <%# Eval("StockActual") %>
                                                </span>
                                            </div>

                                            <div class="col-sm-6">
                                                <span class="badge bg-light text-dark p-3 w-100 text-start">
                                                    <i class="bi bi-exclamation-triangle me-1"></i>
                                                    <strong>Mínimo:</strong> <%# Eval("StockMinimo") %>
                                                </span>
                                            </div>

                                            <div class="col-sm-6">
                                                <span class="badge bg-light text-dark p-3 w-100 text-start">
                                                    <i class="bi bi-graph-up me-1"></i>
                                                    <strong>Ganancia:</strong> <%# Eval("PorcentajeGanancia") %>%
                                                </span>
                                            </div>

                                            <div class="col-12">
                                                <span class="badge bg-light text-dark p-3 w-100 text-start">
                                                    <i class="bi bi-truck me-1"></i>
                                                    <strong>Proveedor:</strong> <%# Eval("Proveedor.Nombre") %>
                                                </span>
                                            </div>

                                        </div>

                                    </div>

                                    <!-- BOTONES -->
                                    <div class="col-md-3 col-lg-3 text-end mt-3 mt-md-0">

                                        <div class="d-flex flex-wrap justify-content-end gap-2">

                                            <asp:Button ID="btnEliminar"
                                                runat="server"
                                                Text="Eliminar"
                                                CssClass="btn btn-outline-danger rounded-pill px-4 py-2"
                                                CommandArgument='<%# Eval("Id") %>'
                                                OnClick="btnEliminar_Click" />

                                            <asp:Button ID="btnModificar"
                                                runat="server"
                                                Text="Editar"
                                                CssClass="btn btn-outline-warning rounded-pill px-4 py-2"
                                                CommandArgument='<%# Eval("Id") %>'
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
