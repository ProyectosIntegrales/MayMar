<%@ Control Language="VB" AutoEventWireup="false" CodeFile="cntrlAdmin.ascx.vb" Inherits="App_Controls_cntrlAdmin" %>
<%@ Register Src="~/Admin/admClientes.ascx" TagPrefix="uc1" TagName="admClientes" %>
<%@ Register Src="~/Admin/admImportador.ascx" TagPrefix="uc1" TagName="admImportador" %>
<%@ Register Src="~/Admin/admMedidas.ascx" TagPrefix="uc1" TagName="admMedidas" %>
<%@ Register Src="~/Admin/admUsers.ascx" TagPrefix="uc1" TagName="admUsers" %>



<asp:HiddenField ID="hflUsername" runat="server" />
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
</style>
<div style="padding-left:20px">

<table class="auto-style1" cellpadding="0" cellspacing="0" style="margin-right:20px;">
    <tr>
        <td valign="top" style="padding-right:10px;">
            <asp:DropDownList ID="ddlSelect" runat="server" CssClass="textboxg styleSelect" AutoPostBack="True">
                <asp:ListItem>Usuarios</asp:ListItem>
                <asp:ListItem>Reportes</asp:ListItem>
                <asp:ListItem>Clientes</asp:ListItem>
                <asp:ListItem>Importador</asp:ListItem>
                <asp:ListItem>Medidas</asp:ListItem>
            </asp:DropDownList>
            <asp:Panel ID="pnlFilter" runat="server" Visible="false">
            <br /><br />
            Filtrar:<br />
            <asp:TextBox ID="txtFilter" runat="server" CssClass="textboxg filter" AutoPostBack="True" Width="150"></asp:TextBox>
            <br />
            <div style="text-align:right; width:160px;" ><asp:LinkButton ID="lnbReset" runat="server" Text="Reset"></asp:LinkButton></div>
            </asp:Panel>
        </td>
        <td valign="top" style="border:1px solid #808080" >
            <uc1:admClientes runat="server" ID="admClientes" Visible="false"/>
            <uc1:admImportador runat="server" ID="admImportador" Visible="false" />
            <uc1:admMedidas runat="server" ID="admMedidas" Visible="false" />
            <uc1:admUsers runat="server" ID="admUsers" Visible="true" />
        </td>
    </tr>
   
</table>

</div>
