<%@ Control Language="VB" AutoEventWireup="false" CodeFile="cntrlAdmin.ascx.vb" Inherits="App_Controls_cntrlAdmin" %>
<%@ Register Src="~/Admin/admClientes.ascx" TagPrefix="uc1" TagName="admClientes" %>
<%@ Register Src="~/Admin/admImportador.ascx" TagPrefix="uc1" TagName="admImportador" %>
<%@ Register Src="~/Admin/admMedidas.ascx" TagPrefix="uc1" TagName="admMedidas" %>
<%@ Register Src="~/Admin/admServers.ascx" TagPrefix="uc1" TagName="admServers" %>
<%@ Register Src="~/Admin/admUsers.ascx" TagPrefix="uc1" TagName="admUsers" %>

<asp:HiddenField ID="hflUsername" runat="server" />
<div style="padding-left:20px; padding-right: 20px;">

    <div style="display:flex; flex-direction: row; justify-content:space-between; margin-bottom: 10px;">
        <div >
                        <asp:DropDownList ID="ddlSelect" runat="server" CssClass="textboxg styleSelect" AutoPostBack="True">
                <asp:ListItem>Usuarios</asp:ListItem>
                <asp:ListItem>Servidores</asp:ListItem>
                <asp:ListItem>Reportes</asp:ListItem>
                <asp:ListItem>Clientes</asp:ListItem>
                <asp:ListItem>Importador</asp:ListItem>
                <asp:ListItem>Medidas</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div>
         <asp:Panel ID="pnlFilter" runat="server" Visible="false">
            Filtrar:&nbsp;
            <asp:TextBox ID="txtFilter" runat="server" CssClass="textboxg filter" AutoPostBack="True" Width="150"></asp:TextBox>
             <asp:ImageButton ID="imbReset" runat="server" Height="12px" Style="position: relative; left: -20px; top: 2px;"  ImageUrl="~/images/icons/16X16/delete (1).png" />
            
            </asp:Panel>
        </div>
    </div>

            <uc1:admClientes runat="server" ID="admClientes" Visible="false"/>
            <uc1:admImportador runat="server" ID="admImportador" Visible="false" />
            <uc1:admMedidas runat="server" ID="admMedidas" Visible="false" />
            <uc1:admServers runat="server" ID="admServers" Visible="false" />
            <uc1:admUsers runat="server" ID="admUsers" Visible="true" />

</div>
