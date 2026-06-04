<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="MarcaYCategoria.aspx.cs" Inherits="FlexComercio.MarcaYCategoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid py-4">

    <!-- Título -->
    <div class="mb-4">
        <h1 class="fw-bold mb-1">Marcas y Categorías</h1>
        <p class="text-secondary fs-4 mb-0">
            Gestión de marcas y categorías de productos
        </p>
    </div>

    <!-- MARCAS -->
    <div class="card border-0 shadow-sm rounded-4 mb-4">

        <div class="card-header bg-white d-flex justify-content-between align-items-center py-4 px-4">
            <div class="d-flex align-items-center">
                <i class="bi bi-tag fs-3 me-3"></i>
                <h2 class="h3 fw-semibold mb-0">Marcas</h2>
            </div>

            <button class="btn btn-dark rounded-4 px-4 py-2">
                <i class="bi bi-plus-lg me-2"></i>
                Nueva
            </button>
        </div>

        <div class="card-body d-flex flex-column justify-content-center align-items-center"
             style="height:220px;">

            <i class="bi bi-tag text-secondary"
               style="font-size:5rem; opacity:.25;"></i>

            <p class="text-secondary fs-3 mt-3 mb-0">
                No hay marcas registradas
            </p>

        </div>

    </div>

    <!-- CATEGORÍAS -->
    <div class="card border-0 shadow-sm rounded-4">

        <div class="card-header bg-white d-flex justify-content-between align-items-center py-4 px-4">
            <div class="d-flex align-items-center">
                <i class="bi bi-folder fs-3 me-3"></i>
                <h2 class="h3 fw-semibold mb-0">Categorías</h2>
            </div>

            <button class="btn btn-dark rounded-4 px-4 py-2">
                <i class="bi bi-plus-lg me-2"></i>
                Nueva
            </button>
        </div>

        <div class="card-body d-flex flex-column justify-content-center align-items-center"
             style="height:220px;">

            <i class="bi bi-folder text-secondary"
               style="font-size:5rem; opacity:.25;"></i>

            <p class="text-secondary fs-3 mt-3 mb-0">
                No hay categorías registradas
            </p>

        </div>

    </div>

</div>

</asp:Content>
