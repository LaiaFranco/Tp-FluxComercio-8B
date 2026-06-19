<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="MarcaYCategoria.aspx.cs" Inherits="FlexComercio.MarcaYCategoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid py-4">

    <!-- TITULO -->
    <div class="mb-4">
        <h1 class="fw-bold mb-1">Marcas y Categorías</h1>

        <p class="text-secondary fs-4 mb-0">
            Gestión de marcas y categorías de productos
        </p>
    </div>

    <!-- ========================= -->
    <!-- MARCAS -->
    <!-- ========================= -->

    <div class="card border-0 shadow-sm rounded-4 mb-5">

        <!-- HEADER -->
        <div class="card-header bg-white d-flex justify-content-between align-items-center py-4 px-4">

            <div class="d-flex align-items-center">

                <i class="bi bi-tag fs-3 me-3"></i>

                <h2 class="h3 fw-semibold mb-0">
                    Marcas
                </h2>

            </div>

            <asp:Button
                ID="btnNuevaMarca"
                runat="server"
                Text="Nueva Marca"
                CssClass="btn btn-dark rounded-4 px-4 py-2"
                OnClick="btnNuevaMarca_Click"/>

        </div>

        <!-- GRIDVIEW MARCAS -->
        <div class="p-4">

            <asp:GridView ID="dgvMarcas"
                runat="server"
                AutoGenerateColumns="false"
                CssClass="table border-0"
                DataKeyNames="Id" OnSelectedIndexChanged="dgvMarcas_SelectedIndexChanged">

                <Columns>

                    <asp:TemplateField>

                        <ItemTemplate>

                            <div class="card shadow-sm border-0 rounded-4 mb-3 p-4">

                                <div class="row align-items-center">

                                    <!-- ICONO -->
                                    <div class="col-md-2 text-center">

                                        <div class="bg-light rounded-4 p-4">

                                            <i class="bi bi-tag fs-1"></i>

                                        </div>

                                    </div>

                                    <!-- DATOS -->
                                    <div class="col-md-7">

                                        <h3 class="fw-bold mb-2">
                                            <%# Eval("Nombre") %>
                                        </h3>

                                        <p class="mb-2 text-secondary">
                                            <%# Eval("Descripcion") %>
                                        </p>

                                        <p class="mb-0">

                                            <strong>Estado:</strong>

                                            <%# (bool)Eval("Activo") ? "Activo" : "Inactivo" %>

                                        </p>

                                    </div>

                                    <!-- BOTONES -->
                                    <div class="col-md-3 text-end">

                                        <asp:Button
                                            ID="btnEliminarMarca"
                                            runat="server"
                                            Text="Eliminar"
                                            CssClass="btn btn-outline-danger rounded-pill me-2"
                                            CommandArgument='<%# Container.DataItemIndex %>'
                                            OnClick="btnEliminarMarca_Click"
                                            />

                                        <asp:Button
                                            ID="btnModificarMarca"
                                            runat="server"
                                            Text="Modificar"
                                            CssClass="btn btn-outline-warning rounded-pill" 
                                            CommandArgument='<%# Container.DataItemIndex %>'
                                            OnClick ="btnModificarMarca_Click"
                                            />
                                    </div>

                                </div>

                            </div>

                        </ItemTemplate>

                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

    </div>

    <!-- ========================= -->
    <!-- CATEGORIAS -->
    <!-- ========================= -->

    <div class="card border-0 shadow-sm rounded-4">

        <!-- HEADER -->
        <div class="card-header bg-white d-flex justify-content-between align-items-center py-4 px-4">

            <div class="d-flex align-items-center">

                <i class="bi bi-folder fs-3 me-3"></i>

                <h2 class="h3 fw-semibold mb-0">
                    Categorías
                </h2>

            </div>

            <asp:Button
                ID="btnNuevaCategoria"
                runat="server"
                Text="Nueva Categoría"
                CssClass="btn btn-dark rounded-4 px-4 py-2"
                OnClick="btnNuevaCategoria_Click"/>

        </div>

        <!-- GRIDVIEW CATEGORIAS -->
        <div class="p-4">

            <asp:GridView ID="dgvCategorias"
                runat="server"
                AutoGenerateColumns="false"
                CssClass="table border-0"
                DataKeyNames="Id">

                <Columns>

                    <asp:TemplateField>

                        <ItemTemplate>

                            <div class="card shadow-sm border-0 rounded-4 mb-3 p-4">

                                <div class="row align-items-center">

                                    <!-- ICONO -->
                                    <div class="col-md-2 text-center">

                                        <div class="bg-light rounded-4 p-4">

                                            <i class="bi bi-folder fs-1"></i>

                                        </div>

                                    </div>

                                    <!-- DATOS -->
                                    <div class="col-md-7">

                                        <h3 class="fw-bold mb-2">
                                            <%# Eval("Nombre") %>
                                        </h3>

                                        <p class="mb-2 text-secondary">
                                            <%# Eval("Descripcion") %>
                                        </p>

                                        <p class="mb-0">

                                            <strong>Estado:</strong>

                                            <%# (bool)Eval("Activo") ? "Activo" : "Inactivo" %>

                                        </p>

                                    </div>

                                    <!-- BOTONES -->
                                    <div class="col-md-3 text-end">

                                        <asp:Button
                                            ID="btnEliminarCategoria"
                                            runat="server"
                                            Text="Eliminar"
                                            CssClass="btn btn-outline-danger rounded-pill me-2"
                                            CommandArgument='<%# Container.DataItemIndex %>'
                                            OnClick="btnEliminarCategoria_Click1"
                                            />

                                        <asp:Button
                                            ID="btnModificarCategoria"
                                            runat="server"
                                            Text="Modificar"
                                            CssClass="btn btn-outline-warning rounded-pill" 
                                            CommandArgument='<%# Container.DataItemIndex %>'
                                            OnClick="btnModificarCategoria_Click"/>

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