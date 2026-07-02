<%@ Page Title="Editar estado de venta" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="EditarEstadoVenta.aspx.cs" Inherits="FlexComercio.EditarEstadoVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .estado-pendiente { color: #dc3545; font-weight: bold; }
        .estado-preparacion { color: #ffc107; font-weight: bold; }
        .estado-listaretiro { color: #0d6efd; font-weight: bold; }
        .estado-entregada { color: #198754; font-weight: bold; }
        .card-venta { border: none; border-radius: 1.5rem; overflow: hidden; }
        .card-header-venta { background: #f8f9fa; border-bottom: 1px solid #e9ecef; padding: 1.5rem 2rem; }
        .card-body-venta { padding: 2rem; }
        .estado-label { font-size: 1.1rem; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid py-4">
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8">
                <div class="card card-venta shadow-sm border-0">
                    <div class="card-header-venta d-flex justify-content-between align-items-center">
                        <h4 class="fw-bold mb-0">
                            <i class="bi bi-pencil-square me-2"></i>Editar estado de venta
                        </h4>
                        <asp:Label ID="lblFactura" runat="server" CssClass="text-muted fw-semibold" />
                    </div>
                    <div class="card-body-venta">
                        <!-- Resumen de la venta -->
                        <div class="row g-3 mb-4">
                            <div class="col-md-6">
                                <label class="text-secondary fw-semibold">Cliente</label>
                                <p class="fw-bold fs-5"><asp:Label ID="lblCliente" runat="server" Text="-" /></p>
                            </div>
                            <div class="col-md-6">
                                <label class="text-secondary fw-semibold">Total</label>
                                <p class="fw-bold fs-5 text-success"><asp:Label ID="lblTotal" runat="server" Text="$0.00" /></p>
                            </div>
                            <div class="col-md-6">
                                <label class="text-secondary fw-semibold">Fecha</label>
                                <p class="fw-bold fs-5"><asp:Label ID="lblFecha" runat="server" Text="-" /></p>
                            </div>
                            <div class="col-md-6">
                                <label class="text-secondary fw-semibold">Estado actual</label>
                                <p class="fw-bold fs-5 estado-label">
                                    <asp:Label ID="lblEstadoActual" runat="server" Text="-" CssClass="" />
                                </p>
                            </div>
                        </div>

                        <!-- Selector de nuevo estado -->
                        <div class="mb-4">
                            <label for="ddlNuevoEstado" class="form-label fw-semibold">Nuevo estado</label>
                            <asp:DropDownList ID="ddlNuevoEstado" runat="server" CssClass="form-select form-select-lg">
                            </asp:DropDownList>
                        </div>

                        <!-- Botones -->
                        <div class="d-flex justify-content-end gap-2 pt-3 border-top">
                            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-outline-secondary btn-lg px-4"  CausesValidation="false" OnClick="btnCancelar_Click" />
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar estado" CssClass="btn btn-primary btn-lg px-5" OnClick="btnGuardar_Click" />
                        </div>

                        <!-- Mensaje de error/éxito -->
                        <asp:Label ID="lblMensaje" runat="server" CssClass="alert d-none mt-3" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>