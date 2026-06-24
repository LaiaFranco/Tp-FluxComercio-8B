    <%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="FlexComercio.Ventas" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container-fluid py-4">
            <div class="d-flex justify-content-between align-items-start mb-4">
                <div>
                    <h1 class="fw-bold mb-0">Ventas</h1>
                    <p class="text-secondary fs-4 mb-0">Punto de venta</p>
                </div>
                <asp:Button ID="btnPuntoVenta" runat="server" Text="Agregar venta" CssClass="btn btn-dark btn-lg px-4 py-3 rounded-4" OnClick="btnPuntoVenta_Click" />
            </div>

            <div class="card border-0 shadow-sm rounded-4">
                <div class="card-body">
                    <% if (ListaVentas != null && ListaVentas.Count > 0) { %>

                      <div class="row g-3">
        <% foreach (var venta in ListaVentas) { %>
            <div class="col-12">
                <div class="card shadow-sm border-0 rounded-4 overflow-hidden">
                    <div class="row g-0 align-items-center">
                        <!-- Columna del ícono/placeholder (visible en todos los dispositivos) -->
                        <div class="col-md-2 col-3 bg-light text-center p-3 d-flex align-items-center justify-content-center">
                            <i class="bi bi-receipt" style="font-size: 2.5rem;"></i>
                        </div>
                        <!-- Columna de datos de la venta -->
                        <div class="col-md-7 col-9">
                            <div class="card-body">
                                <h5 class="card-title fw-bold mb-1">Factura N° <%= venta.NumFactura%></h5>
                                <p class="card-text mb-1">
                                    <strong>Fecha:</strong> <%= venta.Fecha.ToShortDateString() %> &nbsp;|&nbsp;
                                    <strong>Total:</strong> $<%= venta.Total.ToString("N2") %> &nbsp;|&nbsp;
                               
                                </p>
                                <p class="card-text">
                                    <strong>Cliente:</strong> 
                                    <% if (venta.Cliente != null) { %>
                                        <%= venta.Cliente.Nombre %> <%= venta.Cliente.Apellido %>
                                    <% } else { %>
                                        <span class="text-muted">No especificado</span>
                                    <% } %>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <% } %>
    </div>
                    <% } else { %>
                        <div class="text-center py-5">
                            <i class="bi bi-cart3 text-secondary opacity-50" style="font-size: 5rem;"></i>
                            <h3 class="text-secondary fw-normal mt-3">No hay ventas registradas</h3>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>

    </asp:Content>