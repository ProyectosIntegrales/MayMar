<%@ Control Language="VB" AutoEventWireup="false" CodeFile="cntrlError.ascx.vb" Inherits="App_Controls_cntrlError" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Panel ID="pnlError" runat="server" CssClass="errorMessage" Width="600" Style="display: none; z-index: 100000; top: 30%">

    <table style="width: 100%">
        <tr>
            <td style="padding: 20px">

                <asp:Label ID="lblError" runat="server"></asp:Label>

            </td>
            <td align="right" valign="top" width="20" style="position: relative; top: -10px; right: -10px;">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="Top"
                    ImageUrl="~/images/Icons/close.png" Width="16" />
            </td>
        </tr>
    </table>
</asp:Panel>
<asp:Button ID="btnPopUp" runat="server" Style="display: none" />
<asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" DropShadow="True"
    TargetControlID="btnPopUp" PopupControlID="pnlError" BackgroundCssClass="modalBackground"
    Y="200">
</asp:ModalPopupExtender>
<asp:HiddenField ID="hflReturn" runat="server" Value="False" />
