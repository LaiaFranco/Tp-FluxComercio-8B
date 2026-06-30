<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="AgregarCompra.aspx.cs" Inherits="FlexComercio.AgregarCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card shadow-sm border-0">

    <div class="card-header bg-success text-white py-3">
        <i class="bi bi-cart-plus me-2"></i> Nueva Compra
    </div>

    <div class="card-body bg-white">

        <!-- Datos de cabecera -->
        <div class="row g-3 mb-4">

            <div class="col-md-4">
                <label class="form-label fw-bold text-dark">Proveedor *</label>

                <asp:DropDownList
                    ID="ddlProveedor"
                    runat="server"
                    CssClass="form-select border-secondary">

                    <asp:ListItem Text="-- Seleccionar proveedor --" Value="" />

                </asp:DropDownList>
            </div>

            <div class="col-md-3">
                <label class="form-label fw-bold text-dark">Fecha</label>

                <asp:TextBox
                    ID="txtFecha"
                    runat="server"
                    CssClass="form-control border-secondary"
                    TextMode="Date" />
            </div>

            <div class="col-md-3">
                <label class="form-label fw-bold text-dark">Comprador</label>

                <asp:TextBox
                    ID="txtComprador"
                    runat="server"
                    CssClass="form-control border-secondary"
                    ReadOnly="true" />
            </div>

            <div class="col-md-2">
                <label class="form-label fw-bold text-dark">N° Compra</label>

                <asp:TextBox
                    ID="txtNumeroCompra"
                    runat="server"
                    CssClass="form-control bg-light border-secondary"
                    ReadOnly="true"
                    placeholder="Se genera al guardar" />
            </div>

        </div>

        <!-- Productos -->
        <div class="mt-3">

            <div class="d-flex justify-content-between align-items-center mb-3">

                <h5 class="mb-0 text-dark">Productos</h5>

                <asp:Button
                    ID="btnAgregarProducto"
                    runat="server"
                    Text="Agregar producto"
                    CssClass="btn btn-sm btn-success"
                    OnClientClick="abrirModalProductos(event);" />

            </div>

            <!-- Productos agregados -->
            <asp:Panel ID="pnlDetalles" runat="server">

                <h4>Productos agregados</h4>

                <asp:GridView
                    ID="gvDetalles"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="table table-striped table-bordered"
                    EmptyDataText="No hay productos agregados.">

                    <Columns>

                        <asp:BoundField DataField="Producto.Nombre" HeaderText="Producto" />

                        <asp:BoundField
                            DataField="PrecioUnitario"
                            HeaderText="Costo Unit."
                            DataFormatString="{0:C2}"
                            HtmlEncode="False" />

                        <asp:BoundField
                            DataField="Cantidad"
                            HeaderText="Cantidad" />

                        <asp:BoundField
                            DataField="Subtotal"
                            HeaderText="Subtotal"
                            DataFormatString="{0:C2}"
                            HtmlEncode="False" />

                        <asp:TemplateField HeaderText="Acciones">

                            <ItemTemplate>

                                <asp:Button
                                    ID="btnEliminar"
                                    runat="server"
                                    Text="Quitar"
                                    CssClass="btn btn-sm btn-danger"
                                    CommandArgument='<%# Eval("Id") %>'
                                    OnClick="btnEliminar_Click" />

                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </asp:Panel>

            <!-- Total -->
            <div class="row mt-4">

                <div class="col-md-6 offset-md-6">

                    <div class="d-flex justify-content-between bg-dark text-white p-3 rounded">

                        <span class="fw-bold">TOTAL COMPRA:</span>

                        <asp:Label
                            ID="lblTotal"
                            runat="server"
                            CssClass="fw-bold"
                            Text="$0,00" />

                    </div>

                </div>

            </div>

            <!-- Botones -->
            <div class="d-flex justify-content-end mt-4 gap-2">

                <asp:Button
                    ID="btnLimpiar"
                    runat="server"
                    Text="Limpiar"
                    CssClass="btn btn-outline-secondary" />

                <asp:Button
                    ID="btnRegistrarCompra"
                    runat="server"
                    Text="Registrar Compra"
                    CssClass="btn btn-success"
                    OnClick="btnRegistrarCompra_Click"
                    />

            </div>

        </div>

    </div>

</div>

<!-- Modal Productos -->
<div class="modal fade"
     id="modalProductos"
     tabindex="-1"
     aria-hidden="true">

    <div class="modal-dialog modal-lg">

        <div class="modal-content">

            <div class="modal-header bg-success text-white">

                <h5 class="modal-title">
                    <i class="bi bi-box-seam me-2"></i>
                    Seleccionar Producto
                </h5>

                <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"></button>

            </div>

            <div class="modal-body">

                <asp:TextBox
                    ID="txtBuscarProducto"
                    runat="server"
                    CssClass="form-control mb-3"
                    placeholder="Buscar producto..." />

                <asp:GridView
                    ID="gvProductos"
                    runat="server"
                    AutoGenerateColumns="False"
                    DataKeyNames="Id"
                    CssClass="table table-bordered table-hover">

                    <Columns>

                        <asp:BoundField
                            DataField="Nombre"
                            HeaderText="Producto" />

                        <asp:BoundField
                            DataField="Precio"
                            HeaderText="Costo"
                            DataFormatString="{0:C2}" />

                        <asp:TemplateField HeaderText="Cantidad">

                            <ItemTemplate>

                                <asp:TextBox
                                    ID="txtCantidad"
                                    runat="server"
                                    Text="1"
                                    TextMode="Number"
                                    CssClass="form-control form-control-sm"
                                    Width="70px" />

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>

                            <ItemTemplate>

                                <asp:Button
                                    ID="btnAgregar"
                                    runat="server"
                                    Text="Agregar"
                                    CssClass="btn btn-success btn-sm"
                                    CommandArgument='<%# Eval("Id") %>'
                                    OnClick="btnAgregar_Click" />

                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </div>

        </div>

    </div>

</div>

<script>
    function abrirModalProductos(e) {
        e.preventDefault();
        var modal = new bootstrap.Modal(document.getElementById('modalProductos'));
        modal.show();
    }
</script>

</asp:Content>
