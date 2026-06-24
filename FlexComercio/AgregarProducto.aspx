<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="AgregarProducto.aspx.cs" Inherits="FlexComercio.AgregarProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">

    <div class="row justify-content-center">

        <div class="col-md-10">

            <div class="card shadow border-0 rounded-4">

                <div class="card-header bg-success text-white rounded-top-4">
                    <h3 class="mb-0">
                        <asp:Label ID="lblTitulo" runat="server" Text="Agregar Producto"></asp:Label>
                    </h3>
                </div>
                <div class="card-body p-4">

                    <!-- Nombre -->
                    <div class="mb-3">
                        <label class="form-label fw-semibold">
                            Nombre <span class="text-danger">*</span>
                        </label>

                         <asp:TextBox
                             ID="txtNombre"
                             runat="server"
                             CssClass="form-control" />

                         <asp:RequiredFieldValidator
                             ID="rfvNombre"
                             runat="server"
                             ControlToValidate="txtNombre"
                             ErrorMessage="Campo obligatorio"
                             CssClass="text-danger"
                             Display="Dynamic" />
                       </div>

                    <!-- Marca -->
                    <div class="mb-3">
                        <label class="form-label fw-semibold">
                            Marca <span class="text-danger">*</span>
                        </label>

                        <asp:DropDownList
                            ID="ddlMarca"
                            runat="server"
                            CssClass="form-select">
                        </asp:DropDownList>
                    </div>

                    <!-- Categoría -->
                    <div class="mb-3">
                        <label class="form-label fw-semibold">
                            Categoria <span class="text-danger">*</span>
                        </label>

                        <asp:DropDownList
                            ID="ddlCategoria"
                            runat="server"
                            CssClass="form-select">
                        </asp:DropDownList>
                    </div>

                    <!-- Proveedor -->
                    <div class="mb-3">
                        <label class="form-label fw-semibold">
                            Proveedor <span class="text-danger">*</span>
                        </label>

                        <asp:DropDownList
                            ID="ddlProveedor"
                            runat="server"
                            CssClass="form-select">
                        </asp:DropDownList>
                    </div>

                    <!-- Descripción -->
                    <div class="mb-3">
                         <label class="form-label fw-semibold">
                             Descripcion <span class="text-danger">*</span>
                         </label>

                          <asp:TextBox
                              ID="txtDescripcion"
                              runat="server"
                              CssClass="form-control" />

                          <asp:RequiredFieldValidator
                              ID="rfvDescripcion"
                              runat="server"
                              ControlToValidate="txtDescripcion"
                              ErrorMessage="Campo obligatorio"
                              CssClass="text-danger"
                              Display="Dynamic" />
                        </div>

                    <div class="row">

                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-semibold">
                                Stock Actual
                            </label>

                            <asp:TextBox
                                ID="txtStockActual"
                                runat="server"
                                CssClass="form-control"
                                TextMode="Number" />
                        </div>

                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-semibold">
                                Stock Mínimo
                            </label>

                            <asp:TextBox
                                ID="txtStockMinimo"
                                runat="server"
                                CssClass="form-control"
                                TextMode="Number" />
                        </div>

                    </div>

                    <div class="row">

                        <div class="col-md-6 mb-3">

                            <label class="form-label fw-semibold">
                                Precio <span class="text-danger">*</span>
                            </label>

                             <asp:TextBox
                                 ID="txtPrecio"
                                 runat="server"
                                 CssClass="form-control" 
                                 TextMode="Number"/>

                             <asp:RequiredFieldValidator
                                 ID="RequiredFieldValidator1"
                                 runat="server"
                                 ControlToValidate="txtPrecio"
                                 ErrorMessage="Campo obligatorio"
                                 CssClass="text-danger"
                                 Display="Dynamic" />
                        </div>

                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-semibold">
                                % Ganancia
                            </label>

                            <asp:TextBox
                                ID="txtGanancia"
                                runat="server"
                                CssClass="form-control"
                                TextMode="Number" />
                        </div>

                    </div>

                    <!-- Imágenes -->
                     <asp:ScriptManager ID="ScriptManager1" runat="server" />

                        <hr />

                        <h5>Imagen del producto</h5>

                        <div class="row">

                            <div class="col-md-6">

                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                                    <ContentTemplate>

                                        <div class="mb-3">

                                            <label for="txtUrlImagen" class="form-label">
                                                URL Imagen
                                            </label>

                                            <asp:TextBox
                                                ID="txtUrlImagen"
                                                runat="server"
                                                CssClass="form-control"
                                                AutoPostBack="true"
                                                OnTextChanged="txtUrlImagen_TextChanged">
                                            </asp:TextBox>

                                        </div>

                                        <asp:Button
                                            ID="btnAgregarImagen"
                                            runat="server"
                                            Text="Agregar Imagen"
                                            CssClass="btn btn-primary"
                                            OnClick="btnAgregarImagen_Click" />

                                    </ContentTemplate>

                                </asp:UpdatePanel>

                            </div>

                            <div class="col-md-6 text-center">

                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">

                                    <ContentTemplate>

                                        <asp:Image
                                            ID="imgPreview"
                                            runat="server"
                                            Width="300px"
                                            CssClass="img-thumbnail"
                                            ImageUrl="https://grupoact.com.ar/wp-content/uploads/2020/04/placeholder.png" />

                                    </ContentTemplate>

                                </asp:UpdatePanel>

                            </div>

                        </div>

                    <!-- Estado -->
                    <asp:Panel ID="pnlEstado" runat="server">

                        <div class="mb-4 mt-3">

                            <label class="form-label fw-semibold">
                                Estado
                            </label>

                            <asp:DropDownList
                                ID="ddlEstado"
                                runat="server"
                                CssClass="form-select">

                                <asp:ListItem Text="Activo"
                                    Value="true"
                                    Selected="True" />

                                <asp:ListItem Text="Inactivo"
                                    Value="false" />

                            </asp:DropDownList>

                        </div>

                    </asp:Panel>

                    <!-- Botones -->
                    <div class="d-flex justify-content-end">

                        <asp:Button
                            ID="btnGuardar"
                            runat="server"
                            Text="Guardar"
                            CssClass="btn btn-primary rounded-pill px-4"
                            OnClick="btnGuardar_Click" />

                        <asp:Button
                            ID="btnCancelar"
                            runat="server"
                            Text="Cancelar"
                            CssClass="btn btn-outline-secondary rounded-pill px-4 ms-2"
                            PostBackUrl="~/Producto.aspx" 
                            CausesValidation="false"/>
                    </div>
                </div>
            </div>
        </div>
    </div> 
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</asp:Content>
