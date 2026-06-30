<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="AgregarMarca.aspx.cs" Inherits="FlexComercio.AgregarMarca" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <div class="container-fluid mt-4" style="min-height: 100vh; background-color:#ffffff; padding:20px;">

    <div class="row justify-content-center">

        <div class="col-md-10 col-lg-8">

            <div style="background-color:#ffffff; border-radius:10px; padding:30px;">

                <!-- TITULO -->
                <h2 class="mb-4"
                    style="color:#1a1a1a; border-bottom:2px solid #32CD32; padding-bottom:10px; font-weight:600;">

                    <asp:Label ID="lblTitulo" runat="server" Text="Agregar Marca"></asp:Label>

                </h2>

                <!-- NOMBRE -->
                <div class="mb-3">

                    <label class="form-label" style="color:#1a1a1a; font-weight:500;">
                        Nombre <span class="text-danger">*</span>
                    </label>

                    <asp:TextBox
                        ID="txtNombre"
                        runat="server"
                        CssClass="form-control"
                        style="border-color:#dcdcdc; border-width:2px;" />

                    <asp:RequiredFieldValidator
                        ID="rfvNombre"
                        runat="server"
                        ControlToValidate="txtNombre"
                        ErrorMessage="Campo obligatorio"
                        CssClass="text-danger"
                        Display="Dynamic" />

                </div>

                <!-- DESCRIPCION -->
                <div class="mb-3">

                    <label class="form-label" style="color:#1a1a1a; font-weight:500;">
                        Descripción <span class="text-danger">*</span>
                    </label>

                    <asp:TextBox
                        ID="txtDescripcion"
                        runat="server"
                        CssClass="form-control"
                        style="border-color:#dcdcdc; border-width:2px;" />

                    <asp:RequiredFieldValidator
                        ID="rfvDescripcion"
                        runat="server"
                        ControlToValidate="txtDescripcion"
                        ErrorMessage="Campo obligatorio"
                        CssClass="text-danger"
                        Display="Dynamic" />

                </div>

                <!-- ESTADO -->
                <asp:Panel ID="pnlEstado" runat="server">

                    <div class="mb-3">

                        <label class="form-label" style="color:#1a1a1a; font-weight:500;">
                            Estado
                        </label>

                        <asp:DropDownList
                            ID="ddlEstado"
                            runat="server"
                            CssClass="form-select"
                            style="border-color:#dcdcdc; border-width:2px;">

                            <asp:ListItem Text="Activo" Value="true" Selected="True" />
                            <asp:ListItem Text="Inactivo" Value="false" />

                        </asp:DropDownList>

                    </div>

                </asp:Panel>

                <!-- ERROR -->
                <asp:Label
                    ID="lblError"
                    runat="server"
                    CssClass="text-danger"
                    Visible="false">
                </asp:Label>

                <!-- BOTONES -->
                <div class="d-flex gap-2 mt-4">

                    <asp:Button
                        ID="btnGuardar"
                        runat="server"
                        Text="Guardar"
                        CssClass="btn"
                        style="background-color:#32CD32; color:white; font-weight:600; padding:10px 25px;"
                        OnClick="btnGuardar_Click" />

                    <asp:Button
                        ID="btnCancelar"
                        runat="server"
                        Text="Cancelar"
                        CssClass="btn"
                        style="background-color:#f5f5f5; border:2px solid #dcdcdc; color:#1a1a1a; font-weight:500; padding:10px 25px;"
                        PostBackUrl="~/MarcaYCategoria.aspx"
                        CausesValidation="false" />

                </div>

            </div>

        </div>

    </div>

</div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>
