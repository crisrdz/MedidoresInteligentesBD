<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MedidoresInteligentesWeb.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <div class="row">
        <div class="col-lg-6 mx-auto">
            <div class="mensajes">
                <asp:Label runat="server" ID="mensajesLbl" CssClass="text-success"></asp:Label>
            </div>
            <div class="card">
                <div class="card-header bg-dark text-white">
                    <h3>Agregar Usuario</h3>
                </div>
                <div class="card-body">
                    <div class="form-group mb-3">
                        <label for="txtRut">Rut</label>
                        <asp:TextBox ID="txtRut" CssClass="form-control" runat="server" MaxLength="12"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="reqRut" ControlToValidate="txtRut" ErrorMessage="Por favor, ingrese un rut sin puntos ni guión" Display="Dynamic" CssClass="text-danger" />
                        <asp:CustomValidator runat="server" ID="customRut" ControlToValidate="txtRut" ErrorMessage="Por favor, ingrese un rut en el formato 11.111.111-1" Display="Dynamic" CssClass="text-danger" OnServerValidate="customRut_ServerValidate" />
                    </div>
                    <div class="form-group mb-3">
                        <label for="txtNombre">Nombre</label>
                        <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="reqNombre" ControlToValidate="txtNombre" ErrorMessage="Por favor, ingrese un nombre" Display="Dynamic" CssClass="text-danger" />
                    </div>
                    <div class="form-group mb-3">
                        <label for="txtContrasena">Contraseña</label>
                        <asp:TextBox ID="txtContrasena" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="reqContrasena" ControlToValidate="txtContrasena" ErrorMessage="Por favor, ingrese una contraseña" Display="Dynamic" CssClass="text-danger" />
                    </div>
                    <div class="form-group mb-3">
                        <label for="txtEmail">Correo electrónico</label>
                        <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="reqEmail" ControlToValidate="txtEmail" ErrorMessage="Por favor, ingrese un correo electrónico" Display="Dynamic" CssClass="text-danger" />
                    </div>
                    <div class="form-group ">
                        <asp:Button runat="server" ID="btnIngresar" 
                            Text="Ingresar usuario" CssClass="btn btn-primary d-block mx-auto" OnClick="btnIngresar_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
