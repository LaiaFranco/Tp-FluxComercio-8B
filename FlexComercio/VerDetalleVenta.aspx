<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="VerDetalleVenta.aspx.cs" Inherits="FlexComercio.DetalleVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-10 col-lg-9">
                <div class="card p-4 border-0 shadow-sm">
                    <h3 class="text-success mb-4">
                        <i class="bi bi-receipt me-2"></i>Detalle de la Venta
                    </h3>

                    <!-- Datos de la venta -->
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <dl class="row mb-0">
                                <dt class="col-sm-4 fw-bold">Cliente</dt>
                                <dd class="col-sm-8">
                                    <asp:Label ID="lblCliente" runat="server" CssClass="form-control-plaintext" />
                                </dd>

                                <dt class="col-sm-4 fw-bold">Fecha</dt>
                                <dd class="col-sm-8">
                                    <asp:Label ID="lblFecha" runat="server" CssClass="form-control-plaintext" />
                                </dd>
                            </dl>
                        </div>
                        <div class="col-md-6">
                            <dl class="row mb-0">
                                <dt class="col-sm-4 fw-bold">Vendedor</dt>
                                <dd class="col-sm-8">
                                    <asp:Label ID="lblVendedor" runat="server" CssClass="form-control-plaintext" />
                                </dd>

                                <dt class="col-sm-4 fw-bold">Total</dt>
                                <dd class="col-sm-8">
                                    <asp:Label ID="lblTotalDetalle" runat="server" CssClass="form-control-plaintext fw-bold text-success" />
                                </dd>
                            </dl>
                        </div>
                    </div>

                    <!-- Tabla de productos del detalle -->
                    <h5 class="mb-3"><i class="bi bi-box-seam me-2"></i>Productos</h5>
                    <asp:GridView ID="gvDetalleProductos" runat="server"
                                  AutoGenerateColumns="False"
                                  CssClass="table table-striped table-bordered"
                                  EmptyDataText="No se encontraron productos en esta venta.">
                        <Columns>
                            <asp:BoundField DataField="Producto.Nombre" HeaderText="Producto" />
                            <asp:BoundField DataField="PrecioUnitario" HeaderText="Precio Unit." DataFormatString="{0:C2}" HtmlEncode="False" />
                            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                            <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" DataFormatString="{0:C2}" HtmlEncode="False" />
                        </Columns>
                    </asp:GridView>

                    <!-- Botón Volver -->
                    <div class="mt-4">
                        <asp:Button ID="btnVolver" runat="server" Text="Volver" 
                                    CssClass="btn btn-secondary rounded-pill px-4"
                                    OnClick="btnVolver_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
