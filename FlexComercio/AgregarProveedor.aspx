<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="AgregarProveedor.aspx.cs" Inherits="FlexComercio.AgregarProveedor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid mt-4" style="min-height: 100vh; background-color: #ffffff; padding: 20px;">

    <div class="row justify-content-center">

        <div class="col-md-10 col-lg-8">

            <div style="background-color:#ffffff; border-radius:10px; padding:30px;">

                <!-- TITULO -->
               <h2 class="mb-4"
                    style="color:#1a1a1a; border-bottom:2px solid #32CD32; padding-bottom:10px; font-weight:600;">

                    <asp:Label ID="lblTitulo" runat="server" Text="Nuevo Proveedor"></asp:Label>

                </h2>

                <!-- CUIL -->
                <div class="mb-3">
                    <label class="form-label" style="color:#1a1a1a; font-weight:500;">
                        CUIL <span class="text-danger">*</span>
                    </label>

                    <asp:TextBox
                        ID="txtCuil"
                        runat="server"
                        CssClass="form-control"
                        style="border-color:#dcdcdc; border-width:2px;" />

                    <asp:RequiredFieldValidator
                        ID="rfvCuil"
                        runat="server"
                        ErrorMessage="Campo obligatorio"
                        ControlToValidate="txtCuil"
                        CssClass="text-danger"
                        Display="Dynamic" />
                </div>

                <!-- Nombre -->
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
                        ErrorMessage="Campo obligatorio"
                        ControlToValidate="txtNombre"
                        CssClass="text-danger"
                        Display="Dynamic" />
                </div>

                <!-- Email -->
                <div class="mb-3">
                    <label class="form-label" style="color:#1a1a1a; font-weight:500;">
                        Email <span class="text-danger">*</span>
                    </label>

                    <asp:TextBox
                        ID="txtEmail"
                        runat="server"
                        CssClass="form-control"
                        style="border-color:#dcdcdc; border-width:2px;" />

                    <asp:RequiredFieldValidator
                        ID="rfvEmail"
                        runat="server"
                        ErrorMessage="Campo obligatorio"
                        ControlToValidate="txtEmail"
                        CssClass="text-danger"
                        Display="Dynamic" />
                </div>

                <!-- Teléfono -->
                <div class="mb-3">
                    <label class="form-label" style="color:#1a1a1a; font-weight:500;">
                        Teléfono <span class="text-danger">*</span>
                    </label>

                    <asp:TextBox
                        ID="txtTelefono"
                        runat="server"
                        CssClass="form-control"
                        style="border-color:#dcdcdc; border-width:2px;" />

                    <asp:RequiredFieldValidator
                        ID="rfvTelefono"
                        runat="server"
                        ErrorMessage="Campo obligatorio"
                        ControlToValidate="txtTelefono"
                        CssClass="text-danger"
                        Display="Dynamic" />
                </div>

                <!-- Dirección -->
                <div class="mb-3">
                    <label class="form-label" style="color:#1a1a1a; font-weight:500;">
                        Dirección
                    </label>

                    <asp:TextBox
                        ID="txtDireccion"
                        runat="server"
                        CssClass="form-control"
                        style="border-color:#dcdcdc; border-width:2px;" />
                </div>

                <!-- Mensajes -->
                <asp:Label
                    ID="lblMensaje"
                    runat="server"
                    CssClass="text-danger d-block mb-3" />

                <asp:Label
                    ID="lblError"
                    runat="server"
                    CssClass="text-danger"
                    Visible="false">
                </asp:Label>

                <!-- BOTONES -->
                <div class="d-flex gap-2 mt-4">

                    <asp:Button
                        ID="btnAceptar"
                        runat="server"
                        Text="Aceptar"
                        CssClass="btn"
                        style="background-color:#32CD32; color:white; font-weight:600; padding:10px 25px;"
                        OnClick="btnAceptar_Click" />

                    <asp:Button
                        ID="btnCancelar"
                        runat="server"
                        Text="Cancelar"
                        CssClass="btn"
                        style="background-color:#f5f5f5; border:2px solid #dcdcdc; color:#1a1a1a; font-weight:500; padding:10px 25px;"
                        OnClick="btnCancelar_Click"
                        CausesValidation="false" />

                </div>

            </div>

        </div>

    </div>

</div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>