<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="VerLecturas.aspx.cs" Inherits="MedidoresInteligentesWeb.VerLecturas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="row">
        <div class="col-lg-6 mx-auto">
            <div class="card">
                <div class="card-header bg-danger text-white">
                    <h3>Ver lecturas</h3>
                </div>
                <div class="card-body">
                    <div class="form-group mb-3">
                        <label for="medidorDdl">Medidor</label>
                        <asp:DropDownList AutoPostBack="true" ID="medidorDdl" CssClass="form-control" runat="server" OnSelectedIndexChanged="medidorDdl_SelectedIndexChanged">
              
                        </asp:DropDownList>
                    </div>

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>

                            <asp:GridView CssClass="table table-hover table-bordered mb-3" 
                                AutoGenerateColumns="false"
                                runat="server" ID="grillaLecturas"
                                OnRowCommand="grillaLecturas_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="Medidor.Nombre" HeaderText="Medidor" />
                                    <asp:BoundField DataField="FechaLectura" HeaderText="Fecha lectura" />
                                    <asp:BoundField DataField="Consumo" HeaderText="Consumo" />
                                    <asp:TemplateField HeaderText="Acciones">
                                        <ItemTemplate>
                                            <asp:Button CssClass="btn btn-danger" runat="server"
                                                CommandName="eliminar" Text="Eliminar"
                                                CommandArgument='<%# Eval("IdLectura") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                    <div class="form-group mx-auto d-flex justify-content-center">
                        <a id="ingresarBtn" href="AgregarLectura.aspx" class="btn btn-success">
                            Ingresar lectura
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
