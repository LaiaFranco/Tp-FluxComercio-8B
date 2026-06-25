<%@ Page Title="Cotizador" Language="C#" MasterPageFile="~/Vendedor.Master" AutoEventWireup="true" CodeBehind="Cotizaciones.aspx.cs" Inherits="FlexComercio.Cotizaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Select2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css" rel="stylesheet" />

    <style>
        /* ===== RESET Y FONDO (se mantiene claro) ===== */
        .cotizador-container {
            max-width: 100%;
            padding: 1.5rem 2rem;
            background-color: #f8f9fa;
            min-height: 100vh;
        }

        /* ===== TÍTULOS ===== */
        .cotizador-titulo {
            font-size: 1.8rem;
            font-weight: 700;
            color: #000000;
            margin-bottom: 0.25rem;
        }
        .cotizador-titulo i {
            color: #00c853;
        }

        .cotizador-subtitulo {
            color: #495057;
            font-size: 0.95rem;
            margin-bottom: 1.5rem;
        }

        /* ===== TARJETAS ===== */
        .card-cotizador {
            background: #ffffff;
            border-radius: 8px;
            padding: 1.5rem 2rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 2px 8px rgba(0,0,0,0.06);
            border: 1px solid #e0e0e0;
        }

        .card-cotizador .card-title {
            font-weight: 600;
            font-size: 1.1rem;
            margin-bottom: 1.25rem;
            color: #000000;
        }
        .card-cotizador .card-title i {
            color: #00c853;
        }

        /* ===== FORMULARIO AGREGAR ===== */
        .form-agregar .form-label {
            font-weight: 500;
            font-size: 0.9rem;
            color: #000000;
            margin-bottom: 0.25rem;
        }

        .form-agregar .form-select,
        .form-agregar .form-control {
            border-radius: 6px;
            border: 1px solid #ced4da;
            padding: 0.5rem 0.75rem;
            font-size: 0.95rem;
        }
        .form-agregar .form-select:focus,
        .form-agregar .form-control:focus {
            border-color: #00c853;
            box-shadow: 0 0 0 0.25rem rgba(0, 200, 83, 0.25);
        }

        /* Botón + Agregar (verde lima / negro) */
        .btn-agregar {
            background-color: #00c853;
            color: #000000;
            border: none;
            border-radius: 6px;
            padding: 0.55rem 1.5rem;
            font-weight: 700;
            font-size: 0.95rem;
            width: 100%;
            transition: background-color 0.2s, transform 0.1s;
        }
        .btn-agregar:hover {
            background-color: #00b84a;
            color: #000000;
            transform: scale(1.01);
        }
        .btn-agregar:active {
            transform: scale(0.98);
        }

        /* ===== TABLA DE PRODUCTOS (GridView) ===== */
        .table-cotizador {
            width: 100%;
            margin-top: 1rem;
            border-collapse: collapse;
        }

        .table-cotizador thead th {
            font-weight: 700;
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            color: #000000;
            padding: 0.5rem 0.75rem;
            border-bottom: 2px solid #00c853;
            text-align: left;
        }

        .table-cotizador thead th:last-child {
            text-align: right;
        }

        .table-cotizador tbody td {
            padding: 0.6rem 0.75rem;
            border-bottom: 1px solid #e9ecef;
            vertical-align: middle;
            font-size: 0.95rem;
            color: #212529;
        }

        .table-cotizador tbody tr:last-child td {
            border-bottom: none;
        }

        .table-cotizador .col-cantidad {
            text-align: center;
        }

        .table-cotizador .col-precio,
        .table-cotizador .col-subtotal {
            text-align: right;
            font-weight: 600;
        }

        .table-cotizador .col-producto {
            font-weight: 500;
        }

        /* ===== RESUMEN (ítems) ===== */
        .resumen-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.4rem 0;
            border-bottom: 1px solid #f0f0f0;
        }
        .resumen-item:last-child {
            border-bottom: none;
        }
        .resumen-item .producto-nombre {
            font-weight: 600;
            color: #000000;
        }
        .resumen-item .producto-cantidad {
            color: #495057;
            margin-left: 0.5rem;
        }
        .resumen-item .subtotal {
            font-weight: 700;
            color: #000000;
        }

        /* ===== TOTAL ===== */
        .total-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 0.75rem;
            padding-top: 0.75rem;
            border-top: 2px solid #00c853;
        }
        .total-label {
            font-weight: 700;
            font-size: 1.1rem;
            color: #000000;
        }
        .total-monto {
            font-size: 1.6rem;
            font-weight: 800;
            color: #00c853;
        }

        .resumen-cantidad {
            font-size: 0.9rem;
            color: #495057;
            font-weight: 500;
        }

        /* ===== BOTONES DE ACCIÓN ===== */
        .acciones-botones {
            display: flex;
            gap: 1rem;
            margin-top: 1.25rem;
        }

        .acciones-botones .btn {
            flex: 1;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-weight: 600;
            font-size: 0.95rem;
            border: 2px solid #00c853;
            background: transparent;
            color: #000000;
            transition: all 0.2s;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
        }

        .acciones-botones .btn i {
            margin-right: 0.5rem;
            color: #00c853;
        }

        .acciones-botones .btn:hover {
            background-color: #00c853;
            color: #000000;
            border-color: #00c853;
        }
        .acciones-botones .btn:hover i {
            color: #000000;
        }

        .acciones-botones .btn-limpiar {
            border-color: #dc3545;
            color: #dc3545;
        }
        .acciones-botones .btn-limpiar i {
            color: #dc3545;
        }
        .acciones-botones .btn-limpiar:hover {
            background-color: #dc3545;
            color: #ffffff;
            border-color: #dc3545;
        }
        .acciones-botones .btn-limpiar:hover i {
            color: #ffffff;
        }

        /* ===== NOTA ===== */
        .nota-cotizacion {
            background: #f8f9fa;
            border-left: 4px solid #00c853;
            padding: 0.75rem 1rem;
            border-radius: 4px;
            font-size: 0.9rem;
            color: #212529;
            margin-top: 1.5rem;
        }
        .nota-cotizacion i {
            color: #00c853;
            margin-right: 0.5rem;
        }

        /* ===== RESPONSIVE ===== */
        @media (max-width: 768px) {
            .cotizador-container {
                padding: 1rem;
            }
            .card-cotizador {
                padding: 1rem;
            }
            .acciones-botones {
                flex-direction: column;
                gap: 0.5rem;
            }
            .table-cotizador thead th {
                font-size: 0.7rem;
            }
        }

        /* Estilos para el GridView y Repeater */
        .gv-productos {
            width: 100%;
            border-collapse: collapse;
        }
        .gv-productos th {
            font-weight: 700;
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            color: #000000;
            padding: 0.5rem 0.75rem;
            border-bottom: 2px solid #00c853;
            text-align: left;
        }
        .gv-productos td {
            padding: 0.6rem 0.75rem;
            border-bottom: 1px solid #e9ecef;
            vertical-align: middle;
            font-size: 0.95rem;
            color: #212529;
        }
        .gv-productos .text-center {
            text-align: center;
        }
        .gv-productos .text-end {
            text-align: right;
        }
        .gv-productos .font-weight-600 {
            font-weight: 600;
        }
        .gv-productos .font-weight-500 {
            font-weight: 500;
        }
        .gv-productos .empty-data {
            text-align: center;
            color: #6c757d;
            padding: 1.5rem 0;
        }
        .rpt-resumen .resumen-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.4rem 0;
            border-bottom: 1px solid #f0f0f0;
        }
        .rpt-resumen .resumen-item:last-child {
            border-bottom: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="cotizador-container">

        <!-- Título -->
        <h1 class="cotizador-titulo"><i class="bi bi-calculator-fill me-2"></i>Cotizador</h1>
        <p class="cotizador-subtitulo">Calculá el precio de una venta sin confirmarla</p>

        <!-- Tarjeta: Agregar producto -->
        <div class="card-cotizador">
            <h5 class="card-title"><i class="bi bi-plus-circle me-1"></i> Agregar producto</h5>

            <div class="row g-3 form-agregar align-items-end">
                <div class="col-md-5">
                    <label for="ddlProductos" class="form-label">Producto</label>
                    <asp:DropDownList ID="ddlProductos" runat="server" CssClass="form-select">
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <label for="txtCantidad" class="form-label">Cantidad</label>
                    <asp:TextBox ID="txtCantidad" runat="server" Text="1" CssClass="form-control" />
                </div>
                <div class="col-md-4">
                    <asp:Button ID="btnAgregar" runat="server" Text="+ Agregar" CssClass="btn-agregar" OnClick="btnAgregar_Click" />
                </div>
            </div>

            <!-- Tabla de productos (GridView) -->
            <div class="table-responsive mt-3">
                <asp:GridView ID="gvProductos" runat="server" AutoGenerateColumns="False" CssClass="table-cotizador gv-productos"
                    GridLines="None" ShowHeaderWhenEmpty="True" EmptyDataText="No hay productos agregados">
                    <Columns>
                        <asp:BoundField DataField="Nombre" HeaderText="PRODUCTO" ItemStyle-CssClass="col-producto" />
                        <asp:BoundField DataField="Cantidad" HeaderText="CANTIDAD" ItemStyle-CssClass="col-cantidad text-center" />
                        <asp:BoundField DataField="PrecioUnitario" HeaderText="PRECIO UNIT." DataFormatString="{0:C2}" ItemStyle-CssClass="col-precio text-end font-weight-600" />
                        <asp:BoundField DataField="Subtotal" HeaderText="SUBTOTAL" DataFormatString="{0:C2}" ItemStyle-CssClass="col-subtotal text-end font-weight-600" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <!-- Tarjeta: Resumen -->
        <div class="card-cotizador">
            <div class="d-flex justify-content-between align-items-center mb-2">
                <h5 class="card-title mb-0"><i class="bi bi-list-ul me-1"></i> RESUMEN</h5>
                <span class="resumen-cantidad" id="lblCantidadResumen" runat="server">0 productos</span>
            </div>

            <!-- Lista de ítems en el resumen (Repeater) -->
            <asp:Repeater ID="rptResumen" runat="server">
                <HeaderTemplate>
                    <div class="rpt-resumen">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="resumen-item">
                        <span>
                            <span class="producto-nombre"><%# Eval("Nombre") %></span>
                            <span class="producto-cantidad">× <%# Eval("Cantidad") %></span>
                        </span>
                        <span class="subtotal"><%# Eval("Subtotal", "{0:C2}") %></span>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>

            <!-- Cuando no hay productos, mostrar mensaje -->
            <asp:PlaceHolder ID="phSinProductos" runat="server" Visible="false">
                <p class="text-muted text-center py-2">Sin productos</p>
            </asp:PlaceHolder>

            <!-- Total -->
            <div class="total-row">
                <span class="total-label">TOTAL</span>
                <span class="total-monto" id="lblTotal" runat="server">$0.00</span>
            </div>

            <!-- Botones -->
            <div class="acciones-botones">
                <button type="button" class="btn" onclick="window.print();">
                    <i class="bi bi-printer"></i> Imprimir cotización
                </button>
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn btn-limpiar" OnClick="btnLimpiar_Click" />
            </div>
        </div>

        <!-- Nota -->
        <div class="nota-cotizacion">
            <i class="bi bi-info-circle-fill"></i>
            <strong>Nota</strong> — Esta cotización no registra ninguna venta. Para confirmar, usá el módulo de Ventas.
        </div>

    </div>

    <!-- jQuery y Select2 JS (para el buscador) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#<%= ddlProductos.ClientID %>').select2({
                theme: 'bootstrap-5',
                placeholder: 'Seleccionar producto...',
                allowClear: true,
                width: '100%'
            });
        });
    </script>
</asp:Content>