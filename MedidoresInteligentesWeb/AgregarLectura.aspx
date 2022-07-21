<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="AgregarLectura.aspx.cs" Inherits="MedidoresInteligentesWeb.AgregarLectura" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <div class="row">
        <div class="col-lg-6 mx-auto">
            <div class="mensajes">
                <asp:Label runat="server" ID="mensajesLbl" CssClass="text-success"></asp:Label>
            </div>
            <div class="card">
                <div class="card-header bg-dark text-white">
                    <h3>Agregar Lectura</h3>
                </div>
                <div class="card-body">
                    <div class="form-group mb-2">
                        <label for="medidorDdl">Medidor</label>
                        <asp:DropDownList ID="medidorDdl" CssClass="form-control" runat="server">
                            
                        </asp:DropDownList>
                    </div>
                    <div class="form-group mb-2">
                        <label for="fechaCal">Fecha</label>
                        
                        <div class="form-control">
                            <asp:Calendar ID="fechaCal" CssClass="mx-auto" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" Width="350px" NextPrevFormat="FullMonth">
                                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                <NextPrevStyle Font-Size="8pt" ForeColor="#333333" Font-Bold="True" VerticalAlign="Bottom" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                <TodayDayStyle BackColor="#CCCCCC" />
                            </asp:Calendar>
                        </div>
                        
                    </div>
                    <div class="row mb-2">
                        <label for="horaTxt">Hora</label>
                        <div class="col">
                            <asp:TextBox ID="horaTxt" CssClass="form-control" type="number" runat="server" placeholder="Hora" min="0" max="23"></asp:TextBox>
                        </div>
                        <div class="col">
                            <asp:TextBox ID="minutosTxt" CssClass="form-control" type="number" runat="server" placeholder="Minutos" min="0" max="59"></asp:TextBox>
                        </div>
                        
                        <asp:RangeValidator runat="server" ID="rangeHora" ControlToValidate="horaTxt" Display="Dynamic" CssClass="text-danger" Type="Integer" MinimumValue="0" MaximumValue="23" ErrorMessage="Ingrese una hora válida" />
                        <asp:RangeValidator runat="server" ID="rangeMinutos" ControlToValidate="minutosTxt" Display="Dynamic" CssClass="text-danger" Type="Integer" MinimumValue="0" MaximumValue="59" ErrorMessage="Ingrese valor válido de minutos" />
                        <asp:RequiredFieldValidator runat="server" ID="reqHora" ControlToValidate="horaTxt" ErrorMessage="Por favor, ingrese una hora" Display="Dynamic" CssClass="text-danger" />
                        <asp:RequiredFieldValidator runat="server" ID="reqMinutos" ControlToValidate="minutosTxt" ErrorMessage="Por favor, ingrese minutos" Display="Dynamic" CssClass="text-danger" />
                    </div>
                    <div class="form-group mb-3">
                        <label for="consumoTxt">Valor de consumo</label>
                        <asp:TextBox ID="consumoTxt" CssClass="form-control" placeholder="Valor entre 0 y 600" runat="server" type="number"></asp:TextBox>
                        <asp:RangeValidator runat="server" ID="rangeConsumo" ControlToValidate="consumoTxt" Display="Dynamic" CssClass="text-danger" Type="Integer" MinimumValue="0" MaximumValue="600" ErrorMessage="Ingrese una valor válido (entre 0 y 600)" />
                        <asp:RequiredFieldValidator runat="server" ID="reqConsumo" ControlToValidate="consumoTxt" ErrorMessage="Por favor, ingrese un valor de consumo" Display="Dynamic" CssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <asp:Button runat="server" ID="ingresarBtn" OnClick="ingresarBtn_Click"
                            Text="Ingresar lectura" CssClass="btn btn-primary d-block mx-auto"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
