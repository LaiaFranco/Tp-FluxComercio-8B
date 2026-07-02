<%@ Page Title="" Language="C#" MasterPageFile="~/Vendedor.Master" AutoEventWireup="true" CodeBehind="DefaultVendedor.aspx.cs" Inherits="FlexComercio.DefaultCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid py-4">

    <!-- Encabezado -->
    <div class="mb-5">
        <h1 class="fw-bold mb-1">Bienvenido, Vendedor</h1>
        <p class="text-secondary fs-5 mb-0">
            Panel de control del sistema
        </p>
    </div>

    <!-- Cards -->
    <div class="row g-4 mb-5">

        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm rounded-4 h-100">
                <div class="card-body p-4">

                    <div class="icon-box icon-green mb-4">
                        <i class="bi bi-cart3 fs-2"></i>
                    </div>

                    <h1 class="fw-bold">
                        <asp:Label ID="lblVentasHoy" runat="server" Text="$0.00"></asp:Label>
                    </h1>
                    <p class="text-secondary mb-0">Ventas del día</p>

                </div>
            </div>
        </div>

        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm rounded-4 h-100">
                <div class="card-body p-4">

                    <div class="icon-box icon-blue mb-4">
                        <i class="bi bi-box-seam fs-2"></i>
                    </div>

                    <h1 class="fw-bold">
                        <asp:Label ID="lblProductos" runat="server" Text="0"></asp:Label>
                    </h1>
                    <p class="text-secondary mb-0">Productos registrados</p>

                </div>
            </div>
        </div>

        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm rounded-4 h-100">
                <div class="card-body p-4">

                    <div class="icon-box icon-yellow mb-4">
                        <i class="bi bi-exclamation-triangle fs-2"></i>
                    </div>

                    <h1 class="fw-bold">
                        <asp:Label ID="lblStockBajo" runat="server" Text="0"></asp:Label>
                    </h1>
                    <p class="text-secondary mb-0">Productos bajo stock</p>

                </div>
            </div>
        </div>

        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm rounded-4 h-100">
                <div class="card-body p-4">

                    <div class="icon-box icon-purple mb-4">
                        <i class="bi bi-graph-up-arrow fs-2"></i>
                    </div>

                    <h1 class="fw-bold">
                        <asp:Label ID="lblGanancia" runat="server" Text="$0.00"></asp:Label>
                    </h1>
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

                <div class="col-lg-4">
                    <a href="VentaVendedor.aspx" class="text-decoration-none text-dark">
                        <div class="card border rounded-4 quick-access">
                            <div class="card-body p-4">

                                <i class="bi bi-cart3 fs-1 text-primary mb-3"></i>

                                <h4 class="fw-bold">
                                    Nueva Venta
                                </h4>

                                <p class="text-secondary mb-0">
                                    Registrar una venta
                                </p>

                            </div>
                        </div>
                    </a>
                </div>

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
