<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="EliminarCategoria.aspx.cs" Inherits="FlexComercio.EliminarCategoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-7">

            <div class="card p-4 border-0 shadow-sm">

                <h3 class="text-danger mb-3">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>Eliminar Categoría
                </h3>

                <p class="fs-5">
                    ¿Estás seguro de que deseas eliminar esta categoría?
                </p>

                <hr />

                <dl class="row mt-3">

                    <dt class="col-sm-3 fw-bold">Nombre</dt>
                    <dd class="col-sm-9">
                        <asp:TextBox
                            ID="txtNombre"
                            runat="server"
                            CssClass="form-control"
                            Enabled="false" />
                    </dd>

                    <dt class="col-sm-3 fw-bold">Descripción</dt>
                    <dd class="col-sm-9">
                        <asp:TextBox
                            ID="txtDescripcion"
                            runat="server"
                            CssClass="form-control"
                            TextMode="MultiLine"
                            Rows="3"
                            Enabled="false" />
                    </dd>

                    <dt class="col-sm-3 fw-bold">Estado</dt>
                    <dd class="col-sm-9">
                        <asp:TextBox
                            ID="txtEstado"
                            runat="server"
                            CssClass="form-control"
                            Enabled="false" />
                    </dd>

                </dl>

                <div class="d-flex gap-3 mt-4">

                    <asp:Button
                        ID="btnEliminar"
                        runat="server"
                        Text="Eliminar"
                        CssClass="btn btn-danger btn-lg rounded-pill px-5"
                        OnClick="btnEliminar_Click" />

                    <asp:Button
                        ID="btnCancelar"
                        runat="server"
                        Text="Cancelar"
                        CssClass="btn btn-secondary btn-lg rounded-pill px-5"
                        PostBackUrl="~/MarcaYCategoria.aspx"
                        OnClick="btnCancelar_Click" />

                </div>

            </div>

        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>
