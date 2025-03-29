<%@ Control Language="VB" AutoEventWireup="false" CodeFile="cntrlDamagedPopup.ascx.vb" Inherits="App_Controls_cntrlDamagedPopup" %>
<%@ Register Src="~/App_Controls/cntrlError.ascx" TagName="cntrlError" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<style type="text/css">
    .modalBackground {
        background-color: #414141;
        filter: alpha(opacity=50);
        opacity: 0.5;
    }

    #Container {
        height: 99%;
        min-height: 99%;
    }
</style>

<style type="text/css">
    .Header {
        padding: 3px;
    }

    .style1 {
        width: 100%;
        margin-bottom: 10px;
        margin-left: 15px;
    }
</style>
<link rel="stylesheet" href="~/styles/boostrap-grid.css" asp-append-version="true" />



<asp:Button ID="btnShowPopup" runat="server" Text="PopUp" Style="display: none;" />

<cc1:ModalPopupExtender ID="mdlPopup" runat="server" TargetControlID="btnShowPopup"
    PopupControlID="pnlPopup" BackgroundCssClass="modalBackground" DropShadow="True" CancelControlID="imbClose">
</cc1:ModalPopupExtender>

<asp:Panel ID="pnlPopup" runat="server" Width="420px" CssClass="modalPopUpBig"
    BackColor="White" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" Style="display: none; min-width: 360px !important">
    <div style="text-align: right; position: absolute; top: 0; right: 0;">
        <asp:ImageButton ID="imbClose" runat="server" ImageUrl="~/images/Icons/close.png" Width="16" CausesValidation="False" />
    </div>
    <div id="Container" style="padding: 0 10px 0 10px; position: relative;">

        <h3 style="margin-top: 0">Mercancía Dañada o Perdida</h3>

        <asp:Panel ID="pnlTable" runat="server" >
            Table here
            <asp:Button ID="btnAdd" CssClass="btn" runat="server" Text="Agregar" OnClick="btnAdd_Click" />
        </asp:Panel>

        <asp:Panel ID="pnlAdd" runat="server" Visible="false">
              <div class="d-flex">
            <div class="col d-flex justify-content-end align-items-center">
                Cantidad
            </div>
            <div class="col-7">
                <asp:TextBox ID="txtCantidad" Width="60px" runat="server" CssClass="textbox"></asp:TextBox>
            </div>
        </div>

        <div class="d-flex mt-3">
            <div class="col d-flex justify-content-end align-items-center" style="text-align: right">
                Comentario o descripción
            </div>
            <div class="col-7">
                <asp:TextBox ID="txtComments" TextMode="MultiLine" Columns="30" runat="server" CssClass="textbox"></asp:TextBox>
            </div>
        </div>

        <div class="d-flex mt-3">
            <div class="col d-flex justify-content-end align-items-center" style="text-align: right">
                Fecha de detección de daño o pérdida
            </div>
            <div class="col-7 d-flex align-items-center">
                <asp:ImageButton ID="imbCalendar1" runat="server" ImageAlign="Bottom" ImageUrl="~/images/icons/16x16/calendar (1).png" Style="width: 16px; margin-right: 4px" />
                <asp:TextBox ID="txtFecha" runat="server" Font-Size="8" Width="100"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender0" runat="server" Enabled="True" Format="MM/dd/yyyy" PopupButtonID="imbCalendar1" TargetControlID="txtFecha"></cc1:CalendarExtender>
            </div>
        </div>



        <asp:Label ID="lblError" ForeColor="Red" runat="server" CssClass="mt-3" Style="text-align: center" Width="100%" Visible="false">
    Error en la Cantidad
        </asp:Label>

        <asp:Panel ID="pnlButtons" runat="server" Style="margin-top: 20px; text-align: center">

            <asp:Button ID="btnOK" runat="server" CssClass="btn" TabIndex="25" Text="Aceptar" Style="margin-right: 20px;" />

            <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btna" TabIndex="26" Text="Cancelar" Style="margin-right: 20px;" />

        </asp:Panel>
        </asp:Panel>
      

    </div>

</asp:Panel>
<uc1:cntrlError ID="cntrlError" runat="server" />