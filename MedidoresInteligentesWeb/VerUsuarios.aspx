<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="VerUsuarios.aspx.cs" Inherits="MedidoresInteligentesWeb.VerUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="row">
        <div class="col-lg-6 mx-auto">
            <div class="card">
                <div class="card-header bg-danger text-white">
                    <h3>Ver usuarios</h3>
                </div>
                <div class="card-body">

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>

                            <asp:GridView CssClass="table table-hover table-bordered mb-3" 
                                AutoGenerateColumns="false"
                                EmptyDataText="No hay registros"
                                runat="server" ID="grillaUsuarios"
                                OnRowCommand="grillaUsuarios_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="Rut" HeaderText="Rut" />
                                    <asp:BoundField DataField="Nombre" HeaderText="Nombre usuario" />
                                    <asp:BoundField DataField="Email" HeaderText="Correo electrónico" />
                                    <asp:TemplateField HeaderText="Acciones">
                                        <ItemTemplate>
                                            <asp:Button CssClass="btn btn-danger" runat="server"
                                                CommandName="eliminar" Text="Eliminar"
                                                CommandArgument='<%# Eval("IdUsuario") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                    

                    <div class="form-group mx-auto d-flex justify-content-center">
                        <a id="btnIngresar" href="Default.aspx" class="btn btn-success">
                            Ingresar usuario
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
