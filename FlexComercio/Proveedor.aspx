<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Proveedor.aspx.cs" Inherits="FlexComercio.Proveedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid py-4">

    <!-- Encabezado -->
    <div class="d-flex justify-content-between align-items-start mb-4">
        <div>
            <h1 class="fw-bold mb-1">Proveedores</h1>
            <p class="text-secondary fs-4 mb-0">Gestión de proveedores</p>     
        </div>
    <!-- Agregar Proveedor -->
         <a href="AgregarProveedor.aspx" class="btn btn-dark btn-lg px-4 py-3 rounded-4">
          <i class="bi bi-plus-lg me-2"></i>
          Nuevo Proveedor
         </a>
    </div>

    <!-- Card principal -->
    <div class="card shadow-sm border-0 rounded-4">

        <!-- Buscador -->
        <div class="card-header bg-white border-bottom p-4">
            <div class="input-group">
                <span class="input-group-text bg-white border-end-0">
                    <i class="bi bi-search"></i>
                </span>
                <input type="text"
                       class="form-control border-start-0"
                       placeholder="Buscar por nombre, email o CUIT...">
            </div>
        </div>

        <!-- Estado vacío -->
        <asp:GridView ID="dgvProveedores" runat="server"
            CssClass="table"
            AutoGenerateColumns="false"
            DataKeyNames="id">
            <Columns>
                <asp:BoundField HeaderText="CUIL" DataField="cuil" />
                <asp:BoundField HeaderText="Nombre" DataField="nombre" />
                <asp:BoundField HeaderText="Email" DataField="email" />
                <asp:BoundField HeaderText="Teléfono" DataField="telefono" />
                <asp:BoundField HeaderText="Dirección" DataField="direccion" />
                <asp:CheckBoxField HeaderText="Activo" DataField="activo" />
            </Columns>
        </asp:GridView>

    </div>

</div>
</asp:Content>
