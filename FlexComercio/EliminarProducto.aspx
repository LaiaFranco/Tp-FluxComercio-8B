<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="EliminarProducto.aspx.cs" Inherits="FlexComercio.EliminarProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid mt-4" style="min-height: 100vh; background-color: #ffffff; padding: 20px;">

    <div class="row justify-content-center">

        <div class="col-md-8 col-lg-6">

            <div style="background-color: #ffffff; border-radius: 10px; padding: 30px;">

                <!-- TITULO -->
                <h2 class="mb-4"
                    style="color: #1a1a1a; border-bottom: 2px solid #dc3545; padding-bottom: 10px; font-weight: 600;">
                    Eliminar Producto
                </h2>

                <!-- ALERTA -->
                <div class="alert alert-warning">
                    ¿Estás seguro que querés desactivar este producto?
                </div>

                <!-- NOMBRE -->
                <div class="mb-3">
                    <label class="form-label"
                        style="color: #1a1a1a; font-weight: 500;">
                        Nombre
                    </label>

                    <asp:TextBox
                        ID="txtNombre"
                        runat="server"
                        CssClass="form-control"
                        Enabled="false"
                        style="border-color: #dcdcdc; border-width: 2px;" />
                </div>

                <!-- DESCRIPCION -->
                <div class="mb-3">
                    <label class="form-label"
                        style="color: #1a1a1a; font-weight: 500;">
                        Descripción
                    </label>

                    <asp:TextBox
                        ID="txtDescripcion"
                        runat="server"
                        CssClass="form-control"
                        TextMode="MultiLine"
                        Rows="4"
                        Enabled="false"
                        style="border-color: #dcdcdc; border-width: 2px;" />
                </div>

                <!-- STOCK -->
                <div class="mb-3">
                    <label class="form-label"
                        style="color: #1a1a1a; font-weight: 500;">
                        Estado
                    </label>

                    <asp:TextBox
                        ID="txtEstado"
                        runat="server"
                        CssClass="form-control"
                        Enabled="false"
                        style="border-color: #dcdcdc; border-width: 2px;" />
                </div>

                <!-- BOTONES -->
                <div class="d-flex gap-2">

                    <asp:Button
                        ID="btnEliminar"
                        runat="server"
                        Text="Eliminar producto"
                        CssClass="btn"
                        style="background-color:#dc3545; color:white; font-weight:600; padding:10px 25px;"
                        OnClick="btnEliminar_Click" />

                    <asp:Button
                        ID="btnCancelar"
                        runat="server"
                        Text="Cancelar"
                        CssClass="btn"
                        PostBackUrl="~/Producto.aspx"
                        CausesValidation="false"
                        style="background-color:#f5f5f5; border:2px solid #dcdcdc; color:#1a1a1a; font-weight:500; padding:10px 25px;" />

                </div>

            </div>
        </div>
    </div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>
