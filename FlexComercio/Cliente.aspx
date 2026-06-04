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

        <button class="btn btn-dark btn-lg px-4 py-3 rounded-4">
            <i class="bi bi-plus-lg me-2"></i>
            Nuevo Cliente
        </button>

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
        <div class="card-body d-flex flex-column justify-content-center align-items-center"
             style="height: 300px;">

            <i class="bi bi-person-plus text-secondary opacity-25"
               style="font-size: 5rem;"></i>

            <h3 class="text-secondary fw-normal mt-3">
                No hay clientes registrados
            </h3>

        </div>

    </div>

</div>
</asp:Content>
