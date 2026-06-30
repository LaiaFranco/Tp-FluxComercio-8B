<%@ Page Title="Ventas" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true"
    CodeBehind="Ventas.aspx.cs" Inherits="FlexComercio.Ventas" %>

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
                <asp:GridView ID="gvVentas" runat="server"
                    AutoGenerateColumns="False"
                    OnRowCommand="gvVentas_RowCommand"
                    CssClass="table table-borderless"
                    GridLines="None"
                    ShowHeader="False"
                    DataKeyNames="Id">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class="col-12">
                                    <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-3">
                                        <div class="row g-0 align-items-center">
                                            <!-- Icono -->
                                            <div class="col-md-2 col-3 bg-light text-center p-3 d-flex align-items-center justify-content-center">
                                                <i class="bi bi-receipt" style="font-size: 2.5rem;"></i>
                                            </div>
                                            <!-- Datos de la venta -->
                                            <div class="col-md-6 col-9">
                                                <div class="card-body">
                                                    <h5 class="card-title fw-bold mb-1">Factura N° <%# Eval("NumFactura") %></h5>
                                                    <p class="card-text mb-1">
                                                        <strong>Fecha:</strong> <%# Eval("Fecha", "{0:d}") %> &nbsp;|&nbsp;
                                                        <strong>Total:</strong> $<%# Eval("Total", "{0:N2}") %>
                                                    </p>
                                                    <p class="card-text">
                                                        <strong>Cliente:</strong> 
                                                        <%# Eval("Cliente.Nombre") %> <%# Eval("Cliente.Apellido") %>
                                                    </p>
                                                </div>
                                            </div>
                                            <!-- Botón Ver detalle -->
                                            <div class="col-md-4 col-12 d-flex align-items-center justify-content-end p-3">
                                                <asp:Button ID="btnVerDetalle" runat="server"
                                                    CssClass="btn btn-outline-primary btn-sm rounded-pill px-4"
                                                    Text=" Ver detalle"
                                                    CommandName="VerDetalle"
                                                    CommandArgument='<%# Eval("Id") %>' />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <!-- Mensaje cuando no hay ventas -->
                <asp:PlaceHolder ID="phSinVentas" runat="server" Visible="false">
                    <div class="text-center py-5">
                        <i class="bi bi-cart3 text-secondary opacity-50" style="font-size: 5rem;"></i>
                        <h3 class="text-secondary fw-normal mt-3">No hay ventas registradas</h3>
                    </div>
                </asp:PlaceHolder>
            </div>
        </div>
    </div>
</asp:Content>