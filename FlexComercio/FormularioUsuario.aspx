<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="FormularioUsuario.aspx.cs" Inherits="FlexComercio.FormularioUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid mt-4" style="min-height: 100vh; background-color: #ffffff; padding: 20px;">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div style="background-color: #ffffff; border-radius: 10px; padding: 30px;">
                <h2 class="mb-4" style="color: #1a1a1a; border-bottom: 2px solid #32CD32; padding-bottom: 10px; font-weight: 600;">Nuevo Usuario</h2>

                <!-- Mensaje de éxito/error -->
                <asp:Label ID="lblMensaje" runat="server" CssClass="alert alert-info w-100" Visible="false" />

                <!-- Campo Nombre -->
                <div class="mb-3">
                    <label for="txtNombre" class="form-label" style="color: #1a1a1a; font-weight: 500;">Nombre completo</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" MaxLength="255" style="border-color: #dcdcdc; border-width: 2px;" />
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server"
                        ControlToValidate="txtNombre"
                        ErrorMessage="El nombre es obligatorio."
                        CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- Campo Email -->
                <div class="mb-3">
                    <label for="txtEmail" class="form-label" style="color: #1a1a1a; font-weight: 500;">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" MaxLength="255" TextMode="Email" style="border-color: #dcdcdc; border-width: 2px;" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="El email es obligatorio."
                        CssClass="text-danger" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w+$"
                        ErrorMessage="Formato de email inválido."
                        CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- Campo Contraseña -->
                <div class="mb-3">
                    <asp:Label ID="lblPassword" runat="server" CssClass="form-label" Text="Contraseña" style="color: #1a1a1a; font-weight: 500;" />
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" MaxLength="255" TextMode="Password" style="border-color: #dcdcdc; border-width: 2px;" />
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                        ControlToValidate="txtPassword"
                        ErrorMessage="La contraseña es obligatoria."
                        CssClass="text-danger" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revPassword" runat="server"
                        ControlToValidate="txtPassword"
                        ValidationExpression="^.{6,}$"
                        ErrorMessage="La contraseña debe tener al menos 6 caracteres."
                        CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- Campo Rol -->
                <div class="mb-4">
                    <label for="ddlRol" class="form-label" style="color: #1a1a1a; font-weight: 500;">Rol</label>
                    <asp:DropDownList ID="ddlRol" runat="server" CssClass="form-select" DataTextField="nombre" DataValueField="id_rol" style="border-color: #dcdcdc; border-width: 2px;">
                        <asp:ListItem Value="" Text="-- Seleccione --" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvRol" runat="server"
                        ControlToValidate="ddlRol"
                        InitialValue=""
                        ErrorMessage="Debe seleccionar un rol."
                        CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- Botones -->
                <div class="d-flex gap-2">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar usuario" CssClass="btn" style="background-color: #32CD32; color: #ffffff; border: none; padding: 10px 25px; font-weight: 600; transition: all 0.3s;" CausesValidation="true" OnClick="btnGuardar_Click" onmouseover="this.style.backgroundColor='#28a428'" onmouseout="this.style.backgroundColor='#32CD32'" />
                    <a href="Usuarios.aspx" class="btn" style="background-color: #f5f5f5; color: #1a1a1a; border: 2px solid #dcdcdc; padding: 10px 25px; font-weight: 500; transition: all 0.3s;" onmouseover="this.style.borderColor='#32CD32'" onmouseout="this.style.borderColor='#dcdcdc'">Cancelar</a>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
