<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Backup.aspx.cs" Inherits="FlexComercio.Backup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid py-4">

    <div class="mb-4">
        <h2 class="fw-bold mb-0">BackUp</h2>
        <p class="text-secondary mb-0">
            Restauración de registros dados de baja
        </p>
    </div>

    <div class="card shadow-sm border-0 rounded-4">

        <div class="container-fluid mt-4">

            <div class="card rounded-4 mb-4 p-3">

                <div class="row align-items-center">

                    <div class="col-md-2 text-center">
                        <div class="bg-light rounded-4 p-4 d-inline-block">
                            <i class="bi bi-people fs-1"></i>
                        </div>
                    </div>

                    <div class="col-md-7">
                        <h3 class="fw-bold mb-2">Clientes</h3>
                        <p class="mb-0 text-secondary">
                            Visualizar clientes dados de baja.
                        </p>
                    </div>

                    <div class="col-md-3 text-end">
                        <asp:Button ID="btnClientes"
                            runat="server"
                            Text="Mostrar"
                            CssClass="btn btn-dark"
                            PostBackUrl="~/BackupClientes.aspx" />
                    </div>

                </div>

            </div>

            <div class="card rounded-4 mb-4 p-3">

                <div class="row align-items-center">

                    <div class="col-md-2 text-center">
                        <div class="bg-light rounded-4 p-4 d-inline-block">
                            <i class="bi bi-person-gear fs-1"></i>
                        </div>
                    </div>

                    <div class="col-md-7">
                        <h3 class="fw-bold mb-2">Usuarios</h3>
                        <p class="mb-0 text-secondary">
                            Visualizar usuarios dados de baja.
                        </p>
                    </div>

                    <div class="col-md-3 text-end">
                        <asp:Button ID="btnUsuarios"
                            runat="server"
                            Text="Mostrar"
                            CssClass="btn btn-dark"
                            PostBackUrl="~/BackupUsuarios.aspx" />
                    </div>

                </div>

            </div>

            <div class="card rounded-4 mb-4 p-3">

                <div class="row align-items-center">

                    <div class="col-md-2 text-center">
                        <div class="bg-light rounded-4 p-4 d-inline-block">
                            <i class="bi bi-box-seam fs-1"></i>
                        </div>
                    </div>

                    <div class="col-md-7">
                        <h3 class="fw-bold mb-2">Productos</h3>
                        <p class="mb-0 text-secondary">
                            Visualizar productos dados de baja.
                        </p>
                    </div>

                    <div class="col-md-3 text-end">
                        <asp:Button ID="btnProductos"
                            runat="server"
                            Text="Mostrar"
                            CssClass="btn btn-dark"
                            PostBackUrl="~/BackupProductos.aspx" />
                    </div>

                </div>

            </div>

            <div class="card rounded-4 mb-4 p-3">

                <div class="row align-items-center">

                    <div class="col-md-2 text-center">
                        <div class="bg-light rounded-4 p-4 d-inline-block">
                            <i class="bi bi-truck fs-1"></i>
                        </div>
                    </div>

                    <div class="col-md-7">
                        <h3 class="fw-bold mb-2">Proveedores</h3>
                        <p class="mb-0 text-secondary">
                            Visualizar proveedores dados de baja.
                        </p>
                    </div>

                    <div class="col-md-3 text-end">
                        <asp:Button ID="btnProveedores"
                            runat="server"
                            Text="Mostrar"
                            CssClass="btn btn-dark"
                            PostBackUrl="~/BackupProveedores.aspx" />
                    </div>

                </div>

            </div>
            <div class="card rounded-4 mb-4 p-3">

                <div class="row align-items-center">

                    <div class="col-md-2 text-center">
                        <div class="bg-light rounded-4 p-4 d-inline-block">
                            <i class="bi bi-bookmark-star fs-1"></i>
                        </div>
                    </div>

                    <div class="col-md-7">
                        <h3 class="fw-bold mb-2">Marcas</h3>
                        <p class="mb-0 text-secondary">
                            Visualizar marcas dadas de baja.
                        </p>
                    </div>

                    <div class="col-md-3 text-end">
                        <asp:Button ID="btnMarcas"
                            runat="server"
                            Text="Mostrar"
                            CssClass="btn btn-dark"
                            PostBackUrl="~/BackupDetalle.aspx?modulo=marcas" />
                    </div>

                </div>

            </div>
            <div class="card rounded-4 mb-4 p-3">

                <div class="row align-items-center">

                    <div class="col-md-2 text-center">
                        <div class="bg-light rounded-4 p-4 d-inline-block">
                            <i class="bi bi-tags fs-1"></i>
                        </div>
                    </div>

                    <div class="col-md-7">
                        <h3 class="fw-bold mb-2">Categorías</h3>
                        <p class="mb-0 text-secondary">
                            Visualizar categorías dadas de baja.
                        </p>
                    </div>

                    <div class="col-md-3 text-end">
                        <asp:Button ID="btnCategorias"
                            runat="server"
                            Text="Mostrar"
                            CssClass="btn btn-dark"
                            PostBackUrl="~/BackupDetalle.aspx?modulo=categorias" />
                    </div>

                </div>

            </div>

        </div>

    </div>

</div>
</asp:Content>
