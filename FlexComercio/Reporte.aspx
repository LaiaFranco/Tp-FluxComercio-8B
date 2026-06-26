<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Reporte.aspx.cs" Inherits="FlexComercio.Reporte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid py-4">

    <!-- Título -->
    <div class="mb-4">
        <h1 class="fw-bold mb-1">Reportes</h1>
        <p class="text-secondary fs-5 mb-0">
            Análisis y estadísticas del negocio
        </p>
    </div>

    <!-- Tarjetas estadísticas -->
    <div class="row g-4 mb-4">

        <!-- Ventas -->
        <div class="col-md-6">
            <div class="card shadow-sm border-0 rounded-4 h-100">
                <div class="card-body">

                    <div class="d-flex align-items-center mb-4">
                        <div class="bg-light rounded-4 p-3 me-3">
                            <i class="bi bi-graph-up-arrow fs-3 text-dark"></i>
                        </div>

                        <div>
                            <h4 class="fw-semibold mb-1">Ventas Totales</h4>
                            <p class="text-secondary mb-0">Mes Actual</p>
                        </div>
                    </div>

                    <h1 class="fw-bold">
                        <asp:Label ID="lblVentasTotales" runat="server" Text="0" />
                    </h1>

                    <p class="text-secondary mb-0">
                        <asp:Label ID="lblCantidadVentas" runat="server" Text="0 ventas realizadas" />
                    </p>

                </div>
            </div>
        </div>

        <!-- Productos -->
        <div class="col-md-6">
            <div class="card shadow-sm border-0 rounded-4 h-100">
                <div class="card-body">

                    <div class="d-flex align-items-center mb-4">
                        <div class="bg-light rounded-4 p-3 me-3">
                            <i class="bi bi-box-seam fs-3 text-dark"></i>
                        </div>

                        <div>
                            <h4 class="fw-semibold mb-1">Productos</h4>
                            <p class="text-secondary mb-0">Inventario</p>
                        </div>
                    </div>

                    <h1 class="fw-bold">
                        <asp:Label ID="lblProductos" runat="server" Text="0" />
                    </h1>

                    <p class="text-secondary mb-0">
                        Productos registrados
                    </p>

                </div>
            </div>
        </div>

        <!-- Clientes -->
        <div class="col-md-6">
            <div class="card shadow-sm border-0 rounded-4 h-100">
                <div class="card-body">

                    <div class="d-flex align-items-center mb-4">
                        <div class="bg-light rounded-4 p-3 me-3">
                            <i class="bi bi-people fs-3 text-dark"></i>
                        </div>

                        <div>
                            <h4 class="fw-semibold mb-1">Clientes</h4>
                            <p class="text-secondary mb-0">Base de datos</p>
                        </div>
                    </div>

                    <h1 class="fw-bold">
                        <asp:Label ID="lblClientes" runat="server" Text="0" />
                    </h1>

                    <p class="text-secondary mb-0">
                        Clientes activos
                    </p>

                </div>
            </div>
        </div>

        <!-- Ganancia -->
        <div class="col-md-6">
            <div class="card shadow-sm border-0 rounded-4 h-100">
                <div class="card-body">

                    <div class="d-flex align-items-center mb-4">
                        <div class="bg-light rounded-4 p-3 me-3">
                            <i class="bi bi-bar-chart fs-3 text-dark"></i>
                        </div>

                        <div>
                            <h4 class="fw-semibold mb-1">Ganancia Total</h4>
                            <p class="text-secondary mb-0">Margen estimado</p>
                        </div>
                    </div>

                    <h1 class="fw-bold">
                        <asp:Label ID="lblGananciaTotal" runat="server" Text="$0.00" />
                    </h1>

                    <p class="text-secondary mb-0">
                        <asp:Label ID="lblMargenPromedio" runat="server" Text="0% de margen promedio" />
                    </p>

                </div>
            </div>
        </div>

    </div>

    <!-- Stock bajo -->
    <div class="card shadow-sm border-0 rounded-4 mb-4">
        <div class="card-body">

            <h4 class="fw-semibold mb-4">
                Productos con Stock Bajo
            </h4>

            <div class="d-flex justify-content-center align-items-center" style="height:120px;">
                <asp:Label ID="lblStockBajo" runat="server" CssClass="text-secondary fs-5"
                    Text="No hay productos con stock bajo" />
            </div>

        </div>
    </div>

    <!-- Últimas ventas -->
    <div class="card shadow-sm border-0 rounded-4">
        <div class="card-body">

            <h4 class="fw-semibold mb-4">
                Últimas Ventas
            </h4>

            <div class="d-flex justify-content-center align-items-center" style="height:120px;">
                <asp:Label ID="lblUltimasVentas" runat="server" CssClass="text-secondary fs-5"
                    Text="No hay ventas registradas" />
            </div>

        </div>
    </div>

</div>
    <style>
    /* Animación de todas las cards */
    .card {
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }

    .card:hover {
        transform: translateY(-4px);
        box-shadow: 0 1rem 3rem rgba(0,0,0,.175) !important;
    }

    /* Iconos de resumen */
    .dashboard-icon {
        width: 80px;
        height: 80px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 1rem;
        background: linear-gradient(135deg, #e0e7ff, #f0f4ff);
    }

    .dashboard-icon i {
        font-size: 2.2rem;
        color: #0d6efd;
    }

    /* Números principales */
    .dashboard-value {
        font-size: 2.2rem;
        font-weight: 700;
        margin-bottom: 0;
    }

    /* Cards de accesos rápidos */
    .quick-access {
        cursor: pointer;
        transition: all 0.2s ease;
    }

    .quick-access:hover {
        transform: translateY(-5px);
        border-color: #0d6efd !important;
    }

    .quick-access .dashboard-icon {
        width: 70px;
        height: 70px;
    }

    .quick-access h3 {
        font-size: 1.4rem;
    }
</style>
</asp:Content>
