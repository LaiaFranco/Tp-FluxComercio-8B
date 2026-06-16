<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="FormularioVentas.aspx.cs" Inherits="FlexComercio.FormularioVentas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <div class="card shadow-sm border-0">
            <div class="card-header bg-success text-white py-3">
                <i class="bi bi-cart-plus me-2"></i> Nueva Venta
            </div>
            <div class="card-body bg-white">
                <!-- Datos de cabecera -->
                <div class="row g-3 mb-4">
                    <div class="col-md-4">
                        <label class="form-label fw-bold text-dark">Cliente *</label>
                        <asp:DropDownList ID="ddlCliente" runat="server" CssClass="form-select border-secondary" required="true">
                            <asp:ListItem Text="-- Seleccionar cliente --" Value="" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label fw-bold text-dark">Fecha</label>
                        <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control bg-white border-secondary" TextMode="Date" />
                    </div>
                    <div class="col-md-3">
                        <label class="form-label fw-bold text-dark">Vendedor</label>
                        <asp:TextBox ID="txtVendedor" runat="server" CssClass="form-control bg-white border-secondary disable" ReadOnly="true"  />
                    </div>
                    <div class="col-md-2">
                        <label class="form-label fw-bold text-dark">N° Factura</label>
                        <asp:TextBox ID="txtNumFactura" runat="server" CssClass="form-control bg-light border-secondary" 
                                     placeholder="Se genera al guardar" ReadOnly="true" />
                    </div>
                </div>

                <!-- Productos: usaremos un Repeater o GridView dinámico, pero por simplicidad mostramos un ejemplo con panel estático -->
                <div class="mt-3">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h5 class="mb-0 text-dark">Productos</h5>
                        <asp:Button ID="btnAgregarProducto" runat="server" Text="Agregar producto" CssClass="btn btn-sm btn-success" />
                    </div>

                    <!-- Aquí se mostrarán dinámicamente los productos agregados -->
                    <asp:Panel ID="pnlProductos" runat="server"></asp:Panel>

                    <!-- Totales -->
                    <div class="row mt-4">
                        <div class="col-md-6 offset-md-6">
                            <div class="d-flex justify-content-between bg-dark text-white p-3 rounded">
                                <span class="fw-bold">TOTAL VENTA:</span>
                                <asp:Label ID="lblTotal" runat="server" CssClass="fw-bold" Text="$0.00" />
                            </div>
                        </div>
                    </div>

                    <!-- Botones -->
                    <div class="d-flex justify-content-end mt-4 gap-2">
                        <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn btn-outline-secondary" />
                        <asp:Button ID="btnRegistrar" runat="server" Text="Registrar Venta" CssClass="btn btn-success" />
                    </div>
                </div>
            </div>
        </div>


</asp:Content>
