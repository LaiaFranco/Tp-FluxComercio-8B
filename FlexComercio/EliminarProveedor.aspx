<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="EliminarProveedor.aspx.cs" Inherits="FlexComercio.EliminarProveedor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <div class="container-fluid mt-4" style="min-height: 100vh; background-color: #ffffff; padding: 20px;">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">

            <div style="background-color: #ffffff; border-radius: 10px; padding: 30px;">

                <div id="divConfirmarEliminar" runat="server" visible="true">

                    <div class="card p-4 border-0 shadow-sm">

                        <h3 class="text-danger mb-3">
                            <i class="bi bi-exclamation-triangle-fill me-2"></i>Eliminar Proveedor
                        </h3>

                        <p class="fs-5">¿Estás seguro de que deseas eliminar este proveedor?</p>

                        <hr />

                        <dl class="row mt-3">

                            <dt class="col-sm-3 fw-bold">CUIL</dt>
                            <dd class="col-sm-9">
                                <asp:TextBox ID="txtCuil" runat="server" CssClass="form-control" Enabled="false" />
                            </dd>

                            <dt class="col-sm-3 fw-bold">Nombre</dt>
                            <dd class="col-sm-9">
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Enabled="false" />
                            </dd>

                            <dt class="col-sm-3 fw-bold">Email</dt>
                            <dd class="col-sm-9">
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Enabled="false" />
                            </dd>

                            <dt class="col-sm-3 fw-bold">Teléfono</dt>
                            <dd class="col-sm-9">
                                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" Enabled="false" />
                            </dd>

                            <dt class="col-sm-3 fw-bold">Dirección</dt>
                            <dd class="col-sm-9">
                                <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" Enabled="false" />
                            </dd>

                            <dt class="col-sm-3 fw-bold">Estado</dt>
                            <dd class="col-sm-9">
                                <asp:TextBox ID="txtEstado" runat="server" CssClass="form-control" Enabled="false" />
                            </dd>

                        </dl>

                        <div class="d-flex gap-3 mt-4">
                            <asp:Button ID="btnEliminar" runat="server"
                                Text="Eliminar"
                                CssClass="btn btn-danger btn-lg rounded-pill px-5"
                                OnClick="btnEliminar_Click" />

                            <asp:Button ID="btnCancelar" runat="server"
                                Text="Cancelar"
                                CssClass="btn btn-secondary btn-lg rounded-pill px-5"
                                OnClick="btnCancelar_Click" />
                        </div>

                    </div>

                </div>

            </div>

        </div>
    </div>
</div>

</asp:Content>