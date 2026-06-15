<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="FormularioVentas.aspx.cs" Inherits="FlexComercio.FormularioVentas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <div class="container-fluid mt-4 px-4">
    <div class="card shadow-sm border-0">
        <!-- Cabecera  -->
        <div class="card-header bg-success text-white py-3">
            <i class="bi bi-cart-plus me-2"></i> Nueva Venta
        </div>
        <div class="card-body bg-white">
            <form id="formVenta">
                <!-- Datos de cabecera en fila compacta -->
                <div class="row g-3 mb-4">
                    <div class="col-md-4">
                        <label class="form-label fw-bold text-dark">Cliente *</label>
                        <select class="form-select border-secondary" required>
                            <option value="">-- Seleccionar cliente --</option>
                            <option value="1">Juan Pérez</option>
                            <option value="2">María López</option>
                            <option value="3">Carlos Ruiz</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label fw-bold text-dark">Fecha</label>
                        <input type="date" class="form-control bg-white border-secondary" value="2025-03-21" readonly>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label fw-bold text-dark">Vendedor</label>
                        <input type="text" class="form-control bg-white border-secondary" value="Ana Pérez" readonly>
                    </div>
                    <div class="col-md-2">
                        <label class="form-label fw-bold text-dark">N° Factura</label>
                        <input type="text" class="form-control bg-light border-secondary" placeholder="Se genera al guardar" readonly>
                    </div>
                </div>

                <!-- Sección de productos -->
                <div class="mt-3">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h5 class="mb-0 text-dark">Productos</h5>
                        <button type="button" class="btn btn-sm btn-success">
                            <i class="bi bi-plus-circle"></i> Agregar producto
                        </button>
                    </div>

                    <!-- Cabecera de tabla (oculta en móvil pero visible en desktop) -->
                    <div class="row fw-bold text-muted mb-2 px-2 d-none d-md-flex">
                        <div class="col-md-4">Producto</div>
                        <div class="col-md-2">Cantidad</div>
                        <div class="col-md-2">Precio unitario</div>
                        <div class="col-md-2">Subtotal</div>
                        <div class="col-md-2">Acciones</div>
                    </div>

                    <!-- Fila de producto 1 -->
                    <div class="row g-2 mb-3 align-items-end">
                        <div class="col-md-4">
                            <select class="form-select border-secondary">
                                <option value="">-- Producto --</option>
                                <option value="101">Laptop HP (Stock: 12)</option>
                                <option value="102">Mouse Logitech (Stock: 45)</option>
                                <option value="103">Teclado Mecánico (Stock: 23)</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <input type="number" class="form-control border-secondary" value="1" min="1">
                        </div>
                        <div class="col-md-2">
                            <input type="text" class="form-control bg-white border-secondary" readonly value="$845.00">
                        </div>
                        <div class="col-md-2">
                            <input type="text" class="form-control bg-light border-secondary" readonly value="$845.00">
                        </div>
                        <div class="col-md-2">
                            <button type="button" class="btn btn-outline-danger btn-sm w-100">
                                <i class="bi bi-trash"></i> Eliminar
                            </button>
                        </div>
                    </div>

                    <!-- Fila de producto 2 -->
                    <div class="row g-2 mb-3 align-items-end">
                        <div class="col-md-4">
                            <select class="form-select border-secondary">
                                <option value="">-- Producto --</option>
                                <option value="104">Monitor 24" (Stock: 8)</option>
                                <option value="105">USB 64GB (Stock: 100)</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <input type="number" class="form-control border-secondary" value="2" min="1">
                        </div>
                        <div class="col-md-2">
                            <input type="text" class="form-control bg-white border-secondary" readonly value="$225.00">
                        </div>
                        <div class="col-md-2">
                            <input type="text" class="form-control bg-light border-secondary" readonly value="$450.00">
                        </div>
                        <div class="col-md-2">
                            <button type="button" class="btn btn-outline-danger btn-sm w-100">
                                <i class="bi bi-trash"></i> Eliminar
                            </button>
                        </div>
                    </div>

                    <!-- Totales -->
                    <div class="row mt-4">
                        <div class="col-md-6 offset-md-6">
                            <div class="d-flex justify-content-between bg-dark text-white p-3 rounded">
                                <span class="fw-bold">TOTAL VENTA:</span>
                                <span class="fw-bold">$1,295.00</span>
                            </div>
                        </div>
                    </div>

                    <!-- Botones de acción -->
                    <div class="d-flex justify-content-end mt-4 gap-2">
                        <button type="reset" class="btn btn-outline-secondary">Limpiar</button>
                        <button type="submit" class="btn btn-success">Registrar Venta</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


</asp:Content>
