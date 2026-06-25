<%@ Page Title="" Language="C#" MasterPageFile="~/Vendedor.Master" AutoEventWireup="true" CodeBehind="Cotizaciones.aspx.cs" Inherits="FlexComercio.Cotizaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
       
        <div class="container-fluid" style="padding: 2rem;">
            <div class="cotizador-header">
                <h1>Cotizador</h1>
                <p>Calculá el precio de una venta sin confirmarla</p>
            </div>

            <div class="main-grid">
                <div>
                    <div class="agregar-card">
                        <h3>Agregar producto</h3>
                        
                        <!-- Mensaje de éxito/error -->
                        <asp:Label ID="lblMensaje" runat="server" CssClass="alert d-none" Role="alert" />

                        <div style="margin-bottom: 1.5rem;">
                            <asp:Button ID="btnAgregarProducto" runat="server" Text="Seleccionar producto..." 
                                       CssClass="btn-abrir-modal" OnClientClick="abrirModalProductos(event);" />
                        </div>

                        <!-- Productos agregados -->
                        <asp:Panel ID="pnlDetalles" runat="server">
                            <asp:GridView ID="gvDetalles" runat="server" 
                                          AutoGenerateColumns="False" 
                                          CssClass="gv-detalles"
                                          EmptyDataText="Agregá productos para calcular el precio"
                                          OnRowCommand="gvDetalles_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="ProductoNombre" HeaderText="Producto" />
                                    <asp:BoundField DataField="PrecioUnitario" HeaderText="Precio Unit." DataFormatString="{0:C2}" />
                                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                                    <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" DataFormatString="{0:C2}" />
                                    <asp:TemplateField HeaderText="Acción">
                                        <ItemTemplate>
                                            <asp:Button ID="btnEliminar" runat="server" 
                                                        CommandName="Eliminar"
                                                        CommandArgument='<%# Eval("ProductoId") %>'
                                                        CssClass="btn btn-sm btn-danger"
                                                        Text="Quitar" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                    </div>
                </div>

                <!-- Resumen Panel -->
                <div class="resumen-panel">
                    <div class="resumen-header">
                        <h4>RESUMEN</h4>
                        <div class="resumen-items" id="cantidadProductos">Sin productos</div>
                    </div>

                    <div class="total-section">
                        <div class="total-label">TOTAL</div>
                        <div class="total-amount">
                            <asp:Label ID="lblTotal" runat="server" Text="$0.00" />
                        </div>
                    </div>

                    <div class="botones-accion">
                        <asp:Button ID="btnImprimir" runat="server" Text="Imprimir cotización" 
                                   CssClass="btn-imprimir" OnClick="btnImprimir_Click"
                            />
                        <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" 
                                   CssClass="btn-limpiar" OnClick="btnLimpiar_Click" />
                    </div>
                </div>
            </div>

            <div class="nota">
                <div class="nota-titulo">
                    <i class="bi bi-info-circle"></i>
                    Nota
                </div>
                <p class="nota-texto">Esta cotización no registra ninguna venta. Para confirmar, usá el módulo de Ventas.</p>
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
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <asp:TextBox ID="txtBuscarProducto" runat="server" CssClass="form-control" placeholder="Buscar producto..." />
                        </div>
                        <asp:GridView ID="gvProductos" runat="server" 
                                      AutoGenerateColumns="False" 
                                      CssClass="table table-bordered table-hover"
                                      DataKeyNames="ProductoId"
                                      OnRowCommand="gvProductos_RowCommand" >
                            <Columns>
                                <asp:BoundField DataField="ProductoId" HeaderText="ID" Visible="false" />
                                <asp:BoundField DataField="Nombre" HeaderText="Producto" />
                                <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:C2}" />
                                <asp:TemplateField HeaderText="Cantidad">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtCantidad" runat="server" Text="1" Width="60px" 
                                                    CssClass="form-control form-control-sm" TextMode="Number" min="1" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="btnAgregar" runat="server" 
                                                    CommandName="AgregarProducto" 
                                                    CommandArgument='<%# Eval("ProductoId") %>'
                                                    CssClass="btn btn-sm btn-success" 
                                                    Text="Agregar" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">
        function abrirModalProductos(e) {
            e.preventDefault();
            var modal = new bootstrap.Modal(document.getElementById('modalProductos'));
            modal.show();
        }

        function ActualizarResumen() {
            var gvDetalles = document.getElementById('<%= gvDetalles.ClientID %>');
            var filas = gvDetalles.getElementsByTagName('tbody')[0].getElementsByTagName('tr');
            
            var cantidad = filas.length;
            var elemento = document.getElementById('cantidadProductos');
            
            if (cantidad === 0) {
                elemento.textContent = 'Sin productos';
            } else {
                elemento.textContent = cantidad + ' producto' + (cantidad !== 1 ? 's' : '');
            }
        }

        document.addEventListener('DOMContentLoaded', function() {
            ActualizarResumen();
        });
    </script>
</asp:Content>
