<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="AgregarMarca.aspx.cs" Inherits="FlexComercio.AgregarMarca" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">

        <div class="row justify-content-center">

            <div class="col-md-8 col-lg-6">

                <div class="card shadow border-0 rounded-4">

                    <div class="card-header bg-success text-white rounded-top-4">
                        <h3 class="mb-0">
                            <asp:Label ID="lblTitulo" runat="server" Text="Agregar Marca"></asp:Label>
                        </h3>
                    </div>

                    <div class="card-body p-4">

                        <!-- Nombre -->
                        <div class="mb-3">

                            <label class="form-label fw-semibold">
                                Nombre
                            </label>

                            <asp:TextBox
                                ID="txtNombre"
                                runat="server"
                                CssClass="form-control" />

                        </div>

                        <!-- Descripción -->
                        <div class="mb-3">

                            <label class="form-label fw-semibold">
                                Descripción
                            </label>

                            <asp:TextBox
                                ID="txtDescripcion"
                                runat="server"
                                CssClass="form-control"
                                TextMode="MultiLine"
                                Rows="4" />

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

                        <!-- Botones -->
                        <div class="d-flex justify-content-end">

                            <asp:Button
                                ID="btnGuardar"
                                runat="server"
                                Text="Guardar"
                                CssClass="btn btn-success rounded-pill px-4"
                                OnClick="btnGuardar_Click"/>

                            <asp:Button
                                ID="btnCancelar"
                                runat="server"
                                Text="Cancelar"
                                CssClass="btn btn-outline-secondary rounded-pill px-4 ms-2"
                                PostBackUrl="~/MarcaYCategoria.aspx" />
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>
