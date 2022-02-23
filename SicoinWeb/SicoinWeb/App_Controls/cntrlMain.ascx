<%@ Control Language="VB" AutoEventWireup="false" CodeFile="cntrlMain.ascx.vb" Inherits="App_Controls_cntrlMain" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<%@ Register Src="~/App_Controls/cntrlAdmin.ascx" TagPrefix="uc1" TagName="cntrlAdmin" %>

<%@ Register Src="~/App_Controls/cntrlAnexo29.ascx" TagPrefix="uc1" TagName="cntrlAnexo29" %>
<%@ Register Src="~/App_Controls/cntrlInventory.ascx" TagPrefix="uc1" TagName="cntrlInventory" %>
<%@ Register Src="~/App_Controls/cntrlConsulta.ascx" TagPrefix="uc1" TagName="cntrlConsulta" %>


<%@ Register Src="cntrlSalidas.ascx" TagName="cntrlSalidas" TagPrefix="uc2" %>


<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
</style>

<script type="text/javascript">

    function nextOnEnter(obj, e) {
        e = e || event;
        // we are storing all input fields with tabindex attribute in 
        // a 'static' field of this function using the external function
        // getTabbableFields
        nextOnEnter.fields = nextOnEnter.fields || getTabbableFields();
        if (e.keyCode === 13) {
            // first, prevent default behavior for enter key (submit)
            if (e.preventDefault) {
                e.preventDefault();
            } else if (e.stopPropagation) {
                e.stopPropagation();
            } else {
                e.returnValue = false;
            }
            // determine current tabindex
            var tabi = parseInt(obj.getAttribute('tabindex'), 10);
            // focus to next tabindex in line
            if (tabi + 1 < nextOnEnter.fields.length) {
                nextOnEnter.fields[tabi + 1].focus();
            }
        }
    }

    // returns an array containing all input text/submit fields with a
    // tabindex attribute, in the order of the tabindex values
    function getTabbableFields() {
        var ret = [],
            inpts = document.getElementsByTagName('input'),
            i = inpts.length;
        ddls = document.getElementsByName('select'),
        j = ddls.length;
        while (i--) {
            var tabi = parseInt(inpts[i].getAttribute('tabindex'), 10),
                txtType = inpts[i].getAttribute('type');
            // [txtType] could be used to filter out input fields that you
            // don't want to be 'tabbable'
            ret[tabi] = inpts[i];
        }
        while (j--) {
            var tabi = parseInt(inpts[j].getAttribute('tabindex'), 10),
              txtType = inpts[j].getAttribute('type');
            // [txtType] could be used to filter out input fields that you
            // don't want to be 'tabbable'
            ret[tabi] = inpts[j];
        }
        return ret;
    }
</script>

<script src="../scripts/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="../scripts/jquery-1.4.1.min.js"></script>

<%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"
    type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
    type="text/javascript"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
    rel="Stylesheet" type="text/css" />--%>


<div class="closeButton">
    <asp:Label ID="lblname" runat="server" Font-Bold="true"></asp:Label>
    &nbsp;&nbsp;
                <asp:LinkButton ID="lnbClose" runat="server" Text="Cerrar sesión" ForeColor="#134680"></asp:LinkButton>

</div>

<div class="tabs">
    <asp:Button ID="btnConsulta" runat="server" Text="Consulta" CssClass="btnb" Enabled="False" Visible="false" />
    <asp:Button ID="btnInv" runat="server" Text="Inventario" CssClass="btnb" Enabled="False" />
    <asp:Button ID="btnAnx" runat="server" Text="Anexo 29" CssClass="btnc" />
    <asp:Button ID="btnSalidas" runat="server" Text="Salidas" CssClass="btnc" />
    <asp:Button ID="btnAdmin" runat="server" CssClass="btnca" Width="30" />

</div>

<asp:Panel ID="pnlMain" runat="server" CssClass="mainDialog panel">
    <uc1:cntrlInventory runat="server" ID="cntrlInventory" />
</asp:Panel>

<asp:Panel ID="pnlAnx" runat="server" CssClass="mainDialog panel">
    <uc1:cntrlAnexo29 runat="server" ID="cntrlAnexo29" />
</asp:Panel>

<asp:Panel ID="pnlAdmin" runat="server" Visible="false" CssClass="mainDialog panel">
    <uc1:cntrlAdmin runat="server" ID="cntrlAdmin" />
</asp:Panel>

<asp:Panel ID="pnlConsulta" runat="server" Visible="false" CssClass="mainDialog panel">
    <uc1:cntrlConsulta runat="server" ID="cntrlConsulta" />
</asp:Panel>

<asp:Panel ID="pnlSalidas" runat="server" Visible="false" CssClass="mainDialog panel">
    <uc2:cntrlSalidas ID="cntrlSalidas1" runat="server" />
</asp:Panel>

<asp:Panel ID="pnlConfirm" runat="server" CssClass="modalPopUpBig" Width="300" Height="150" Style="display: none">
    <div style="text-align: center; padding: 15px;">
        Se intenta cerrar la sesión pero aun no<br />
        se ha completado la operación actual.<br />
        Los datos se perderán si se continua.<br />
        <br />
        ¿Desa continua cerrando la sesión actual?<br />
        <br />
        <br />
        <asp:Button ID="btnClose" runat="server" CssClass="btn" Text="Aceptar" />
        &nbsp;<asp:Button ID="btnCancelClose" runat="server" Text="Cancelar" CssClass="btna" />
    </div>
</asp:Panel>

<asp:Button ID="btnPopUp" runat="server" Style="display: none" />
<ajaxToolkit:ModalPopupExtender ID="pnlConfirm_ModalPopupExtender" runat="server" TargetControlID="btnPopUp" PopupControlID="pnlConfirm" BackgroundCssClass="modalBackground" CancelControlID="btnCancelClose">
</ajaxToolkit:ModalPopupExtender>







<asp:HiddenField ID="hflUsername" runat="server" />














