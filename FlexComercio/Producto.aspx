<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="FlexComercio.Producto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid py-4">

    <!-- Encabezado -->
    <div class="card-header bg-white d-flex justify-content-between align-items-center py-4 px-4">

    <div class="d-flex align-items-center">

        <i class="bi bi-box-seam fs-3 me-3"></i>

        <div>
            <h2 class="h3 fw-semibold mb-0">
                Productos
            </h2>

            <small class="text-muted">
                Gestión de productos
            </small>
        </div>

    </div>

    <asp:Button
        ID="btnNuevoProducto"
        runat="server"
        Text="Nuevo Producto"
        CssClass="btn btn-dark rounded-4 px-4 py-2"
        OnClick="btnNuevoProducto_Click" />

</div>

    <!-- Card -->
    <div class="card border-0 shadow-sm rounded-4">

        <!-- Buscador -->
        <div class="card-header bg-white border-bottom p-4">
            <div class="input-group">
                <span class="input-group-text bg-white border-end-0">
                    <i class="bi bi-search"></i>
                </span>

                <input type="text"
                       class="form-control border-start-0"
                       placeholder="Buscar productos...">
            </div>
        </div>

        <!-- Estado vacío -->
        <div class="p-4">

            <asp:GridView ID="dgvProductos"
                runat="server"
                AutoGenerateColumns="false"
                CssClass="table border-0"
                DataKeyNames="Id">

                <Columns>

                    <asp:TemplateField>

                        <ItemTemplate>

                            <div class="card shadow-sm border-0 rounded-4 mb-3 p-3">

                                <div class="row align-items-center">

                                    <!-- IMAGEN -->
                                    <div class="col-md-2 text-center">

                                        <div class="bg-light rounded-4 p-3">

                                            <img src='<%# Eval("Imagen.Url") %>'
                                                 class="img-fluid rounded-3"
                                                 style="max-height:120px;" />

                                        </div>

                                    </div>

                                    <!-- DATOS -->
                                    <div class="col-md-7">

                                        <h3 class="fw-bold mb-2">
                                            <%# Eval("Nombre") %>
                                        </h3>

                                        <p class="mb-1">
                                            <strong>Descripcion:</strong>
                                            <%# Eval("Descripcion") %>
                                        </p>

                                        <p class="mb-1">
                                            <strong>Marca:</strong>
                                            <%# Eval("Marca.Nombre") %>
                                        </p>

                                        <p class="mb-1">
                                            <strong>Categoría:</strong>
                                            <%# Eval("Categoria.Nombre") %>
                                        </p>

                                        <p class="mb-1">
                                            <strong>Stock:</strong>
                                            <%# Eval("StockActual") %>
                                        </p>

                                        <p class="mb-1">
                                            <strong>Stock mínimo:</strong>
                                            <%# Eval("StockMinimo") %>
                                        </p>

                                        <p class="mb-1">
                                            <strong>Ganancia:</strong>
                                            <%# Eval("PorcentajeGanancia") %>%
                                        </p>

                                        <p class="mb-0">
                                            <strong>Proveedor:</strong>
                                            <%# Eval("Proveedor.Nombre") %>
                                        </p>

                                    </div>

                                    <!-- BOTONES -->
                                    <div class="col-md-3 text-end">

                                        <asp:Button
                                            ID="btnEliminar"
                                            runat="server"
                                            Text="Eliminar"
                                            CssClass="btn btn-outline-danger rounded-pill me-2"
                                            OnClick="btnEliminar_Click"/>

                                        <asp:Button
                                            ID="btnModificar"
                                            runat="server"
                                            Text="Modificar"
                                            CssClass="btn btn-outline-warning rounded-pill"
                                            OnClick="btnModificar_Click"/>

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

</asp:Content>
