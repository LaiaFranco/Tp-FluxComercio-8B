<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Compras.aspx.cs" Inherits="FlexComercio.Compras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid py-4">

    <!-- Encabezado -->
    <div class="d-flex justify-content-between align-items-start mb-4">
        <div>
            <h1 class="fw-bold mb-1">Compras</h1>
            <p class="text-secondary fs-4 mb-0">
                Registro de compras a proveedores
            </p>
        </div>

        <button class="btn btn-dark btn-lg rounded-4 px-4 py-3">
            <i class="bi bi-plus-lg me-2"></i>
            Nueva Compra
        </button>
    </div>

    <!-- Card principal -->
     <div class="card-body">

        <asp:GridView ID="dgvCompras" runat="server"
            CssClass="table"
            AutoGenerateColumns="false"
            DataKeyNames="id"
            OnSelectedIndexChanged="dgvCompras_SelectedIndexChanged">
            <Columns>
                <asp:BoundField HeaderText="FECHA" DataField="fecha" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField HeaderText="IDCOMPRA" DataField="id" />
                <asp:BoundField HeaderText="TOTAL COMPRA" DataField="total" />
                <asp:BoundField HeaderText="USUARIO" DataField="usuario.Nombre" />
                <asp:BoundField HeaderText="ROL" DataField="usuario.Rol.nombre" />
                <asp:BoundField HeaderText="CUIL PROVEEDOR" DataField="proveedor.cuil" />
                <asp:BoundField HeaderText="NOMBRE PROVEEDOR" DataField="proveedor.nombre" />
                <asp:CommandField HeaderText="VER MAS" ShowSelectButton="true" SelectText="Detalle" />
            </Columns>
        </asp:GridView>

     </div>

</div>
</asp:Content>
