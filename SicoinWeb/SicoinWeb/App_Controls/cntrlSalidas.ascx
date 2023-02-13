<%@ Control Language="VB" AutoEventWireup="false" CodeFile="cntrlSalidas.ascx.vb" Inherits="App_Controls_cntrlSalidas" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<div style="margin-left: 10px; margin-right: 10px; margin-bottom: 10px;">
    <h3 style="margin-top: 0">
        <asp:Timer ID="Timer1" runat="server" Interval="60000">
        </asp:Timer>
        Control de Salidas</h3>
    <h4>Salidas Pendientes</h4>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="8" DataSourceID="dsSalidas" HorizontalAlign="Center" Width="100%">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible="False" />
            <asp:BoundField DataField="Operacion" HeaderText="Operación" ReadOnly="True" SortExpression="Operacion">
                <ControlStyle Width="30%" />
                <HeaderStyle Height="20px" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" Width="30%" />
            </asp:BoundField>
            <asp:BoundField DataField="Caja" HeaderText="Caja" SortExpression="Caja">
                <ItemStyle Width="15%" />
            </asp:BoundField>
            <asp:BoundField DataField="NombreTerminado" HeaderText="Salida por" SortExpression="NombreTerminado">
                <ItemStyle Width="30%" />
            </asp:BoundField>
            <asp:BoundField DataField="FechaTerminado" HeaderText="Fecha" SortExpression="FechaTerminado">
                <ItemStyle Width="30%" />
            </asp:BoundField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="btnSalida" runat="server" CssClass="btn" Text="Salida" Height="20px" Width="80px" OnClick="btnSalida_Click" CommandArgument='<%# Eval("ID") & "," & Eval("Operacion") + "," + Eval("Caja") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            No existen Salidas por Aceptar en este momento. Consulte con el Administrador si cree que esto es un Error!
        </EmptyDataTemplate>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" HorizontalAlign="Center" Width="100%" Wrap="False" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <asp:SqlDataSource ID="dsSalidas" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT * FROM [vSalidas] WHERE ([FechaSalida] IS NULL)"></asp:SqlDataSource>
    <br />
    <h4>Salidas Aceptadas</h4>
    <asp:SqlDataSource ID="dsSalidasOK" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT ID, Operacion, Caja, FechaTerminado, NombreTerminado, FechaSalida, NombreSalida FROM vSalidas WHERE (FechaSalida IS NOT NULL) ORDER BY FechaSalida DESC"></asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="8" DataSourceID="dsSalidasOK" HorizontalAlign="Center" Width="100%" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible="False" />
            <asp:BoundField DataField="Operacion" HeaderText="Operación" SortExpression="Operacion"></asp:BoundField>
            <asp:BoundField DataField="Caja" HeaderText="Caja" SortExpression="Caja"></asp:BoundField>
            <asp:BoundField DataField="NombreTerminado" HeaderText="Salida por" SortExpression="NombreTerminado"></asp:BoundField>
            <asp:BoundField DataField="FechaTerminado" HeaderText="Fecha Salida" SortExpression="FechaTerminado"></asp:BoundField>
            <asp:BoundField DataField="NombreSalida" HeaderText="Aceptación de Salida por" SortExpression="NombreSalida" />
            <asp:BoundField DataField="FechaSalida" HeaderText="Fecha de Aceptación de Salida" SortExpression="FechaSalida" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" HorizontalAlign="Center" Width="100%" Wrap="False" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>

</div>

<asp:Panel ID="pnlPopUp" runat="server" CssClass="modalPopUpBig" Width="300" Height="150" Style="display: none" HorizontalAlign="Center">
    <div style="text-align: center; padding: 15px;">
        Confirme que se Aceptará la Salida para
        <br />
        <br />
        Operación: <asp:Label ID="lblOperacion" runat="server" Text="" CssClass="bold" ></asp:Label>
        <br />
        Caja: <asp:Label ID="lblCaja" runat="server" CssClass="bold" ></asp:Label>
        <br />
        <br />
        <br />
        <asp:Button ID="btnYes" runat="server" CssClass="btn" Text="Confirmar" Width="90" />
        &nbsp;<asp:Button ID="btnNo" runat="server" Text="Cancelar" CssClass="btna" Width="80" />
    </div>
</asp:Panel>

<asp:Button ID="btnPopUp" runat="server" Style="display: none" />
<ajaxtoolkit:modalpopupextender id="pnlConfirm_ModalPopupExtender" runat="server" targetcontrolid="btnPopUp" popupcontrolid="pnlPopUp" backgroundcssclass="modalBackground">
</ajaxtoolkit:modalpopupextender>
<asp:HiddenField ID="hflID" runat="server" />