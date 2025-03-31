<%@ Page Language="VB" AutoEventWireup="false" CodeFile="cntrlAlmacenaje.aspx.vb" Inherits="App_Controls_cntrlAlmacenaje" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Styles.css" rel="stylesheet" />
    <title></title>
</head>
<body style="padding: 5px;">
    <form id="form1" runat="server">
        <div style="display: -ms-flexbox; display: flex; -ms-flex-wrap: wrap; flex-wrap: wrap;">
            <div style="width: 50%">
                <p style="padding-left: 4%; color: #FFF">
                    Seleccionar mes:&nbsp;
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsFechasAb" DataTextField="DisplayDate" DataValueField="M" AutoPostBack="True" CssClass="dropdown">
    </asp:DropDownList>
                    <asp:SqlDataSource ID="dsFechasAb" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT * FROM [vFechasAb] ORDER BY [M] DESC"></asp:SqlDataSource>

                </p>
            </div>
            <div style="width: 48%; text-align: right; padding-top: 15px;">
                <asp:LinkButton class="btn" ID="lnbExp" runat="server">Exportar a Excel</asp:LinkButton>
            </div>
        </div>
        <div style="margin-left: 1vw; margin-right: 1vw; max-width: 98vw; overflow-x: scroll; background-color: #FFF; border-radius: 8px; height: 80vh;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Operacion" CssClass="gridView" Style="width: 100vw; padding-left: 10px; padding-right: 10px; margin: auto; width: 96%" AllowPaging="True" AllowSorting="True" AlternatingRowStyle-BackColor="#F7F7F7" AlternatingRowStyle-BorderStyle="Solid" AlternatingRowStyle-BorderColor="#E4E4E4" AlternatingRowStyle-BorderWidth="1" RowStyle-BorderColor="#E4E4E4" RowStyle-BorderStyle="Solid" RowStyle-BorderWidth="1" BorderColor="#E4E4E4" BorderStyle="Solid" BorderWidth="1" GridLines="Vertical" HeaderStyle-BackColor="#E0E0E0" HeaderStyle-BorderColor="White" HeaderStyle-BorderStyle="Solid" HeaderStyle-BorderWidth="1" HeaderStyle-Height="40px">
                <Columns>
                    <asp:BoundField DataField="Operacion" HeaderText="Operacion" ReadOnly="True" SortExpression="Operacion" />
                    <asp:BoundField DataField="Caja" HeaderText="Caja" SortExpression="Caja" />
                    <asp:BoundField DataField="Mercancia" HeaderText="Mercancia" SortExpression="Mercancia" />
                    <asp:BoundField DataField="Cajas" HeaderText="Cajas" SortExpression="Cajas" />
                    <asp:BoundField DataField="Fechain" HeaderText="Fechain" SortExpression="Fechain" />
                    <asp:BoundField DataField="Horain" HeaderText="Horain" SortExpression="Horain" Visible="False" />
                    <asp:BoundField DataField="Fechaout" HeaderText="Fechaout" SortExpression="Fechaout" />
                    <asp:BoundField DataField="Horaout" HeaderText="Horaout" SortExpression="Horaout" Visible="False" />
                    <asp:BoundField DataField="Descargado" HeaderText="Descargado" SortExpression="Descargado" />
                    <asp:BoundField DataField="Remanente" HeaderText="Remanente" SortExpression="Remanente" />
                    <asp:BoundField DataField="Peso" HeaderText="Peso" SortExpression="Peso" />
                    <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="RSocial" HeaderText="RSocial" SortExpression="RSocial" />
                    <asp:BoundField DataField="Terminado" HeaderText="Terminado" SortExpression="Terminado" />
                    <asp:BoundField DataField="Valorc" HeaderText="Valorc" SortExpression="Valorc" />
                    <asp:BoundField DataField="Fraccion" HeaderText="Fraccion" SortExpression="Fraccion" />
                    <asp:BoundField DataField="UM" HeaderText="UM" SortExpression="UM" />
                    <asp:BoundField DataField="Importador" HeaderText="Importador" SortExpression="Importador" />
                    <asp:BoundField DataField="ClavePed" HeaderText="ClavePed" SortExpression="ClavePed" />
                    <asp:BoundField DataField="DiasAlmacen" HeaderText="DiasAlmacen" SortExpression="DiasAlmacen" />
                    <asp:BoundField DataField="AvisoAb" HeaderText="AvisoAb" SortExpression="AvisoAb" />
                    <asp:BoundField DataField="Fechaab" HeaderText="Fechaab" SortExpression="Fechaab" />
                    <asp:BoundField DataField="NoAplica" HeaderText="NoAplica" SortExpression="NoAplica" Visible="False" />
                    <asp:BoundField DataField="Gratis" HeaderText="Gratis" SortExpression="Gratis" Visible="False" />
                    <asp:BoundField DataField="Contenedor" HeaderText="Contenedor" SortExpression="Contenedor" />
                    <asp:BoundField DataField="DirImp" HeaderText="DirImp" SortExpression="DirImp" Visible="False" />
                    <asp:BoundField DataField="Bultos" HeaderText="Bultos" SortExpression="Bultos" />
                    <asp:BoundField DataField="Factura" HeaderText="Factura" SortExpression="Factura" Visible="False" />
                    <asp:BoundField DataField="CFDI" HeaderText="CFDI" SortExpression="CFDI" Visible="False" />
                    <asp:BoundField DataField="MontoCFDI" HeaderText="MontoCFDI" SortExpression="MontoCFDI" Visible="False" />
                    <asp:BoundField DataField="MontoCFDIDlls" HeaderText="MontoCFDIDlls" SortExpression="MontoCFDIDlls" Visible="False" />
                    <asp:BoundField DataField="Aprovechamiento" HeaderText="Aprovechamiento" SortExpression="Aprovechamiento" Visible="False" />

                </Columns>
                <EmptyDataTemplate>
                    <div style="padding: 20px; font-size: 1.5em;">No se encontraron registros que causan abandono en el mes seleccionado.</div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>


    </form>
</body>
</html>
