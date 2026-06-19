<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="AgregarProveedor.aspx.cs" Inherits="FlexComercio.AgregarProveedor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-5">

        <div class="row justify-content-center">

            <div class="col-md-8 col-lg-6">

                <div class="card shadow border-0 rounded-4">

                    <div class="card-header bg-dark text-white rounded-top-4">
                        <h3 class="mb-0">Nuevo Proveedor</h3>
                    </div>

                    <div class="card-body p-4">

                        <div class="alert alert-secondary">
                            Complete los datos del proveedor.
                        </div>

                        <!-- CUIL -->
                        <div class="mb-3">
                            <label class="form-label fw-semibold">
                                CUIL <span class="text-danger">*</span>
                            </label>

                            <asp:TextBox
                                ID="txtCuil"
                                runat="server"
                                CssClass="form-control" />

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
                                ErrorMessage="Campo obligatorio"
                                ControlToValidate="txtNombre"
                                CssClass="text-danger"
                                Display="Dynamic" />
                        </div>

                        <!-- Email -->
                        <div class="mb-3">
                            <label class="form-label fw-semibold">
                                Email <span class="text-danger">*</span>
                            </label>

                            <asp:TextBox
                                ID="txtEmail"
                                runat="server"
                                CssClass="form-control" />

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
                            <label class="form-label fw-semibold">
                                Teléfono <span class="text-danger">*</span>
                            </label>

                            <asp:TextBox
                                ID="txtTelefono"
                                runat="server"
                                CssClass="form-control" />

                            <asp:RequiredFieldValidator
                                ID="rfvTelefono"
                                runat="server"
                                ErrorMessage="Campo obligatorio"
                                ControlToValidate="txtTelefono"
                                CssClass="text-danger"
                                Display="Dynamic" />
                        </div>

                        <!-- Dirección -->
                        <div class="mb-4">
                            <label class="form-label fw-semibold">Dirección</label>

                            <asp:TextBox
                                ID="txtDireccion"
                                runat="server"
                                CssClass="form-control" />
                        </div>

                        <asp:Label
                            ID="lblMensaje"
                            runat="server"
                            CssClass="text-danger d-block mb-3" />

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
                                ID="btnAceptar"
                                runat="server"
                                Text="Aceptar"
                                CssClass="btn btn-dark rounded-pill px-4"
                                OnClick="btnAceptar_Click" />

                            <asp:Button
                                ID="btnCancelar"
                                runat="server"
                                Text="Cancelar"
                                CssClass="btn btn-outline-secondary rounded-pill px-4 ms-2"
                                OnClick="btnCancelar_Click"
                                CausesValidation="false" />

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</asp:Content>