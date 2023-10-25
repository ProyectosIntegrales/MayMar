<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" Debug="false" %>

<%@ Register src="~/App_Controls/cntrlWelcome.ascx" tagname="cntrlWelcome" tagprefix="uc1" %>
<%@ Register Src="~/App_Controls/cntrlLogin.ascx" TagPrefix="uc1" TagName="cntrlLogin" %>
<%@ Register Src="~/App_Controls/cntrlMain.ascx" TagPrefix="uc1" TagName="cntrlMain" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="scripts/jquery/jquery-ui.css" rel="stylesheet" />
    <link href="scripts/autocomplete.css" rel="stylesheet" />
</asp:Content>                                                      
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
    <uc1:cntrlWelcome ID="cntrlWelcome1" runat="server" OnLoginClicked="cntrlWelcome1_LoginClicked"  />
    <uc1:cntrlLogin runat="server" ID="cntrlLogin" Visible="false" OnLoginOK="cntrlLogin_LoginOK" OnCancel="cntrlLogin_Cancel1" />
    <uc1:cntrlMain runat="server" ID="cntrlMain" Visible="false"/>

    <script src="scripts/jquery/jquery-1.12.4.js"></script>
    <script src="scripts/jquery/jquery-ui.js"></script>

    <script src="scripts/js.js"></script>
</asp:Content>

