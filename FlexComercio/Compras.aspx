<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Compras.aspx.cs" Inherits="FlexComercio.Compras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container-fluid py-4">

    <!-- ENCABEZADO -->
    <div class="d-flex justify-content-between align-items-start mb-4">

        <div>
            <h1 class="fw-bold text-dark mb-0">Compras</h1>
            <p class="text-secondary fs-4 mb-0">
                Registro de compras a proveedores
            </p>
        </div>

        <asp:Button
        ID="btnNuevaCompra"
        runat="server"
        Text="Nueva Compra"
        CssClass="btn btn-dark btn-lg px-4 py-3 rounded-4"
        OnClick="btnNuevaCompra_Click" />

        </div>

    <!-- CARD PRINCIPAL -->
    <div class="card shadow-sm border-0 rounded-4">

        <!-- GRID -->
        <div class="container-fluid mt-4">

            <asp:GridView ID="dgvCompras"
                runat="server"
                CssClass="table"
                AutoGenerateColumns="false"
                DataKeyNames="id"
                OnSelectedIndexChanged="dgvCompras_SelectedIndexChanged">

                <Columns>

                    <asp:TemplateField>

                        <ItemTemplate>

                            <!-- CARD COMPRA (ESTILO CLIENTES) -->
                            <div class="card compra-card rounded-4 mb-4 p-3">

                                <div class="row g-0 align-items-center">

                                    <!-- ICONO -->
                                    <div class="col-md-2 col-lg-1 text-center">

                                        <div class="rounded-4 p-4 d-inline-block"
                                             style="background: linear-gradient(135deg, #e0f7fa, #e3f2fd);">

                                            <i class="bi bi-bag-check fs-1 text-primary"></i>

                                        </div>

                                    </div>

                                    <!-- DATOS -->
                                    <div class="col-md-7 col-lg-8">

                                        <h3 class="fw-bold mb-1 text-dark">
                                            Compra #<%# Eval("id") %>
                                        </h3>

                                        <div class="row g-2 mt-2">

                                            <div class="col-sm-6">
                                                <span class="badge bg-light text-dark p-2 w-100 text-start">
                                                    <i class="bi bi-calendar me-1"></i>
                                                    <strong>Fecha:</strong>
                                                    <%# Eval("fecha", "{0:dd/MM/yyyy}") %>
                                                </span>
                                            </div>

                                            <div class="col-sm-6">
                                                <span class="badge bg-light text-dark p-2 w-100 text-start">
                                                    <i class="bi bi-cash me-1"></i>
                                                    <strong>Total:</strong>
                                                    $<%# Eval("total") %>
                                                </span>
                                            </div>

                                            <div class="col-sm-6">
                                                <span class="badge bg-light text-dark p-2 w-100 text-start">
                                                    <i class="bi bi-person me-1"></i>
                                                    <strong>Usuario:</strong>
                                                    <%# Eval("usuario.Nombre") %>
                                                </span>
                                            </div>

                                            <div class="col-sm-6">
                                                <span class="badge bg-light text-dark p-2 w-100 text-start">
                                                    <i class="bi bi-shield me-1"></i>
                                                    <strong>Rol:</strong>
                                                    <%# Eval("usuario.Rol.nombre") %>
                                                </span>
                                            </div>

                                            <div class="col-sm-6">
                                                <span class="badge bg-light text-dark p-2 w-100 text-start">
                                                    <i class="bi bi-credit-card me-1"></i>
                                                    <strong>CUIL:</strong>
                                                    <%# Eval("proveedor.cuil") %>
                                                </span>
                                            </div>

                                            <div class="col-sm-6">
                                                <span class="badge bg-light text-dark p-2 w-100 text-start">
                                                    <i class="bi bi-truck me-1"></i>
                                                    <strong>Proveedor:</strong>
                                                    <%# Eval("proveedor.nombre") %>
                                                </span>
                                            </div>

                                        </div>

                                    </div>

                                    <!-- BOTÓN DETALLE -->
                                    <div class="col-md-3 col-lg-3 text-end">

                                        <asp:Button
                                            ID="btnDetalle"
                                            runat="server"
                                            Text="Detalle"
                                            CssClass="btn btn-outline-primary rounded-pill px-4 py-2"
                                            CommandName="Select" />

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

</asp:Content>
