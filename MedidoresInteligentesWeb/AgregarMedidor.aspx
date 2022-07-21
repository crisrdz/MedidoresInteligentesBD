<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="AgregarMedidor.aspx.cs" Inherits="MedidoresInteligentesWeb.AgregarMedidor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <div class="row">
        <div class="col-lg-6 mx-auto">
            <div class="mensajes">
                <asp:Label runat="server" ID="mensajesLbl" CssClass="text-success"></asp:Label>
            </div>
            <div class="card">
                <div class="card-header bg-dark text-white">
                    <h3>Agregar Medidor</h3>
                </div>
                <div class="card-body">
                    <div class="form-group mb-3">
                        <label for="txtNombre">Nombre</label>
                        <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="reqNombre" ControlToValidate="txtNombre" ErrorMessage="Por favor, ingrese un nombre" Display="Dynamic" CssClass="text-danger" />
                    </div>
                     <div class="form-group mb-3">
                        <label for="rblTipo">Tipo</label>
                        <asp:RadioButtonList runat="server" ID="rblTipo">

                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator runat="server" ID="reqTipo" ControlToValidate="rblTipo" ErrorMessage="Por favor, seleccione un tipo de medidor" Display="Dynamic" CssClass="text-danger" />
                    </div>
                    <div class="form-group mb-3">
                        <label for="ddlUsuario">Usuario encargado</label>
                        <asp:DropDownList AutoPostBack="true" ID="ddlUsuario" CssClass="form-control" runat="server">
                            
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="reqUsuario" ControlToValidate="ddlUsuario" ErrorMessage="Por favor, cree un usuario para seleccionarlo" Display="Dynamic" CssClass="text-danger" />
                    </div>
                    <div class="form-group ">
                        <asp:Button runat="server" ID="btnIngresar" OnClick="btnIngresar_Click" 
                            Text="Ingresar medidor" CssClass="btn btn-primary d-block mx-auto"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
