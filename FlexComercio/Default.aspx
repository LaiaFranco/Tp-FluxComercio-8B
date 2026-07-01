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

                    <h1 class="fw-bold">
                    <asp:Label ID="lblVentasDelDia" runat="server" Text="$0.00"></asp:Label>
                    </h1>
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

                    <h1 class="fw-bold">
                    <asp:Label
                        ID="lblProductosRegistrados"
                        runat="server"
                        Text="0">
                    </asp:Label>
                    </h1>

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

                    <h1 class="fw-bold">
                    <asp:Label
                        ID="lblProductosBajoStock"
                        runat="server"
                        Text="0">
                    </asp:Label>
                    </h1>

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

                    <h1 class="fw-bold">
                    <asp:Label
                        ID="lblGananciaEstimada"
                        runat="server"
                        Text="$0.00">
                    </asp:Label>
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

              
                            <!-- Nueva Venta -->
            <div class="col-lg-4">
                <a href="FormularioVenta.aspx" class="text-decoration-none text-dark">
                    <div class="card h-100 border rounded-4 quick-access">
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
                </a>
            </div>

            <!-- Productos -->
            <div class="col-lg-4">
                <a href="Producto.aspx" class="text-decoration-none text-dark">
                    <div class="card h-100 border rounded-4 quick-access">
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
                </a>
            </div>

            <!-- Compras -->
            <div class="col-lg-4">
                <a href="AgregarCompra.aspx" class="text-decoration-none text-dark">
                    <div class="card h-100 border rounded-4 quick-access">
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
