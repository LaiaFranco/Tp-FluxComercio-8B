<%@ Page Title="" Language="C#" MasterPageFile="~/Vendedor.Master" AutoEventWireup="true" CodeBehind="MisVentas.aspx.cs" Inherits="FlexComercio.MisVentas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <div class="container-fluid py-4">

    <!-- Encabezado -->
    <div class="mb-5">
        <h1 class="fw-bold mb-1">Mis Ventas</h1>
        <p class="text-secondary fs-5 mb-0">
            Historial de ventas realizadas por vos
        </p>
    </div>

    <!-- Cards Resumen -->
    <div class="row g-4 mb-4">

        <!-- Cantidad de ventas -->
        <div class="col-lg-4">
            <div class="card border-0 shadow-sm rounded-4 h-100">
                <div class="card-body text-center py-4">

                    <h1 class="fw-bold text-primary mb-2">
                        <asp:Label ID="lblCantidadVentas"
                            runat="server"
                            Text="0">
                        </asp:Label>
                    </h1>

                    <p class="text-secondary mb-0">
                        Ventas realizadas
                    </p>

                </div>
            </div>
        </div>

        <!-- Total acumulado -->
        <div class="col-lg-4">
            <div class="card border-0 shadow-sm rounded-4 h-100">
                <div class="card-body text-center py-4">

                    <h1 class="fw-bold text-success mb-2">
                        $<asp:Label ID="lblTotalAcumulado"
                            runat="server"
                            Text="0.00">
                        </asp:Label>
                    </h1>

                    <p class="text-secondary mb-0">
                        Total acumulado
                    </p>

                </div>
            </div>
        </div>

        <!-- Fecha -->
        <div class="col-lg-4">
            <div class="card border-0 shadow-sm rounded-4 h-100">
                <div class="card-body d-flex align-items-center justify-content-center py-4">

                    <i class="bi bi-calendar3 fs-3 text-primary me-3"></i>

                    <h5 class="mb-0 fw-semibold text-secondary">
                        <asp:Label ID="lblFecha"
                            runat="server">
                        </asp:Label>
                    </h5>

                </div>
            </div>
        </div>

    </div>

    <!-- Tabla de ventas -->
    <div class="card border-0 shadow-sm rounded-4">

        <!-- Buscador -->
        <div class="card-body border-bottom">

            <div class="input-group">

                <span class="input-group-text bg-white border-end-0">
                    <i class="bi bi-search text-secondary"></i>
                </span>

                <asp:TextBox ID="txtBuscar"
                    runat="server"
                    CssClass="form-control border-start-0"
                    placeholder="Buscar por N° factura o cliente..."
                    AutoPostBack="true"
                    OnTextChanged="txtBuscar_TextChanged">
                </asp:TextBox>

            </div>

        </div>

        <!-- Tabla -->
        <div class="table-responsive">

            <asp:GridView ID="dgvVentas"
                runat="server"
                CssClass="table align-middle mb-0"
                AutoGenerateColumns="false"
                BorderStyle="None"
                GridLines="None"
               >   

               <Columns>

                    <asp:BoundField
                        HeaderText="N° FACTURA"
                        DataField="NumFactura" />

                    <asp:TemplateField HeaderText="HORA">
                        <ItemTemplate>
                            <%# Eval("Fecha", "{0:HH:mm}") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField
                        HeaderText="CLIENTE"
                        DataField="Cliente" />

                    <asp:BoundField
                        HeaderText="PRODUCTOS"
                        DataField="CantidadProductos" />

                    <asp:BoundField
                        HeaderText="TOTAL"
                        DataField="Total"
                        DataFormatString="{0:C}" />

                   <asp:BoundField HeaderText="ESTADO" DataField="Estado.Nombre" />

                   
                    <asp:TemplateField HeaderText="ACCIONES">
                        <ItemTemplate>
                            <asp:Button ID="btnEditarEstado"
                                runat="server"
                                Text="Editar estado"
                                CommandName="EditarEstado"
                                CommandArgument='<%# Eval("Id") %>'
                                CssClass="btn btn-sm btn-outline-primary"  OnClick="btnEditarEstado_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="FACTURA">
                        <ItemTemplate>
                            <asp:Button ID="btnVerFactura"
                                runat="server"
                                 Text="Ver detalle"
                                CssClass="btn btn-outline-primary btn-sm rounded-pill px-4"
                                CommandArgument='<%# Eval("Id") %>'
                                OnClick="btnVerFactura_Click">

                     
                                

                            </asp:Button>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

    </div>

</div>
            <style>
    /* Animación de todas las cards */
    .card {
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }

    .card:hover {
        transform: translateY(-4px);
        box-shadow: 0 1rem 3rem rgba(0,0,0,.175) !important;
    }

    /* Iconos de resumen */
    .dashboard-icon {
        width: 80px;
        height: 80px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 1rem;
        background: linear-gradient(135deg, #e0e7ff, #f0f4ff);
    }

    .dashboard-icon i {
        font-size: 2.2rem;
        color: #0d6efd;
    }

    /* Números principales */
    .dashboard-value {
        font-size: 2.2rem;
        font-weight: 700;
        margin-bottom: 0;
    }

    /* Cards de accesos rápidos */
    .quick-access {
        cursor: pointer;
        transition: all 0.2s ease;
    }

    .quick-access:hover {
        transform: translateY(-5px);
        border-color: #0d6efd !important;
    }

    .quick-access .dashboard-icon {
        width: 70px;
        height: 70px;
    }

    .quick-access h3 {
        font-size: 1.4rem;
    }
</style>
</asp:Content>