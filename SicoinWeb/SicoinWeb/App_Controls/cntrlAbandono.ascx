<%@ Control Language="VB" AutoEventWireup="false" CodeFile="cntrlAbandono.ascx.vb" Inherits="App_Controls_cntrlAbandono" %>
<p>asdasdasd
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsFechasAb" DataTextField="DisplayDate" DataValueField="M">
    </asp:DropDownList>
    <asp:SqlDataSource ID="dsFechasAb" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT * FROM [vFechasAb] ORDER BY [M] DESC"></asp:SqlDataSource>
    <br />
</p>
<asp:GridView ID="GridView1" runat="server" DataSourceID="dsAbandonos">
</asp:GridView>
<asp:SqlDataSource ID="dsAbandonos" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="spGetAbandonosLastMonth" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

