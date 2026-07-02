<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true"
    CodeBehind="BackupDetalle.aspx.cs" Inherits="FlexComercio.BackupDetalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid py-4">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>
            <h2 class="fw-bold">
                <asp:Label ID="lblTitulo" runat="server"></asp:Label>
            </h2>

            <p class="text-secondary">
                Seleccione el registro que desea restaurar.
            </p>
        </div>

        <a href="Backup.aspx" class="btn btn-dark">
            <i class="bi bi-arrow-left me-2"></i>Volver
        </a>

    </div>

    <asp:MultiView ID="mvBackup" runat="server">

        <!-- ====================== USUARIOS ====================== -->

        <asp:View ID="vwUsuarios" runat="server">

            <asp:Repeater ID="rptUsuarios" runat="server" OnItemCommand="rpt_ItemCommand">

                <ItemTemplate>

                    <div class="card rounded-4 shadow-sm mb-4 p-3">

                        <div class="row align-items-center">

                            <div class="col-md-2 text-center">

                                <div class="bg-light rounded-4 p-4 d-inline-block">
                                    <i class="bi bi-person-x fs-1"></i>
                                </div>

                            </div>

                            <div class="col-md-7">

                                <h4 class="fw-bold"><%# Eval("Nombre") %> </h4>

                                <p class="mb-1"><strong>Email:</strong> <%# Eval("Email") %></p>

                                <p class="mb-0"><strong>Rol:</strong> <%# Eval("Rol.Nombre") %></p>

                            </div>

                            <div class="col-md-3 text-end">

                                <asp:Button
                                    runat="server"
                                    Text="Habilitar"
                                    CssClass="btn btn-success"
                                    CommandName="Habilitar"
                                    CommandArgument='<%# Eval("Id") %>' />

                            </div>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </asp:View>

        <!-- ====================== CLIENTES ====================== -->

        <asp:View ID="vwClientes" runat="server">

            <asp:Repeater ID="rptClientes" runat="server" OnItemCommand="rpt_ItemCommand">

                <ItemTemplate>

                    <div class="card rounded-4 shadow-sm mb-4 p-3">

                        <div class="row align-items-center">

                            <div class="col-md-2 text-center">
                                <div class="bg-light rounded-4 p-4 d-inline-block">
                                    <i class="bi bi-people fs-1"></i>
                                </div>
                            </div>

                            <div class="col-md-7">

                                <h4><%# Eval("Nombre") %> <%# Eval("Apellido") %></h4>

                                <p><strong>DNI:</strong> <%# Eval("Dni") %></p>

                                <p><strong>Teléfono:</strong> <%# Eval("Telefono") %></p>

                            </div>

                            <div class="col-md-3 text-end">

                                <asp:Button
                                    runat="server"
                                    Text="Habilitar"
                                    CssClass="btn btn-success"
                                    CommandName="Habilitar"
                                    CommandArgument='<%# Eval("Id") %>' />

                            </div>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </asp:View>

        <!-- ====================== PRODUCTOS ====================== -->

        <asp:View ID="vwProductos" runat="server">

            <asp:Repeater ID="rptProductos" runat="server" OnItemCommand="rpt_ItemCommand">

                <ItemTemplate>

                    <div class="card rounded-4 shadow-sm mb-4 p-3">

                        <div class="row align-items-center">

                            <div class="col-md-2 text-center">

                                <div class="bg-light rounded-4 p-4 d-inline-block">
                                    <i class="bi bi-box-seam fs-1"></i>
                                </div>

                            </div>

                            <div class="col-md-7">

                                <h4><%# Eval("Nombre") %></h4>
                                <p><strong>Descripcion:</strong> <%# Eval("Descripcion") %></p>

                                <p><strong>Marca:</strong> <%# Eval("Marca.Nombre") %></p>

                                <p><strong>Categoría:</strong> <%# Eval("Categoria.Nombre") %></p>

                                <p><strong>Precio:</strong> $ <%# Eval("Precio") %></p>

                                <p><strong>Stock:</strong> <%# Eval("StockActual") %></p>

                            </div>

                            <div class="col-md-3 text-end">

                                <asp:Button
                                    runat="server"
                                    Text="Habilitar"
                                    CssClass="btn btn-success"
                                    CommandName="Habilitar"
                                    CommandArgument='<%# Eval("Id") %>' />

                            </div>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </asp:View>

        <!-- ====================== PROVEEDORES ====================== -->

        <asp:View ID="vwProveedores" runat="server">

            <asp:Repeater ID="rptProveedores" runat="server" OnItemCommand="rpt_ItemCommand">

                <ItemTemplate>

                    <div class="card rounded-4 shadow-sm mb-4 p-3">

                        <div class="row align-items-center">

                            <div class="col-md-2 text-center">

                                <div class="bg-light rounded-4 p-4 d-inline-block">
                                    <i class="bi bi-truck fs-1"></i>
                                </div>

                            </div>

                            <div class="col-md-7">

                                <h4><%# Eval("Nombre") %></h4>

                                <p><strong>CUIT:</strong> <%# Eval("Cuil") %></p>

                                <p><strong>Teléfono:</strong> <%# Eval("Telefono") %></p>

                            </div>

                            <div class="col-md-3 text-end">

                                <asp:Button
                                    runat="server"
                                    Text="Habilitar"
                                    CssClass="btn btn-success"
                                    CommandName="Habilitar"
                                    CommandArgument='<%# Eval("Id") %>' />

                            </div>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </asp:View>

        <!-- ====================== MARCAS ====================== -->

        <asp:View ID="vwMarcas" runat="server">

            <asp:Repeater ID="rptMarcas" runat="server" OnItemCommand="rpt_ItemCommand">

                <ItemTemplate>

                    <div class="card rounded-4 shadow-sm mb-4 p-3">

                        <div class="row align-items-center">

                            <div class="col-md-2 text-center">

                                <div class="bg-light rounded-4 p-4 d-inline-block">
                                    <i class="bi bi-bookmark-star fs-1"></i>
                                </div>

                            </div>

                            <div class="col-md-7">

                                <h4><%# Eval("Nombre") %></h4>

                            </div>

                            <div class="col-md-3 text-end">

                                <asp:Button
                                    runat="server"
                                    Text="Habilitar"
                                    CssClass="btn btn-success"
                                    CommandName="Habilitar"
                                    CommandArgument='<%# Eval("Id") %>' />

                            </div>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </asp:View>

        <!-- ====================== CATEGORÍAS ====================== -->

        <asp:View ID="vwCategorias" runat="server">

            <asp:Repeater ID="rptCategorias" runat="server" OnItemCommand="rpt_ItemCommand">

                <ItemTemplate>

                    <div class="card rounded-4 shadow-sm mb-4 p-3">

                        <div class="row align-items-center">

                            <div class="col-md-2 text-center">

                                <div class="bg-light rounded-4 p-4 d-inline-block">
                                    <i class="bi bi-tags fs-1"></i>
                                </div>

                            </div>

                            <div class="col-md-7">

                                <h4><%# Eval("Nombre") %></h4>

                            </div>

                            <div class="col-md-3 text-end">

                                <asp:Button
                                    runat="server"
                                    Text="Habilitar"
                                    CssClass="btn btn-success"
                                    CommandName="Habilitar"
                                    CommandArgument='<%# Eval("Id") %>' />

                            </div>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </asp:View>

    </asp:MultiView>

</div>

<style>

.card{
    transition:.2s;
}

.card:hover{
    transform:translateY(-3px);
    box-shadow:0 1rem 3rem rgba(0,0,0,.15)!important;
}

</style>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>