<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="CompraDetalle.aspx.cs" Inherits="FlexComercio.CompraDetalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid py-4">

    <!-- Encabezado -->
    <div class="d-flex justify-content-between align-items-start mb-4">
        <div>
            <h1 class="fw-bold text-dark mb-0">Detalle de Compra</h1>
            <p class="text-secondary fs-4 mb-0">
                Compra Nro.
                <asp:Label ID="lblIdCompra" runat="server" />
            </p>
        </div>

        <asp:Button ID="btnVolver" runat="server"
            Text="Volver"
            CssClass="btn btn-dark btn-lg px-4 py-3 rounded-4"
            OnClick="btnVolver_Click" />
    </div>

    <!-- Datos generales -->
    <div class="row g-3 mb-4">

        <div class="col-md-3">
            <div class="card rounded-4 border-0 shadow-sm p-3 h-100">
                <small class="text-secondary">Fecha</small>
                <asp:Label ID="lblFecha" runat="server" CssClass="fw-bold fs-5" />
            </div>
        </div>

        <div class="col-md-3">
            <div class="card rounded-4 border-0 shadow-sm p-3 h-100">
                <small class="text-secondary">Proveedor</small>
                <asp:Label ID="lblProveedor" runat="server" CssClass="fw-bold fs-5" />
            </div>
        </div>

        <div class="col-md-3">
            <div class="card rounded-4 border-0 shadow-sm p-3 h-100">
                <small class="text-secondary">Usuario</small>
                <asp:Label ID="lblUsuario" runat="server" CssClass="fw-bold fs-5" />
            </div>
        </div>

        <div class="col-md-3">
            <div class="card rounded-4 border-0 shadow-sm p-3 h-100">
                <small class="text-secondary">Total</small>
                <asp:Label ID="lblTotal" runat="server" CssClass="fw-bold fs-5 text-success" />
            </div>
        </div>

    </div>

    <!-- Lista de productos -->
    <div class="card shadow-sm border-0 rounded-4">

        <div class="card-header bg-white border-bottom p-4">
            <h4 class="fw-bold mb-0">
                Productos de la compra
            </h4>
        </div>

        <div class="container-fluid mt-4">

            <asp:GridView ID="dgvDetalleCompra"
                runat="server"
                AutoGenerateColumns="false"
                CssClass="table border-0">

                <Columns>

                    <asp:TemplateField>

                        <ItemTemplate>

                            <div class="card rounded-4 mb-4 p-3 detalle-card">

                                <div class="row align-items-center">

                                    <!-- ICONO -->
                                    <div class="col-md-2 col-lg-1 text-center">

                                        <div class="rounded-4 p-4 d-inline-block"
                                            style="background: linear-gradient(135deg,#e0e7ff,#f0f4ff);">

                                            <i class="bi bi-box-seam fs-1 text-primary"></i>

                                        </div>

                                    </div>

                                    <!-- DATOS -->
                                    <div class="col-md-7 col-lg-8">

                                        <h3 class="fw-bold mb-2">
                                            <%# Eval("producto.nombre") %>
                                        </h3>

                                        <div class="row g-2">

                                            <div class="col-md-3">
                                                <span class="badge bg-light text-dark p-2 w-100 text-start">
                                                    <i class="bi bi-hash me-1"></i>
                                                    <strong>ID:</strong>
                                                    <%# Eval("producto.id") %>
                                                </span>
                                            </div>

                                            <div class="col-md-3">
                                                <span class="badge bg-light text-dark p-2 w-100 text-start">
                                                    <i class="bi bi-boxes me-1"></i>
                                                    <strong>Cantidad:</strong>
                                                    <%# Eval("cantidad") %>
                                                </span>
                                            </div>

                                            <div class="col-md-3">
                                                <span class="badge bg-light text-dark p-2 w-100 text-start">
                                                    <i class="bi bi-currency-dollar me-1"></i>
                                                    <strong>Precio:</strong>
                                                    $ <%# Eval("precioUnitario") %>
                                                </span>
                                            </div>

                                            <div class="col-md-3">
                                                <span class="badge bg-success text-white p-2 w-100 text-start">
                                                    <i class="bi bi-calculator me-1"></i>
                                                    <strong>Subtotal:</strong>
                                                    $ <%# Eval("subtotal") %>
                                                </span>
                                            </div>

                                        </div>

                                    </div>

                                </div>

                            </div>

                        </ItemTemplate>

                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

    </div>

</div>
<style>
    /* Sombra más suave al hacer hover */
    .card {
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }
    .card:hover {
        transform: translateY(-2px);
        box-shadow: 0 1rem 3rem rgba(0,0,0,.175) !important;
    }
    /* Badges con mejor legibilidad */
    .badge.bg-light {
        font-weight: 400;
        font-size: 0.95rem;
        border: 1px solid #dee2e6;
        border-radius: 0.5rem !important;
    }
    /* Iconos dentro de badges */
    .badge i {
        font-size: 1.1rem;
    }
    /* Botones más atractivos */
    .btn-outline-danger, .btn-outline-warning {
        border-width: 2px;
        font-weight: 600;
    }
    .btn-outline-danger:hover, .btn-outline-warning:hover {
        transform: scale(1.02);
        transition: all 0.15s ease;
    }
</style>

<style>

    .detalle-card{
        transition: transform .2s ease, box-shadow .2s ease;
    }

    .detalle-card:hover{
        transform: translateY(-2px);
        box-shadow: 0 1rem 3rem rgba(0,0,0,.175) !important;
    }

    .badge.bg-light{
        font-size: .95rem;
        border: 1px solid #dee2e6;
        border-radius: .5rem !important;
    }

    .badge i{
        font-size: 1.1rem;
    }

</style>

</asp:Content>