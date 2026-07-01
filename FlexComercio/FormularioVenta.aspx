<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="FormularioVenta.aspx.cs" Inherits="FlexComercio.FormularioVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" EnableEventValidation="false">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="card shadow-sm border-0">
        <div class="card-header bg-success text-white py-3">
            <i class="bi bi-cart-plus me-2"></i> Nueva Venta
        </div>
        <div class="card-body bg-white">
            <!-- Mensaje de éxito/error -->
            <asp:Label ID="lblMensaje" runat="server" CssClass="alert d-none" Role="alert" />

            <!-- Datos de cabecera -->
            <div class="row g-3 mb-4">
                <div class="col-md-3">
                    <label class="form-label fw-bold text-dark">Fecha</label>
                    <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control bg-light border-secondary" TextMode="Date" />
                </div>
                <div class="col-md-3">
                    <label class="form-label fw-bold text-dark">Cliente *</label>
                    <asp:DropDownList ID="ddlCliente" runat="server" CssClass="form-select border-secondary" required="true">
                        <asp:ListItem Text="-- Seleccionar cliente --" Value="" />
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <label class="form-label fw-bold text-dark">Estado</label>
                    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-select border-secondary" Enabled="false">
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <label class="form-label fw-bold text-dark">Vendedor</label>
                    <asp:TextBox ID="txtVendedor" runat="server" CssClass="form-control bg-light border-secondary" ReadOnly="true" />
                </div>
            </div>

            <!-- Productos -->
            <div class="mt-3">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h5 class="mb-0 text-dark">Productos</h5>
                    <asp:Button ID="btnAgregarProducto" runat="server" Text="Agregar producto" CssClass="btn btn-sm btn-success" OnClientClick="abrirModalProductos(event);" />
                </div>

                <asp:UpdatePanel ID="upDetalles" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pnlDetalles" runat="server" CssClass="panel-detalles">
                            <h4>Productos agregados</h4>
                            <asp:GridView ID="gvDetalles" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" EmptyDataText="No hay productos agregados aún.">
                                <Columns>
                                    <asp:BoundField DataField="Producto.Nombre" HeaderText="Producto" />
                                    <asp:BoundField DataField="PrecioUnitario" HeaderText="Precio Unit." DataFormatString="{0:C2}" HtmlEncode="False" />
                                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                                    <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" DataFormatString="{0:C2}" HtmlEncode="False" />
                                    <asp:TemplateField HeaderText="Acciones">
                                        <ItemTemplate>
                                            <asp:Button ID="btnEliminar" runat="server" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-danger" Text="Quitar" OnClick="btnEliminar_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>

                        <div class="row mt-4">
                            <div class="col-md-6 offset-md-6">
                                <div class="d-flex justify-content-between bg-dark text-white p-3 rounded">
                                    <span class="fw-bold">TOTAL VENTA:</span>
                                    <asp:Label ID="lblTotal" runat="server" CssClass="fw-bold" Text="$0.00" />
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <div class="d-flex justify-content-end mt-4 gap-2">
                    <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn btn-outline-secondary" OnClick="btnLimpiar_Click" />
                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar Venta" CssClass="btn btn-success" OnClick="btnRegistrar_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- Modal para seleccionar producto -->
    <div class="modal fade" id="modalProductos" tabindex="-1" aria-labelledby="modalProductosLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title" id="modalProductosLabel">
                        <i class="bi bi-box-seam me-2"></i>Seleccionar Producto
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="upProductos" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="mb-3">
                                <asp:TextBox ID="txtBuscarProducto" runat="server" CssClass="form-control" placeholder="Buscar producto..." OnTextChanged="txtBuscarProducto_TextChanged" AutoPostBack="true" />
                            </div>
                            <asp:GridView ID="gvProductos" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover" DataKeyNames="Id">
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="ID" Visible="false" />
                                    <asp:BoundField DataField="Nombre" HeaderText="Producto" />
                                    <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:C2}" />
                                    <asp:TemplateField HeaderText="Cantidad">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtCantidad" runat="server" Text="1" Width="60px" CssClass="form-control form-control-sm" TextMode="Number" min="1" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="btnAgregar" runat="server" CommandName="AgregarProducto" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-success" Text="Agregar" OnClick="btnAgregar_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:Label ID="lblErrorStock" runat="server" CssClass="text-danger mt-2" Visible="false" />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="txtBuscarProducto" EventName="TextChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function abrirModalProductos(e) {
            e.preventDefault();
            var modal = new bootstrap.Modal(document.getElementById('modalProductos'));
            modal.show();
        }
    </script>

</asp:Content>