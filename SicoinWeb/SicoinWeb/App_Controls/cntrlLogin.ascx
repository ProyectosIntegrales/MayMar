<%@ Control Language="VB" AutoEventWireup="false" CodeFile="cntrlLogin.ascx.vb" Inherits="App_Controls_cntrlLogin" %>
  
<asp:Panel ID="pnlLogin" runat="server" CssClass="loginDialog" Width="400" Height="200" HorizontalAlign="Center">
    <asp:Panel ID="pnlUsername" runat="server">

    <asp:Label ID="lbl1" runat="server" Text="Acceso de usuarios" style="color:#FFF; font-size: 18px; font-weight:bold"></asp:Label>
    <br />
    <table align="center" style="margin-top:30px;" cellpadding="5">
        <tr>
            <td class="whiteLabel">Usuario:</td>
            <td><asp:TextBox ID="txtUsername" runat="server" CssClass="textboxg" AutoCompleteType="Disabled" Autocomplete="Off"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="whiteLabel">Contraseña:</td>
            <td><asp:TextBox ID="txtPassword" runat="server" CssClass="textboxg" TextMode="Password" AutoCompleteType="Disabled" Autocomplete="Off"></asp:TextBox></td>
        </tr>
        <tr><td colspan="2"><asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label></td></tr>
        <tr>
            <td colspan="2" style="padding-top:30px;"><asp:Button ID="btnOK" runat="server" Text="Aceptar" CssClass="btn" Width="100" />&nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancelar" CssClass="btna"></asp:Button></td>
        </tr>
    </table>
    </asp:Panel>

<asp:Panel ID="pnlForget" runat="server" Visible="false">
       <asp:Label ID="lbl2" runat="server" Text="Olvido de contraseña" style="color:#FFF; font-size: 18px; font-weight:bold"></asp:Label>
    <br />
    <p style="color:#FFF; padding-top:20px;" >Escriba su dirección de correo electrónico para recibir instrucciones de como restaurar su contraseña.</p>
    <asp:TextBox ID="txtEmail" runat="server" CssClass="textboxr" Width="150" ></asp:TextBox><br /><br /><br />
    <asp:Button ID="btnForget" runat="server" Text="Recibir instrucciones" CssClass="btn" />&nbsp;&nbsp;
    <asp:Button ID="btnCancelF" runat="server" Text="Cancelar" CssClass="btna" />
</asp:Panel>    

</asp:Panel>