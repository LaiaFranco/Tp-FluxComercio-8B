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
                            CommandArgument="clientes"
                            OnClick="btnMostrar_Click" />
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
                            CommandArgument="usuarios"
                            OnClick="btnMostrar_Click" />
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
                            CommandArgument="productos"
                            OnClick="btnMostrar_Click"  />
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
                            CommandArgument="proveedores"
                            OnClick="btnMostrar_Click"  />
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
                            CommandArgument="marcas"
                            OnClick="btnMostrar_Click"  />
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
                            CommandArgument="categorias"
                            OnClick="btnMostrar_Click"  />
                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

    <<div class="modal fade" id="modalPassword" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content rounded-4">

            <div class="modal-header">
                <h5 class="modal-title">
                    <i class="bi bi-lock-fill me-2"></i>
                    Confirmar acceso
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">

                <p>Ingrese su contraseña para acceder al módulo.</p>

                <asp:TextBox
                    ID="txtPassword"
                    runat="server"
                    CssClass="form-control"
                    TextMode="Password" />

                <asp:Label
                    ID="lblError"
                    runat="server"
                    CssClass="text-danger mt-2 d-block"
                    Visible="false" />

            </div>

            <div class="modal-footer">

                <asp:Button
                    ID="btnConfirmar"
                    runat="server"
                    Text="Aceptar"
                    CssClass="btn btn-success"
                    OnClick="btnConfirmar_Click" />

                <button type="button"
                    class="btn btn-secondary"
                    data-bs-dismiss="modal">
                    Cancelar
                </button>

            </div>

        </div>
    </div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
