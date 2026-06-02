<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FlexComercio.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid py-4 px-5">

    <div class="mb-5">
        <h1 class="fw-bold display-5">Bienvenido, Administrador</h1>
        <p class="fs-2 text-secondary">Panel de control del sistema</p>
    </div>

    <div class="row g-4">

        <!-- Ventas -->
        <div class="col-md-6">
            <div class="card dashboard-card">
                <div class="card-body p-5">
                    <div class="icon-box icon-green mb-4">
                         <i class="bi bi-cart3 text-white fs-1"></i>
                    </div>

                    <h2 class="stat-value">$0.00</h2>
                    <p class="stat-label">Ventas del día</p>
                </div>
            </div>
        </div>

        <!-- Productos -->
        <div class="col-md-6">
            <div class="card dashboard-card">
                <div class="card-body p-5">
                    <div class="icon-box icon-blue mb-4">
                        <i class="bi bi-box fs-1 text-white"></i>
                    </div>

                    <h2 class="stat-value">0</h2>
                    <p class="stat-label">Productos registrados</p>
                </div>
            </div>
        </div>

        <!-- Bajo stock -->
        <div class="col-md-6">
            <div class="card dashboard-card">
                <div class="card-body p-5">
                    <div class="icon-box icon-yellow mb-4">
                        <i class="bi bi-exclamation-triangle fs-1 text-white"></i>
                    </div>

                    <h2 class="stat-value">0</h2>
                    <p class="stat-label">Productos bajo stock</p>
                </div>
            </div>
        </div>

        <!-- Ganancia -->
        <div class="col-md-6">
            <div class="card dashboard-card">
                <div class="card-body p-5">
                    <div class="icon-box icon-purple mb-4">
                        <i class="bi bi-graph-up-arrow fs-1 text-white"></i>
                    </div>

                    <h2 class="stat-value">$0.00</h2>
                    <p class="stat-label">Ganancia estimada</p>
                </div>
            </div>
        </div>

    </div>

</div>
    <div class="card shadow-sm border-0 rounded-4 p-4">
    
    <h2 class="fw-bold mb-4">Accesos Rápidos</h2>

    <div class="row g-4">

        <!-- Nueva Venta -->
        <div class="col-md-4">
            <div class="card h-100 border-2 rounded-4">
                <div class="card-body p-4">
                    <i class="bi bi-cart3 fs-1 text-primary"></i>

                    <h3 class="fw-bold mt-3 mb-2">Nueva Venta</h3>
                    <p class="text-secondary mb-0">
                        Registrar una venta
                    </p>
                </div>
            </div>
        </div>

        <!-- Productos -->
        <div class="col-md-4">
            <div class="card h-100 border-2 rounded-4">
                <div class="card-body p-4">
                    <i class="bi bi-box-seam fs-1 text-primary"></i>

                    <h3 class="fw-bold mt-3 mb-2">Productos</h3>
                    <p class="text-secondary mb-0">
                        Gestionar productos
                    </p>
                </div>
            </div>
        </div>

        <!-- Compras -->
        <div class="col-md-4">
            <div class="card h-100 border-2 rounded-4">
                <div class="card-body p-4">
                    <i class="bi bi-graph-up-arrow fs-1 text-primary"></i>

                    <h3 class="fw-bold mt-3 mb-2">Compras</h3>
                    <p class="text-secondary mb-0">
                        Registrar compra
                    </p>
                </div>
            </div>
        </div>

    </div>

</div>

</asp:Content>
