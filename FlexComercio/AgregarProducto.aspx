<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="AgregarProducto.aspx.cs" Inherits="FlexComercio.AgregarProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid mt-4" style="min-height: 100vh; background-color: #ffffff; padding: 20px;">

    <div class="row justify-content-center">

        <div class="col-md-10 col-lg-8">

            <div style="background-color: #ffffff; border-radius: 10px; padding: 30px;">

                <!-- TITULO -->
                <h2 class="mb-4"
                    style="color: #1a1a1a; border-bottom: 2px solid #32CD32; padding-bottom: 10px; font-weight: 600;">
                    <asp:Label ID="lblTitulo" runat="server" Text="Agregar Producto"></asp:Label>
                </h2>

                <!-- NOMBRE -->
                <div class="mb-3">
                    <label class="form-label" style="color: #1a1a1a; font-weight: 500;">
                        Nombre <span class="text-danger">*</span>
                    </label>

                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"
                        style="border-color: #dcdcdc; border-width: 2px;" />

                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server"
                        ControlToValidate="txtNombre"
                        ErrorMessage="Campo obligatorio"
                        CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- MARCA -->
                <div class="mb-3">
                    <label class="form-label" style="color: #1a1a1a; font-weight: 500;">
                        Marca <span class="text-danger">*</span>
                    </label>

                    <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select"
                        style="border-color: #dcdcdc; border-width: 2px;" />
                </div>

                <!-- CATEGORIA -->
                <div class="mb-3">
                    <label class="form-label" style="color: #1a1a1a; font-weight: 500;">
                        Categoria <span class="text-danger">*</span>
                    </label>

                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select"
                        style="border-color: #dcdcdc; border-width: 2px;" />
                </div>

                <!-- PROVEEDOR -->
                <div class="mb-3">
                    <label class="form-label" style="color: #1a1a1a; font-weight: 500;">
                        Proveedor <span class="text-danger">*</span>
                    </label>

                    <asp:DropDownList ID="ddlProveedor" runat="server" CssClass="form-select"
                        style="border-color: #dcdcdc; border-width: 2px;" />
                </div>

                <!-- DESCRIPCION -->
                <div class="mb-3">
                    <label class="form-label" style="color: #1a1a1a; font-weight: 500;">
                        Descripcion <span class="text-danger">*</span>
                    </label>

                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"
                        style="border-color: #dcdcdc; border-width: 2px;" />

                    <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server"
                        ControlToValidate="txtDescripcion"
                        ErrorMessage="Campo obligatorio"
                        CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- STOCK -->
                <div class="row">

                    <div class="col-md-6 mb-3">
                        <label class="form-label" style="color: #1a1a1a; font-weight: 500;">
                            Stock Actual
                        </label>

                        <asp:TextBox ID="txtStockActual"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Number"
                            min="0"
                            style="border-color: #dcdcdc; border-width: 2px;" />
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label" style="color: #1a1a1a; font-weight: 500;">
                            Stock Mínimo
                        </label>

                        <asp:TextBox ID="txtStockMinimo"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Number"
                            min="0"
                            style="border-color: #dcdcdc; border-width: 2px;" />
                    </div>

                </div>

                <!-- PRECIO Y GANANCIA -->
                <div class="row">

                    <div class="col-md-6 mb-3">
                        <label class="form-label" style="color: #1a1a1a; font-weight: 500;">
                            Precio <span class="text-danger">*</span>
                        </label>

                        <asp:TextBox
                            ID="txtPrecio"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Number"
                            min="0" />

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="txtPrecio"
                            ErrorMessage="Campo obligatorio"
                            CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label" style="color: #1a1a1a; font-weight: 500;">
                            % Ganancia
                        </label>

                        <asp:TextBox
                            ID="txtGanancia"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Number"
                            min="0" />
                    </div>

                </div>

                <!-- IMAGEN -->
                <hr />

                <h5 style="color:#1a1a1a; font-weight:600;">Imagen del producto</h5>

                <div class="row">

                    <div class="col-md-6">

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>

                                <div class="mb-3">

                                    <label class="form-label" style="color:#1a1a1a; font-weight:500;">
                                        URL Imagen
                                    </label>

                                    <asp:TextBox ID="txtUrlImagen" runat="server"
                                        CssClass="form-control"
                                        AutoPostBack="true"
                                        OnTextChanged="txtUrlImagen_TextChanged"
                                        style="border-color: #dcdcdc; border-width: 2px;" />
                                </div>

                                <asp:Button ID="btnAgregarImagen" runat="server"
                                    Text="Agregar Imagen"
                                    CssClass="btn"
                                    style="background-color:#32CD32; color:white; font-weight:600; padding:10px 20px;"
                                    OnClick="btnAgregarImagen_Click" />

                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>

                    <div class="col-md-6 text-center">

                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>

                                <asp:Image ID="imgPreview" runat="server"
                                    Width="300px"
                                    CssClass="img-thumbnail"
                                    ImageUrl="https://grupoact.com.ar/wp-content/uploads/2020/04/placeholder.png" />

                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>

                </div>

                <!-- BOTONES -->
                <div class="d-flex gap-2 mt-4">

                    <asp:Button ID="btnGuardar" runat="server"
                        Text="Guardar"
                        CssClass="btn"
                        style="background-color:#32CD32; color:white; font-weight:600; padding:10px 25px;"
                        OnClick="btnGuardar_Click" />

                    <asp:Button ID="btnCancelar" runat="server"
                        Text="Cancelar"
                        CssClass="btn"
                        CausesValidation="false"
                        PostBackUrl="~/Producto.aspx"
                        style="background-color:#f5f5f5; border:2px solid #dcdcdc; color:#1a1a1a; font-weight:500; padding:10px 25px;" />

                </div>

            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</asp:Content>
