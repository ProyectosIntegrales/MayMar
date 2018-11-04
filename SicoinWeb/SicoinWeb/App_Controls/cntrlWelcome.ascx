<%@ Control Language="VB" AutoEventWireup="false" CodeFile="cntrlWelcome.ascx.vb" Inherits="App_Controls_cntrlWelcome" %>
<div style="text-align:center; font-size:16px; padding-top:50px;">
    <h2>Bienvenido al Sistema de Control de Inventarios</h2>
    <asp:Image ID="imgLogo" runat="server" ImageUrl="~/images/SicoinLogo.png" />
    <br /><br />Es necesario tener una cuenta de usuario para acceder al sistema.<br />
    <br /><div style="font-size:12px;">Consulte con el administrador del sistema para más información sobre como obtener una cuenta de SiCoIn Web</div><br /><br />
    <asp:Button ID="btnLogin" runat="server" Text="Acceder" CssClass="btn" />
</div>