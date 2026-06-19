<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="FormularioUsuario.aspx.cs" Inherits="FlexComercio.FormularioUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

         <div class="container mt-4">
        <h2 class="mb-3">Nuevo Usuario</h2>

        <!-- Mensaje de éxito/error -->
        <asp:Label ID="lblMensaje" runat="server" CssClass="alert alert-info w-100" Visible="false" />

        <div class="row">
            <div class="col-md-6">

                <!-- Campo Nombre -->
                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Nombre completo</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" MaxLength="255" />
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server"
                        ControlToValidate="txtNombre"
                        ErrorMessage="El nombre es obligatorio."
                        CssClass="text-danger" Display="Dynamic" />
                </div>

                <!-- Campo Email -->
                <div class="mb-3">
                    <label for="txtEmail" class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" MaxLength="255" TextMode="Email" />
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
                    <label for="txtPassword" class="form-label">Contraseña</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" MaxLength="255" TextMode="Password" />
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
                <div class="mb-3">
                    <label for="ddlRol" class="form-label">Rol</label>
                    <asp:DropDownList ID="ddlRol" runat="server" CssClass="form-select" DataTextField="nombre" DataValueField="id_rol">
                        <asp:ListItem Value="" Text="-- Seleccione --" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvRol" runat="server"
                        ControlToValidate="ddlRol"
                        InitialValue=""
                        ErrorMessage="Debe seleccionar un rol."
                        CssClass="text-danger" Display="Dynamic" />
                </div>

           
                <!-- Botón Guardar (sin OnClick, lo asignarás después) -->
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar usuario" CssClass="btn btn-primary" CausesValidation="true" OnClick="btnGuardar_Click" />

                <!-- Botón Cancelar (redirige a lista) -->
                <a href="Usuarios.aspx" class="btn btn-secondary">Cancelar</a>
            </div>
        </div>
    </div>

</asp:Content>
