<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="MarcaYCategoria.aspx.cs" Inherits="FlexComercio.MarcaYCategoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <div class="container-fluid py-4">

    <!-- TITULO GENERAL -->
    <div class="mb-4">

        <h1 class="fw-bold mb-1">Marcas y Categorías</h1>

        <p class="text-secondary fs-4 mb-0">
            Gestión de marcas y categorías de productos
        </p>

    </div>
  
        <!-- Buscador y filtro -->
        <div class="card-header bg-white border-bottom p-4">
            <div class="row g-3">

                <!-- Buscador -->
                <div class="col-md-8">
                    <div class="input-group">

                        <span class="input-group-text bg-white border-end-0 rounded-start-4">
                            <i class="bi bi-search text-secondary fs-4"></i>
                        </span>

                        <asp:TextBox
                            ID="txtBuscar"
                            runat="server"
                            CssClass="form-control border-start-0 rounded-end-4 py-3"
                            placeholder="Buscar marcas o categorías..."
                            AutoPostBack="true"
                            OnTextChanged="txtBuscar_TextChanged" />

                    </div>
                </div>

                <!-- Filtro -->
                <div class="col-md-4">
                    <asp:DropDownList
                        ID="ddlFiltro"
                        runat="server"
                        CssClass="form-select py-3"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddlFiltro_SelectedIndexChanged">

                        <asp:ListItem Text="Mostrar todo" Value="Todos" Selected="True" />
                        <asp:ListItem Text="Solo Marcas" Value="Marca" />
                        <asp:ListItem Text="Solo Categorías" Value="Categoria" />

                    </asp:DropDownList>
                </div>

            </div>
        </div>

    <!-- ================= MARCAS ================= -->
    <div class="card shadow-sm border-0 rounded-4 mb-5">

        <!-- HEADER MARCAS (BOTÓN ALINEADO) -->
        
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
                CssClass="btn btn-dark btn-lg px-4 py-3 rounded-4"
                OnClick="btnNuevaMarca_Click" />

        </div>
        

        <!-- GRID MARCAS -->
        <div class="container-fluid mt-4">

            <asp:GridView ID="dgvMarcas"
                runat="server"
                AutoGenerateColumns="false"
                CssClass="table"
                DataKeyNames="Id">

                <Columns>

                    <asp:TemplateField>

                        <ItemTemplate>

                            <div class="card marca-card rounded-4 mb-4 p-3">

                                <div class="row g-0 align-items-center">

                                    <div class="col-md-2 col-lg-1 text-center">

                                        <div class="rounded-4 p-4 d-inline-block"
                                             style="background: linear-gradient(135deg, #e0f7fa, #e3f2fd);">

                                            <i class="bi bi-tag fs-1 text-primary"></i>

                                        </div>

                                    </div>

                                    <div class="col-md-7 col-lg-8">

                                        <h3 class="fw-bold mb-1 text-dark">
                                            <%# Eval("Nombre") %>
                                        </h3>

                                        <div class="row g-2 mt-2">

                                            <div class="col-12">
                                                <span class="badge bg-light text-dark p-2 w-100 text-start">
                                                    <i class="bi bi-card-text me-1"></i>
                                                    <strong>Descripción:</strong>
                                                    <%# Eval("Descripcion") %>
                                                </span>
                                            </div>

                                            <div class="col-12">
                                                <span class="badge bg-light text-dark p-2 w-100 text-start">
                                                    <i class="bi bi-check-circle me-1"></i>
                                                    <strong>Estado:</strong>
                                                    <%# (bool)Eval("Activo") ? "Activo" : "Inactivo" %>
                                                </span>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="col-md-3 col-lg-3 text-end">

                                        <div class="d-flex justify-content-end gap-2">

                                            <asp:Button ID="btnEliminarMarca"
                                                runat="server"
                                                Text="Eliminar"
                                                CssClass="btn btn-outline-danger rounded-pill px-4 py-2"
                                                CommandArgument='<%# Container.DataItemIndex %>'
                                                OnClick="btnEliminarMarca_Click" />

                                            <asp:Button ID="btnModificarMarca"
                                                runat="server"
                                                Text="Editar"
                                                CssClass="btn btn-outline-warning rounded-pill px-4 py-2"
                                                CommandArgument='<%# Container.DataItemIndex %>'
                                                OnClick="btnModificarMarca_Click" />

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

    <!-- ================= CATEGORÍAS ================= -->
   <div class="card shadow-sm border-0 rounded-4 mb-5">
        
        <!-- HEADER CATEGORÍAS (BOTÓN ALINEADO) -->
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
                CssClass="btn btn-dark btn-lg px-4 py-3 rounded-4"
                OnClick="btnNuevaCategoria_Click" />

        </div>

        <!-- GRID CATEGORÍAS -->
        <div class="container-fluid mt-4">

            <asp:GridView ID="dgvCategorias"
                runat="server"
                AutoGenerateColumns="false"
                CssClass="table"
                DataKeyNames="Id">

                <Columns>

                    <asp:TemplateField>

                        <ItemTemplate>

                            <div class="card categoria-card rounded-4 mb-4 p-3">

                                <div class="row g-0 align-items-center">

                                    <div class="col-md-2 col-lg-1 text-center">

                                        <div class="rounded-4 p-4 d-inline-block"
                                             style="background: linear-gradient(135deg, #fff3e0, #ffe0b2);">

                                            <i class="bi bi-folder fs-1 text-warning"></i>

                                        </div>

                                    </div>

                                    <div class="col-md-7 col-lg-8">

                                        <h3 class="fw-bold mb-1 text-dark">
                                            <%# Eval("Nombre") %>
                                        </h3>

                                        <div class="row g-2 mt-2">

                                            <div class="col-12">
                                                <span class="badge bg-light text-dark p-2 w-100 text-start">
                                                    <i class="bi bi-card-text me-1"></i>
                                                    <strong>Descripción:</strong>
                                                    <%# Eval("Descripcion") %>
                                                </span>
                                            </div>

                                            <div class="col-12">
                                                <span class="badge bg-light text-dark p-2 w-100 text-start">
                                                    <i class="bi bi-check-circle me-1"></i>
                                                    <strong>Estado:</strong>
                                                    <%# (bool)Eval("Activo") ? "Activo" : "Inactivo" %>
                                                </span>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="col-md-3 col-lg-3 text-end">

                                        <div class="d-flex justify-content-end gap-2">

                                            <asp:Button ID="btnEliminarCategoria"
                                                runat="server"
                                                Text="Eliminar"
                                                CssClass="btn btn-outline-danger rounded-pill px-4 py-2"
                                                CommandArgument='<%# Container.DataItemIndex %>'
                                                OnClick="btnEliminarCategoria_Click1" />

                                            <asp:Button ID="btnModificarCategoria"
                                                runat="server"
                                                Text="Editar"
                                                CssClass="btn btn-outline-warning rounded-pill px-4 py-2"
                                                CommandArgument='<%# Container.DataItemIndex %>'
                                                OnClick="btnModificarCategoria_Click" />

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