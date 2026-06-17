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
                    OnClick="btnNuevoCliente_Click"   >
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

                <input type="text"
                       class="form-control border-start-0 rounded-end-4 py-3"
                       placeholder="Buscar por nombre, email o DNI..." />
            </div>

        </div>

        <!-- Estado vacío -->
        <div class="container mt-4">


    <!-- LISTA CLIENTES -->
    <asp:GridView ID="dgvClientes" 
            runat="server"
            AutoGenerateColumns="false"
            CssClass="table border-0"
            DataKeyNames="Id">

            <Columns>

                <asp:TemplateField>

                    <ItemTemplate>

                        <div class="card shadow-sm border-0 rounded-4 mb-3 p-3">

                            <div class="row align-items-center">

                                <!-- ICONO -->
                                <div class="col-md-2 text-center">

                                    <div class="bg-light rounded-4 p-4">

                                        <i class="bi bi-person fs-1"></i>

                                    </div>

                                </div>

                                <!-- DATOS -->
                                <div class="col-md-7">

                                    <h3 class="fw-bold">
                                        <%# Eval("Nombre") %>
                                        <%# Eval("Apellido") %>
                                    </h3>

                                    <p class="mb-1">
                                        <strong>DNI:</strong>
                                        <%# Eval("Dni") %>
                                    </p>

                                    <p class="mb-1">
                                        <strong>Email:</strong>
                                        <%# Eval("Email") %>
                                    </p>

                                    <p class="mb-1">
                                        <strong>Teléfono:</strong>
                                        <%# Eval("Telefono") %>
                                    </p>

                                    <p class="mb-0">
                                        <strong>Dirección:</strong>
                                        <%# Eval("Direccion") %>
                                    </p>

                                </div>

                                <!-- BOTONES -->
                                <div class="col-md-3 text-end">

                                    <asp:Button
                                        ID="btnEliminar"
                                        runat="server"
                                        Text="Eliminar"
                                        CssClass="btn btn-outline-danger rounded-pill me-2" />

                                    <asp:Button
                                        ID="btnModificar"
                                        runat="server"
                                        Text="Editar"
                                        CssClass="btn btn-outline-warning rounded-pill" />

                                </div>

                            </div>

                        </div>

                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>

    </asp:GridView >

</div>
    </div>
</div>
</asp:Content>
