<%@ Page Title="Usuarios" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="FlexComercio.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .table-actions .btn {
            margin-right: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2>Gestión de Usuarios</h2>
        <div class="mb-3 text-end">
            <asp:Button ID="btnNuevo" runat="server" Text="Nuevo Usuario" CssClass="btn btn-primary" OnClick="btnNuevo_Click" />
        </div>
        <div class="table-responsive">
            <asp:GridView ID="gvUsuarios" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover"
               >
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Password" HeaderText="Contraseña" HtmlEncode="false" />
                    <asp:BoundField DataField="Rol.Nombre" HeaderText="Rol" />
                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-sm btn-warning"
                                CommandName="Modificar" CommandArgument='<%# Eval("Id") %>'  OnClick="btnModificar_Click"/>
                            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-sm btn-danger"
                                CommandName="Eliminar" CommandArgument='<%# Eval("Id") %>'
                                OnClick="btnEliminar_Click"   />
                        </ItemTemplate>
                        <ItemStyle CssClass="table-actions" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>