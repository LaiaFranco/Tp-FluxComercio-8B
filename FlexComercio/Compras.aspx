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
    <div class="card border-0 shadow-sm rounded-4">

        <div class="card-body d-flex flex-column justify-content-center align-items-center"
             style="height: 300px;">

            <i class="bi bi-bag text-secondary"
               style="font-size: 5rem; opacity: .25;"></i>

            <p class="text-secondary fs-3 mt-3 mb-0">
                No hay compras registradas
            </p>

        </div>

    </div>

</div>
</asp:Content>
