<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="EliminarMarca.aspx.cs" Inherits="FlexComercio.EliminarMarca" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container mt-5">

        <div class="row justify-content-center">

            <div class="col-md-8 col-lg-6">

                <div class="card shadow border-0 rounded-4">

                    <div class="card-header bg-danger text-white rounded-top-4">
                        <h3 class="mb-0">Eliminar Marca</h3>
                    </div>

                    <div class="card-body p-4">

                        <div class="alert alert-warning">
                            ¿Estás seguro que querés desactivar esta marca?
                        </div>

                        
                        <!-- Nombre -->
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Nombre</label>

                            <asp:TextBox
                                ID="txtNombre"
                                runat="server"
                                CssClass="form-control"
                                Enabled="false" />
                        </div>

                        <!-- Descripción -->
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Descripción</label>

                            <asp:TextBox
                                ID="txtDescripcion"
                                runat="server"
                                CssClass="form-control"
                                TextMode="MultiLine"
                                Rows="4"
                                Enabled="false" />
                        </div>

                        <!-- Estado -->
                        <div class="mb-4">
                            <label class="form-label fw-semibold">Estado</label>

                            <asp:TextBox
                                ID="txtEstado"
                                runat="server"
                                CssClass="form-control"
                                Enabled="false" />
                        </div>

                        <!-- Botones -->
                        <div class="d-flex justify-content-end">

                            <asp:Button
                                ID="btnEliminar"
                                runat="server"
                                Text="Eliminar"
                                CssClass="btn btn-danger rounded-pill px-4" 
                                OnClick="btnEliminar_Click" />

                            <asp:Button
                                ID="btnCancelar"
                                runat="server"
                                Text="Cancelar"
                                CssClass="btn btn-outline-secondary rounded-pill px-4 ms-2"
                                PostBackUrl="~/MarcaYCategoria.aspx" 
                                OnClick="btnCancelar_Click"/>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</asp:Content>
