<%@ Control Language="VB" AutoEventWireup="false" CodeFile="cntrlDamaged.ascx.vb" Inherits="App_Controls_cntrlDamaged" %>
<%@ Register Src="~/App_Controls/cntrlDamagedPopup.ascx" TagName="cntrlDamagedPopup" TagPrefix="uc2" %>

<asp:TextBox ID="txtDamage" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" Enabled="False" ClientIDMode="Static" Width="100px"></asp:TextBox>

<asp:Button ID="btnDamaged" runat="server" CssClass="btn" Style="margin-right: 20px;" TabIndex="25" Text="Mercancía Dañada" Visible="false" />

<asp:SqlDataSource ID="dsDamage" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT SUM(Cantidad) AS Cantidad FROM Damages GROUP BY Operacion HAVING (Operacion = @Op)">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtOp" Name="Op" PropertyName="Text" />
    </SelectParameters>
</asp:SqlDataSource>
<uc2:cntrlDamagedPopup ID="cntrlDamagedPopup" runat="server" />