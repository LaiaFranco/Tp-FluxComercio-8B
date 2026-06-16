<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="ViewVentasDetalle.aspx.cs" Inherits="FlexComercio.ViewVentasDetalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid px-3 px-md-4 my-2">
    <div class="card border-0 shadow-sm">
        <div class="card-header bg-black text-white py-2 px-3" style="border-bottom: 2px solid #9eff00;">
            <div class="d-flex align-items-center">
                <img src="https://cdn-icons-png.flaticon.com/512/2331/2331942.png" alt="Detalle Venta" width="35" class="me-2 bg-white rounded p-1">
                <div>
                    <h5 class="mb-0 fw-bold">Detalle de Venta</h5>
                    <p class="mb-0 small">ID Venta: <strong>#001</strong> | Fecha : 12/2/2000 </p>
                </div>
            </div>
        </div>
        <div class="card-body p-3">
            <div class="row mb-3">
                <div class="col-md-6">
                    <div class="border-start border-4 ps-2" style="border-color: #9eff00;">
                        <h6 class="text-muted mb-0 small">Cliente</h6>
                        <p class="fw-bold mb-0">María González</p>
                        <small class="text-secondary">maria.gonzalez@email.com</small>
                    </div>
                </div>
                <div class="col-md-6 text-md-end">
                    <div class="border-start border-4 ps-2" style="border-color: #9eff00;">
                        <h6 class="text-muted mb-0 small">Total Venta</h6>
                        <p class="h4 fw-bold mb-0" style="color: #9eff00;">$ 1,459.25</p>
                    </div>
                </div>
            </div>

            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-black text-white">
                        <tr>
                            <th class="ps-2">ID Producto</th>
                            <th>Producto</th>
                            <th class="text-center" style="width: 100px;">Cantidad</th>
                            <th class="text-end" style="width: 130px;">Precio Unitario</th>
                            <th class="text-end" style="width: 130px;">Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="ps-2">101</td><td>Laptop Gamer</td><td class="text-center">1</td><td class="text-end">$899.99</td><td class="text-end">$899.99</td>
                        </tr>
                        <tr>
                            <td class="ps-2">205</td><td>Mouse Inalámbrico</td><td class="text-center">2</td><td class="text-end">$25.50</td><td class="text-end">$51.00</td>
                        </tr>
                        <tr>
                            <td class="ps-2">307</td><td>Teclado Mecánico</td><td class="text-center">1</td><td class="text-end">$75.00</td><td class="text-end">$75.00</td>
                        </tr>
                        <tr>
                            <td class="ps-2">412</td><td>Monitor 24"</td><td class="text-center">1</td><td class="text-end">$180.00</td><td class="text-end">$180.00</td>
                        </tr>
                    </tbody>
                    <tfoot class="table-light">
                        <tr>
                            <td colspan="4" class="text-end fw-bold">Subtotal</td><td class="text-end fw-bold">$1,205.99</td>
                        </tr>
                        <tr>
                            <td colspan="4" class="text-end fw-bold">IVA (21%)</td><td class="text-end fw-bold">$253.26</td>
                        </tr>
                        <tr class="border-top border-2" style="border-color: #9eff00;">
                            <td colspan="4" class="text-end fs-6 fw-bold">TOTAL</td><td class="text-end fs-6 fw-bold" style="color: #9eff00;">$1,459.25</td>
                        </tr>
                    </tfoot>
                </table>
            </div>

            <div class="d-flex justify-content-end gap-2 mt-3">
                <button class="btn btn-outline-dark btn-sm px-3 rounded-pill"><i class="bi bi-printer"></i> Imprimir</button>
                <button class="btn btn-sm px-3 rounded-pill" style="background-color: #9eff00; color: #000;"><i class="bi bi-arrow-left"></i> Volver</button>
            </div>
        </div>
        <div class="card-footer bg-white text-muted small px-3 py-1 border-0">
            <i class="bi bi-check-circle-fill" style="color: #9eff00;"></i> Detalles de la venta #001
        </div>
    </div>
</div>
</asp:Content>
