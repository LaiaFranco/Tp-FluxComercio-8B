<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="AgregarProveedor.aspx.cs" Inherits="FlexComercio.AgregarProveedor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid py-4">

    <div class="mb-4">
        <h1 class="fw-bold mb-1">Nuevo Proveedor</h1>
        <p class="text-secondary fs-4 mb-0">Carga de datos del proveedor</p>
    </div>

    <div class="card border-0 shadow-sm rounded-4">
        <div class="card-body p-4">

            <div class="mb-3">
              <!-- cuil -->
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

            <div class="mb-3">
                <!-- Nombre -->
                
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

            <div class="mb-3">
               <!-- Email -->
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

            <div class="mb-3">
                
                 <label class="form-label fw-semibold">
                     Telefono <span class="text-danger">*</span>
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

            <div class="mb-3">
                <label class="form-label">Dirección</label>
                <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <asp:Label ID="lblMensaje" 
                runat="server" 
                CssClass="text-danger d-block mb-3"></asp:Label>

            <asp:Button ID="btnAceptar" 
                runat="server" Text="Aceptar" 
                CssClass="btn btn-dark" 
                OnClick="btnAceptar_Click" />

            <asp:Button ID="btnCancelar" 
                runat="server" 
                Text="Cancelar" 
                CssClass="btn btn-secondary ms-2" 
                OnClick="btnCancelar_Click" 
                CausesValidation="false"/>

        </div>
    </div>

</div>

</asp:Content>