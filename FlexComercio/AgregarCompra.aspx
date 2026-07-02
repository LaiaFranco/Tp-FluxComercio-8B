<%@ Page Title="Nueva compra"
    Language="C#"
    MasterPageFile="~/General.Master"
    AutoEventWireup="true"
    CodeBehind="AgregarCompra.aspx.cs"
    Inherits="FlexComercio.AgregarCompra" %>

<asp:Content
    ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">
</asp:Content>

<asp:Content
    ID="Content2"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="card shadow-sm border-0">

        <div class="card-header bg-success text-white py-3">

            <i class="bi bi-cart-plus me-2"></i>
            Nueva Compra

        </div>

        <div class="card-body bg-white">

            <!-- Datos generales de la compra -->
            <div class="row g-3 mb-4">

                <div class="col-md-4">

                    <label class="form-label fw-bold text-dark">
                        Proveedor *
                    </label>

                    <asp:DropDownList
                        ID="ddlProveedor"
                        runat="server"
                        CssClass="form-select border-secondary"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddlProveedor_SelectedIndexChanged">
                    </asp:DropDownList>

                </div>

                <div class="col-md-3">

                    <label class="form-label fw-bold text-dark">
                        Fecha
                    </label>

                    <asp:TextBox
                        ID="txtFecha"
                        runat="server"
                        CssClass="form-control border-secondary"
                        TextMode="Date">
                    </asp:TextBox>

                </div>

                <div class="col-md-3">

                    <label class="form-label fw-bold text-dark">
                        Comprador
                    </label>

                    <asp:TextBox
                        ID="txtComprador"
                        runat="server"
                        CssClass="form-control bg-light border-secondary"
                        ReadOnly="true">
                    </asp:TextBox>

                </div>

                <div class="col-md-2">

                    <label class="form-label fw-bold text-dark">
                        N° Compra
                    </label>

                    <asp:TextBox
                        ID="txtNumeroCompra"
                        runat="server"
                        CssClass="form-control bg-light border-secondary"
                        ReadOnly="true"
                        placeholder="Se genera al guardar">
                    </asp:TextBox>

                </div>

            </div>

            <!-- Productos -->
            <div class="mt-3">

                <div class="d-flex justify-content-between align-items-center mb-3">

                    <h5 class="mb-0 text-dark">
                        Productos
                    </h5>

                    <asp:Button
                        ID="btnAgregarProducto"
                        runat="server"
                        Text="Agregar producto"
                        CssClass="btn btn-sm btn-success"
                        OnClientClick="abrirModalProductos(); return false;" />

                </div>

                <!-- Detalle temporal -->
                <asp:Panel
                    ID="pnlDetalles"
                    runat="server">

                    <h4>Productos agregados</h4>

                    <asp:GridView
                        ID="gvDetalles"
                        runat="server"
                        AutoGenerateColumns="false"
                        CssClass="table table-striped table-bordered"
                        EmptyDataText="No hay productos agregados.">

                        <Columns>

                            <asp:BoundField
                                DataField="Producto.Nombre"
                                HeaderText="Producto" />

                            <asp:BoundField
                                DataField="PrecioUnitario"
                                HeaderText="Costo unitario"
                                DataFormatString="{0:C2}"
                                HtmlEncode="false" />

                            <asp:TemplateField
                                HeaderText="Cantidad">

                                <ItemTemplate>

                                    <div class="d-flex align-items-center gap-2">

                                        <asp:Button
                                            ID="btnDisminuir"
                                            runat="server"
                                            Text="-"
                                            CssClass="btn btn-sm btn-outline-secondary"
                                            CommandArgument='<%# Eval("Producto.Id") %>'
                                            OnClick="btnDisminuir_Click" />

                                        <span class="fw-bold">

                                            <%# Eval("Cantidad") %>

                                        </span>

                                        <asp:Button
                                            ID="btnAumentar"
                                            runat="server"
                                            Text="+"
                                            CssClass="btn btn-sm btn-outline-secondary"
                                            CommandArgument='<%# Eval("Producto.Id") %>'
                                            OnClick="btnAumentar_Click" />

                                    </div>

                                </ItemTemplate>

                            </asp:TemplateField>

                            <asp:BoundField
                                DataField="Subtotal"
                                HeaderText="Subtotal"
                                DataFormatString="{0:C2}"
                                HtmlEncode="false" />

                            <asp:TemplateField
                                HeaderText="Acciones">

                                <ItemTemplate>

                                    <asp:Button
                                        ID="btnEliminar"
                                        runat="server"
                                        Text="Quitar"
                                        CssClass="btn btn-sm btn-danger"
                                        CommandArgument='<%# Eval("Producto.Id") %>'
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

                            <span class="fw-bold">
                                TOTAL COMPRA:
                            </span>

                            <asp:Label
                                ID="lblTotal"
                                runat="server"
                                CssClass="fw-bold"
                                Text="$0,00">
                            </asp:Label>

                        </div>

                    </div>

                </div>

                <!-- Botones -->
                <div class="d-flex justify-content-end mt-4 gap-2">

                    <asp:Button
                        ID="btnLimpiar"
                        runat="server"
                        Text="Limpiar"
                        CssClass="btn btn-outline-secondary"
                        OnClick="btnLimpiar_Click" />

                    <asp:Button
                        ID="btnRegistrarCompra"
                        runat="server"
                        Text="Registrar compra"
                        CssClass="btn btn-success"
                        OnClick="btnRegistrarCompra_Click" />

                </div>

            </div>

        </div>

    </div>

    <!-- Modal de productos -->
    <div
        class="modal fade"
        id="modalProductos"
        tabindex="-1"
        aria-labelledby="modalProductosLabel"
        aria-hidden="true">

        <div class="modal-dialog modal-lg">

            <div class="modal-content">

                <div class="modal-header bg-success text-white">

                    <h5
                        class="modal-title"
                        id="modalProductosLabel">

                        <i class="bi bi-box-seam me-2"></i>
                        Seleccionar producto

                    </h5>

                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Cerrar">
                    </button>

                </div>

                <div class="modal-body">

                    <asp:TextBox
                        ID="txtBuscarProducto"
                        runat="server"
                        CssClass="form-control mb-3"
                        placeholder="Buscar producto..."
                        AutoPostBack="true"
                        OnTextChanged="txtBuscarProducto_TextChanged">
                    </asp:TextBox>

                    <asp:GridView
                        ID="gvProductos"
                        runat="server"
                        AutoGenerateColumns="false"
                        DataKeyNames="Id"
                        CssClass="table table-bordered table-hover"
                        EmptyDataText="No hay productos para este proveedor.">

                        <Columns>

                            <asp:BoundField
                                DataField="Nombre"
                                HeaderText="Producto" />

                            <asp:BoundField
                                DataField="Precio"
                                HeaderText="Costo"
                                DataFormatString="{0:C2}"
                                HtmlEncode="false" />

                            <asp:TemplateField
                                HeaderText="Cantidad">

                                <ItemTemplate>

                                    <asp:TextBox
                                        ID="txtCantidad"
                                        runat="server"
                                        Text="1"
                                        TextMode="Number"
                                        min="1"
                                        Width="80px"
                                        CssClass="form-control form-control-sm">
                                    </asp:TextBox>

                                </ItemTemplate>

                            </asp:TemplateField>

                            <asp:TemplateField
                                HeaderText="Acción">

                                <ItemTemplate>

                                    <asp:Button
                                        ID="btnAgregar"
                                        runat="server"
                                        Text="Agregar"
                                        CssClass="btn btn-sm btn-success"
                                        CommandArgument='<%# Eval("Id") %>'
                                        OnClick="btnAgregar_Click" />

                                </ItemTemplate>

                            </asp:TemplateField>

                        </Columns>

                    </asp:GridView>

                </div>

                <div class="modal-footer">

                    <button
                        type="button"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal">

                        Cerrar

                    </button>

                </div>

            </div>

        </div>

    </div>

    <script type="text/javascript">

        function abrirModalProductos() {

            var elemento =
                document.getElementById("modalProductos");

            var modal =
                bootstrap.Modal.getOrCreateInstance(elemento);

            modal.show();
        }

    </script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</asp:Content>
