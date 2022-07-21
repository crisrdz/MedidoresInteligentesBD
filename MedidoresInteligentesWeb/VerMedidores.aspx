<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="VerMedidores.aspx.cs" Inherits="MedidoresInteligentesWeb.VerMedidores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="row">
        <div class="col-lg-6 mx-auto">
            <div class="card">
                <div class="card-header bg-danger text-white">
                    <h3>Ver medidores</h3>
                </div>
                <div class="card-body">
                    <div class="form-group mb-3">
                        <label for="ddlTipoMedidor">Tipo de medidor</label>
                        <asp:DropDownList AutoPostBack="true" ID="ddlTipoMedidor" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlTipoMedidor_SelectedIndexChanged">
              
                        </asp:DropDownList>
                    </div>

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>

                            <asp:GridView CssClass="table table-hover table-bordered mb-3" 
                                AutoGenerateColumns="false"
                                EmptyDataText="No hay registros"
                                runat="server" ID="grillaMedidores"
                                OnRowCommand="grillaMedidores_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="IdMedidor" HeaderText="ID" />
                                    <asp:BoundField DataField="Nombre" HeaderText="Nombre medidor" />
                                    <asp:BoundField DataField="TipoMedidor.Nombre" HeaderText="Tipo de medidor" />
                                    <asp:BoundField DataField="Usuario.Nombre" HeaderText="Usuario encargado" />
                                    <asp:TemplateField HeaderText="Acciones">
                                        <ItemTemplate>
                                            <asp:Button CssClass="btn btn-danger" runat="server"
                                                CommandName="eliminar" Text="Eliminar"
                                                CommandArgument='<%# Eval("IdMedidor") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <div class="form-group mx-auto d-flex justify-content-center">
                        <a id="ingresarBtn" href="AgregarMedidor.aspx" class="btn btn-success">
                            Ingresar medidor
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
