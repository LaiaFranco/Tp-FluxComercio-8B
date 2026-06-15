<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="CompraDetalle.aspx.cs" Inherits="FlexComercio.CompraDetalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid py-4">

    <div class="d-flex justify-content-between align-items-start mb-4">
        <div>
            <h1 class="fw-bold mb-1">Detalle de Compra</h1>
            <p class="text-secondary fs-4 mb-0">
                Compra Nro.
                <asp:Label ID="lblIdCompra" runat="server" />
            </p>
        </div>

        <asp:Button ID="btnVolver" runat="server"
            Text="Volver"
            CssClass="btn btn-outline-dark btn-lg rounded-4 px-4 py-3"
            OnClick="btnVolver_Click" />
    </div>

    <div class="row g-3 mb-4">
        <div class="col-md-3">
            <div class="border rounded-4 p-3 h-100">
                <p class="text-secondary mb-1">Fecha</p>
                <asp:Label ID="lblFecha" runat="server" CssClass="fw-bold fs-5" />
            </div>
        </div>

        <div class="col-md-3">
            <div class="border rounded-4 p-3 h-100">
                <p class="text-secondary mb-1">Proveedor</p>
                <asp:Label ID="lblProveedor" runat="server" CssClass="fw-bold fs-5" />
            </div>
        </div>

        <div class="col-md-3">
            <div class="border rounded-4 p-3 h-100">
                <p class="text-secondary mb-1">Usuario</p>
                <asp:Label ID="lblUsuario" runat="server" CssClass="fw-bold fs-5" />
            </div>
        </div>

        <div class="col-md-3">
            <div class="border rounded-4 p-3 h-100">
                <p class="text-secondary mb-1">Total</p>
                <asp:Label ID="lblTotal" runat="server" CssClass="fw-bold fs-5" />
            </div>
        </div>
    </div>

    <asp:GridView ID="dgvDetalleCompra" runat="server"
        CssClass="table"
        AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField HeaderText="ID PRODUCTO" DataField="producto.id" />
            <asp:BoundField HeaderText="PRODUCTO" DataField="producto.nombre" />
            <asp:BoundField HeaderText="CANTIDAD" DataField="cantidad" />
            <asp:BoundField HeaderText="PRECIO UNITARIO" DataField="precioUnitario" />
            <asp:BoundField HeaderText="SUBTOTAL" DataField="subtotal" />
        </Columns>
    </asp:GridView>

</div>

</asp:Content>