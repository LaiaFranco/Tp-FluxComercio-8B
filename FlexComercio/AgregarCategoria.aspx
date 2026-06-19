<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="AgregarCategoria.aspx.cs" Inherits="FlexComercio.AgregarCategoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container mt-5">

        <div class="row justify-content-center">

            <div class="col-md-8 col-lg-6">

                <div class="card shadow border-0 rounded-4">

                    <div class="card-header bg-success text-white rounded-top-4">
                        <h3 class="mb-0">
                            <asp:Label ID="lblTitulo" runat="server" Text="Agregar Categoría"></asp:Label>
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

                        <!-- Estado -->
                        <asp:Panel ID="pnlEstado" runat="server">
                            <div class="mb-4">
                                <label class="form-label fw-semibold">
                                    Estado
                                </label>

                                <asp:DropDownList
                                    ID="ddlEstado"
                                    runat="server"
                                    CssClass="form-select">

                                    <asp:ListItem Text="Activo" Value="true" Selected="True" />
                                    <asp:ListItem Text="Inactivo" Value="false" />

                                </asp:DropDownList>
                            </div>
                        </asp:Panel>

                             <!-- ETIQUETA ERROR -->
                               

                                <asp:Label
                                    ID="lblError"
                                    runat="server"
                                    CssClass="text-danger"
                                    Visible="false">
                                </asp:Label>

                        <!-- Botones -->
                        <div class="d-flex justify-content-end">

                            <asp:Button
                                ID="btnGuardar"
                                runat="server"
                                Text="Guardar"
                                CssClass="btn btn-success rounded-pill px-4"
                                OnClick="btnGuardar_Click" />

                            <asp:Button
                                ID="btnCancelar"
                                runat="server"
                                Text="Cancelar"
                                CssClass="btn btn-outline-secondary rounded-pill px-4 ms-2"
                                PostBackUrl="~/MarcaYCategoria.aspx"
                                CausesValidation="false" />

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</asp:Content>
