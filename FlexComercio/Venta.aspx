<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Venta.aspx.cs" Inherits="FlexComercio.Venta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid py-4">

    <!-- Encabezado -->
    <div class="d-flex justify-content-between align-items-start mb-4">
        <div>
            <h1 class="fw-bold mb-0">Ventas</h1>
            <p class="text-secondary fs-4 mb-0">Punto de venta</p>
        </div>

        <button class="btn btn-dark btn-lg px-4 py-3 rounded-4">
            <i class="bi bi-plus-lg me-2"></i>
            Nueva Venta
        </button>
    </div>

    <!-- Contenedor principal -->
    <div class="card border-0 shadow-sm rounded-4">
        <div class="card-body d-flex flex-column justify-content-center align-items-center"
             style="height:300px;">

            <i class="bi bi-cart3 text-secondary opacity-50"
               style="font-size:5rem;"></i>

            <h3 class="text-secondary fw-normal mt-3">
                No hay ventas registradas
            </h3>

        </div>
    </div>

</div>  
</asp:Content>
