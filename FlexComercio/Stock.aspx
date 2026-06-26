<%@ Page Title="" Language="C#" MasterPageFile="~/Vendedor.Master" AutoEventWireup="true" CodeBehind="Stock.aspx.cs" Inherits="FlexComercio.Stock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <div class="container-fluid py-4">

    <!-- TÍTULO -->
    <div class="mb-4">
        <h1 class="fw-bold mb-1">Consulta de Stock</h1>
        <p class="text-secondary fs-5 mb-0">
            Disponibilidad de productos en tiempo real
        </p>
    </div>

    <!-- CARDS RESUMEN -->
    <div class="row g-4 mb-4">

        <div class="col-lg-3">
            <div class="card border-0 shadow-sm rounded-4">
                <div class="card-body text-center py-4">
                    <h1 class="fw-bold text-dark">
                        <asp:Label ID="lblTotalProductos" runat="server" Text="0" />
                    </h1>
                    <p class="text-secondary mb-0">Total productos</p>
                </div>
            </div>
        </div>

        <div class="col-lg-3">
            <div class="card border-0 shadow-sm rounded-4">
                <div class="card-body text-center py-4">
                    <h1 class="fw-bold text-success">
                        <asp:Label ID="lblConStock" runat="server" Text="0" />
                    </h1>
                    <p class="text-secondary mb-0">Con stock</p>
                </div>
            </div>
        </div>

        <div class="col-lg-3">
            <div class="card border-0 shadow-sm rounded-4">
                <div class="card-body text-center py-4">
                    <h1 class="fw-bold text-warning">
                        <asp:Label ID="lblStockBajo" runat="server" Text="0" />
                    </h1>
                    <p class="text-secondary mb-0">Stock bajo</p>
                </div>
            </div>
        </div>

        <div class="col-lg-3">
            <div class="card border-0 shadow-sm rounded-4">
                <div class="card-body text-center py-4">
                    <h1 class="fw-bold text-danger">
                        <asp:Label ID="lblSinStock" runat="server" Text="0" />
                    </h1>
                    <p class="text-secondary mb-0">Sin stock</p>
                </div>
            </div>
        </div>

    </div>

    <!-- BUSCADOR + FILTRO -->
    <div class="card border-0 shadow-sm rounded-4 mb-4">

        <div class="card-body">

            <div class="row g-3">

                <!-- BUSCADOR -->
                 <div class="col-md-9">

                    <div class="input-group">
                        <span class="input-group-text bg-white border-end-0">
                            <i class="bi bi-search"></i>
                        </span>

                        <asp:TextBox ID="txtBuscar"
                            runat="server"
                            CssClass="form-control border-start-0"
                            placeholder="Buscar por nombre o marca...">
                        </asp:TextBox>
                    </div>

                    <!-- TIMER (BUSQUEDA EN VIVO) -->
                    <asp:Timer ID="tmrBuscar"
                        runat="server"
                        Interval="500"
                        OnTick="tmrBuscar_Tick"
                         />

                </div>

                <!-- CATEGORÍAS -->
                <div class="col-md-3">

                    <asp:DropDownList ID="ddlCategoria"
                        runat="server"
                        CssClass="form-select"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged"
                        >

                    </asp:DropDownList>

                </div>

            </div>

        </div>

    </div>

    <!-- TABLA -->
    <div class="card border-0 shadow-sm rounded-4">

        <div class="table-responsive">

            <asp:UpdatePanel ID="upStock" runat="server" UpdateMode="Conditional">

                <ContentTemplate>

                <asp:GridView ID="dgvStock"
                    runat="server"
                    CssClass="table align-middle mb-0"
                    AutoGenerateColumns="False"
                    GridLines="None">

                 

                <Columns>

                    <asp:BoundField HeaderText="PRODUCTO" DataField="Nombre" />
                    <asp:TemplateField HeaderText="CATEGORIA">
                        <ItemTemplate>
                            <%# Eval("Categoria.Nombre") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="MARCA">
                        <ItemTemplate>
                            <%# Eval("Marca.Nombre") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="STOCK ACTUAL" DataField="StockActual" />
                    <asp:BoundField HeaderText="MÍNIMO" DataField="StockMinimo" />
                    <asp:BoundField HeaderText="PRECIO" DataField="Precio" DataFormatString="{0:C}" />

                   
                    <asp:TemplateField HeaderText="ESTADO">
                        <ItemTemplate>

                            <span class='<%# ObtenerClaseStock(Eval("StockActual"), Eval("StockMinimo")) %>'>
                                <%# ObtenerEstadoStock(Eval("StockActual"), Eval("StockMinimo")) %>
                            </span>

                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>
            </ContentTemplate>
                   <Triggers>

                    <asp:AsyncPostBackTrigger
                        ControlID="ddlCategoria"
                        EventName="SelectedIndexChanged" />

                    <asp:AsyncPostBackTrigger
                        ControlID="tmrBuscar"
                        EventName="Tick" />

                </Triggers>

           </asp:UpdatePanel>

        </div>

    </div>

</div>

<style>

.card{
    border-radius:18px;
}

.card-body h1{
    font-size:2.5rem;
}

.table thead th{
    font-size:.85rem;
    color:#6c757d;
    font-weight:600;
    border-bottom:1px solid #e9ecef;
}

.table tbody td{
    vertical-align:middle;
}

.badge{
    font-size:.85rem;
    padding:.55rem .9rem;
    border-radius:50rem;
}

.input-group-text{
    background:white;
}

.form-control:focus,
.form-select:focus{
    box-shadow:none;
}

</style>

</asp:Content>
