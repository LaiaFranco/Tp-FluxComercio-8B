<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FlexComercio.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<div class="container-fluid py-4">

    <!-- Encabezado -->
    <div class="mb-5">
        <h1 class="fw-bold mb-1">Bienvenido, Administrador</h1>
        <p class="text-secondary fs-4 mb-0">
            Panel de control del sistema
        </p>
    </div>

    <!-- Cards resumen -->
    <div class="row g-4 mb-5">

        <!-- Ventas -->
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm rounded-4 h-100">
                <div class="card-body p-4">

                    <div class="bg-light rounded-4 d-inline-flex p-3 mb-4">
                        <i class="bi bi-cart3 fs-2 text-dark"></i>
                    </div>

                    <h1 class="fw-bold">$0.00</h1>
                    <p class="text-secondary mb-0">Ventas del día</p>

                </div>
            </div>
        </div>

        <!-- Productos -->
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm rounded-4 h-100">
                <div class="card-body p-4">

                    <div class="bg-light rounded-4 d-inline-flex p-3 mb-4">
                        <i class="bi bi-box-seam fs-2 text-dark"></i>
                    </div>

                    <h1 class="fw-bold">0</h1>
                    <p class="text-secondary mb-0">Productos registrados</p>

                </div>
            </div>
        </div>

        <!-- Stock Bajo -->
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm rounded-4 h-100">
                <div class="card-body p-4">

                    <div class="bg-light rounded-4 d-inline-flex p-3 mb-4">
                        <i class="bi bi-exclamation-triangle fs-2 text-dark"></i>
                    </div>

                    <h1 class="fw-bold">0</h1>
                    <p class="text-secondary mb-0">Productos bajo stock</p>

                </div>
            </div>
        </div>

        <!-- Ganancia -->
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm rounded-4 h-100">
                <div class="card-body p-4">

                    <div class="bg-light rounded-4 d-inline-flex p-3 mb-4">
                        <i class="bi bi-graph-up-arrow fs-2 text-dark"></i>
                    </div>

                    <h1 class="fw-bold">$0.00</h1>
                    <p class="text-secondary mb-0">Ganancia estimada</p>

                </div>
            </div>
        </div>

    </div>

    <!-- Accesos rápidos -->
    <div class="card border-0 shadow-sm rounded-4">
        <div class="card-body p-4">

            <h2 class="fw-bold mb-4">Accesos Rápidos</h2>

            <div class="row g-4">

                <!-- Nueva Venta -->
                <div class="col-lg-4">
                    <div class="card h-100 border rounded-4">
                        <div class="card-body p-4">

                            <div class="bg-light rounded-4 d-inline-flex p-3 mb-3">
                                <i class="bi bi-cart3 fs-2 text-dark"></i>
                            </div>

                            <h3 class="h2 fw-semibold">
                                Nueva Venta
                            </h3>

                            <p class="text-secondary mb-0">
                                Registrar una venta
                            </p>

                        </div>
                    </div>
                </div>

                <!-- Productos -->
                <div class="col-lg-4">
                    <div class="card h-100 border rounded-4">
                        <div class="card-body p-4">

                            <div class="bg-light rounded-4 d-inline-flex p-3 mb-3">
                                <i class="bi bi-box-seam fs-2 text-dark"></i>
                            </div>

                            <h3 class="h2 fw-semibold">
                                Productos
                            </h3>

                            <p class="text-secondary mb-0">
                                Gestionar productos
                            </p>

                        </div>
                    </div>
                </div>

                <!-- Compras -->
                <div class="col-lg-4">
                    <div class="card h-100 border rounded-4">
                        <div class="card-body p-4">

                            <div class="bg-light rounded-4 d-inline-flex p-3 mb-3">
                                <i class="bi bi-graph-up-arrow fs-2 text-dark"></i>
                            </div>

                            <h3 class="h2 fw-semibold">
                                Compras
                            </h3>

                            <p class="text-secondary mb-0">
                                Registrar compra
                            </p>

                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>

</div>

</asp:Content>
