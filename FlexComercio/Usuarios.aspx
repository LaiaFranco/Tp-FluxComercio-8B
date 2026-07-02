<%@ Page Title="Usuarios" Language="C#" MasterPageFile="~/General.Master"
    AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs"
    Inherits="FlexComercio.Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid py-4">

        <div class="d-flex justify-content-between align-items-center mb-4">

            <div>
                <h2 class="fw-bold mb-0">Gestión de Usuarios</h2>
                <p class="text-secondary mb-0">Administración del sistema</p>
            </div>

            <asp:Button ID="btnNuevo"
                runat="server"
                Text="Nuevo Usuario"
                CssClass="btn btn-dark btn-lg px-4 py-3 rounded-4"
                OnClick="btnNuevo_Click" />

        </div>

        <div class="card shadow-sm border-0 rounded-4">

            <!-- Buscador -->
            <div class="card-header bg-white border-bottom p-4">
                <div class="input-group">

                    <span class="input-group-text bg-white border-end-0 rounded-start-4">
                        <i class="bi bi-search text-secondary fs-4"></i>
                    </span>

                    <asp:TextBox ID="txtBuscar"
                        runat="server"
                        CssClass="form-control border-start-0 rounded-end-4 py-3"
                        placeholder="Buscar usuario por Nombre, Email o rol"
                        AutoPostBack="true"
                        OnTextChanged="txtBuscar_TextChanged" />

                </div>
            </div>

            <div class="container-fluid mt-4">

                <asp:GridView ID="gvUsuarios"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="table border-0"
                    DataKeyNames="Id">

                    <Columns>

                        <asp:TemplateField>

                            <ItemTemplate>

                                <div class="card usuario-card rounded-4 mb-4 p-3">

                                    <div class="row align-items-center">

                                        <div class="col-md-2 text-center">
                                            <div class="bg-light rounded-4 p-4 d-inline-block">
                                                <i class="bi bi-person-circle fs-1"></i>
                                            </div>
                                        </div>

                                        <div class="col-md-7">

                                            <h3 class="fw-bold mb-2">
                                                <%# Eval("Nombre") %>
                                            </h3>

                                            <p class="mb-1"><strong>ID:</strong> <%# Eval("Id") %></p>
                                            <p class="mb-1"><strong>Email:</strong> <%# Eval("Email") %></p>
                                            <p class="mb-1"><strong>Contraseña:</strong> <%# Eval("Password") %></p>
                                            <p class="mb-1"><strong>Rol:</strong> <%# Eval("Rol.Nombre") %></p>

                                        </div>

                                        <div class="col-md-3 text-end">

                                            <asp:Button ID="btnModificar"
                                                runat="server"
                                                Text="Modificar"
                                                CssClass="btn btn-warning btn-sm"
                                                CommandArgument='<%# Eval("Id") %>'
                                                OnClick="btnModificar_Click" />

                                            <asp:Button ID="btnEliminar"
                                                runat="server"
                                                Text="Eliminar"
                                                CssClass="btn btn-danger btn-sm"
                                                CommandArgument='<%# Eval("Id") %>'
                                                OnClick="btnEliminar_Click" />

                                        </div>

                                    </div>

                                </div>

                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </div>

        </div>

    </div>
    <style>
    /* Sombra más suave al hacer hover */
    .card {
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }
    .card:hover {
        transform: translateY(-2px);
        box-shadow: 0 1rem 3rem rgba(0,0,0,.175) !important;
    }
    /* Badges con mejor legibilidad */
    .badge.bg-light {
        font-weight: 400;
        font-size: 0.95rem;
        border: 1px solid #dee2e6;
        border-radius: 0.5rem !important;
    }
    /* Iconos dentro de badges */
    .badge i {
        font-size: 1.1rem;
    }
    /* Botones más atractivos */
    .btn-outline-danger, .btn-outline-warning {
        border-width: 2px;
        font-weight: 600;
    }
    .btn-outline-danger:hover, .btn-outline-warning:hover {
        transform: scale(1.02);
        transition: all 0.15s ease;
    }
</style>
    <style>
        .usuario-card {
            transition: 0.2s;
        }

        .usuario-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 1rem 2rem rgba(0,0,0,.15);
        }
    </style>

</asp:Content>
