<%@ Control Language="VB" AutoEventWireup="false" CodeFile="cntrlInventory.ascx.vb" Inherits="App_Controls_cntrlInventory" %>
<%@ Register Src="~/App_Controls/cntrlCFDIData.ascx" TagPrefix="uc1" TagName="cntrlCFDIData" %>
<%@ Register Src="~/App_Controls/cntrlAllData.ascx" TagPrefix="uc1" TagName="cntrlAllData" %>
<%@ Register Src="~/App_Controls/cntrlInputData.ascx" TagPrefix="uc1" TagName="cntrlInputData" %>
<%@ Register Src="~/App_Controls/cntrlOutputData.ascx" TagPrefix="uc1" TagName="cntrlOutputData" %>
<%@ Register Src="~/App_Controls/cntrlReporte.ascx" TagPrefix="uc1" TagName="cntrlReports" %>
<%@ Register Src="~/App_Controls/cntrlRepAbandono.ascx" TagPrefix="uc1" TagName="cntrlRepAbandono" %>
<%@ Register Src="~/App_Controls/cntrlAbandono.ascx" TagPrefix="uc1" TagName="cntrlAbandono" %>


<%@ Register Src="cntrlSalidas.ascx" TagName="cntrlSalidas" TagPrefix="uc2" %>

<style type="text/css">
    .btn-selected {
        background-color: #FFF;
        -webkit-box-shadow: #000 2px 2px 5px;
        -moz-box-shadow: #000 2px 2px 5px;
        box-shadow: #c1c1c1 1px 2px 5px;
        text-decoration: none;
    }

    .btn-disabled, .btn-disabled:hover {
        color: #979797 !important;
        cursor: auto;
        background-color: #e1e1e1 !important;
        -webkit-box-shadow: none;
        -moz-box-shadow: none;
        box-shadow: none;
        text-decoration: none;
    }
</style>

<div class="menu1" style="white-space: nowrap;">
    <a id="lnbAb" href="#" class="btn" onclick="javascript:$('#ifraba').toggle(500);">Abandonos</a>
    <a href="#" onclick="javascript:$('#reps').toggle(500);" class="btn" style="margin-right: 10px">Reportes</a>
</div>

<div id="reps" style="display: none; position: absolute; top: 40px; right: 20px; background-color: #fff; border-color: #0a1963; border-radius: 3px; width: 199px; border-width: 2px; box-shadow: 5px 5px 10px; padding: 10px; z-index: 10000">
    <asp:LinkButton runat="server" ID="lnbReportes" Text="Reporte de Inventario" Style="padding-left: 20px; padding-bottom: 15px;"></asp:LinkButton><br style="height: 10px" />
    <asp:LinkButton runat="server" ID="lnbReportAb" Text="Reporte de Abandonos" Style="padding-left: 20px;"></asp:LinkButton>
</div>

<div id="ifraba" style="display: none; position: fixed; top: 10vh; right: 0; left: 0; margin-right: auto; margin-left: auto; height: 80vh; background-color: #fff; border-color: #0a1963; border-radius: 3px; width: 90vw; border-width: 2px; box-shadow: 0px 0px 10px; padding: 10px; z-index: 20000">
    <div class="close" onclick="javascript:$('#ifraba').toggle(500);"><span>X</span></div>
    <iframe src="app_controls/cntrlAbandono.aspx" width="100%" height="100%" frameborder="0"></iframe>
</div>

<asp:Panel ID="pnlMain" runat="server" CssClass="main" DefaultButton="btnGo">
    <div class="main">
        <asp:UpdatePanel ID="pnlUpdate" runat="server">
            <ContentTemplate>


                <table class="auto-style1">
                    <tr>
                        <td colspan="3" style="padding-bottom: 20px; padding-left: 10px;">
                            <asp:RadioButtonList runat="server" ID="rblOp" RepeatDirection="Horizontal" AutoPostBack="True" Visible="false">
                                <asp:ListItem Text="Capturar Entrada" Selected="True" Value="IN" style="padding-right: 20px;"></asp:ListItem>
                                <asp:ListItem Text="Capturar Salida" Value="OUT" style="padding-right: 20px;"></asp:ListItem>
                                <asp:ListItem Text="Capturar Factura y CFDI" Value="CFDI" style="padding-right: 20px;"></asp:ListItem>
                                <asp:ListItem Text="Modificar Registro (SA)" Value="SA" style="padding-right: 20px;"></asp:ListItem>

                            </asp:RadioButtonList>
                            <div class="menu-main">
                                <asp:Button ID="btnCapturaIn" runat="server" Text="Capturar Entrada" CssClass="btn btn-selected" OnClientClick="btnCapturaIn" />
                                <asp:Button ID="btnCapturaOut" runat="server" Text="Capturar Salida" CssClass="btn" />
                                <asp:Button ID="btnCDFI" runat="server" Text="Capturar Factura y CDFI" CssClass="btn" />
                                <asp:Button ID="btnSA" runat="server" Text="Modificar Inventario" CssClass="btn" Visible="false" />
                            </div>
                        </td>

                    </tr>
                    <tr>
                        <td align="right" valign="middle" style="width: 190px;">
                            <asp:Label ID="lblOper" runat="server">Operación/Pedimento</asp:Label></td>
                        <td valign="middle">
                            <asp:TextBox ID="txtOp" runat="server" CssClass="textboxg uppercase" Width="130px" AutoPostBack="True"></asp:TextBox>
                            <asp:DropDownList ID="ddlOut" runat="server" CssClass="textboxg uppercase" DataSourceID="dsOut" DataTextField="Operacion" DataValueField="Operacion" Visible="false" Width="150px" Style="width: 150px;"></asp:DropDownList>
                            <asp:DropDownList ID="ddlCFDI" runat="server" CssClass="textboxg uppercase" DataSourceID="dsCFDI" DataTextField="Operacion" DataValueField="Operacion" Visible="False" Width="150px" Style="width: 150px;">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="dsOut" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT Operacion FROM Inventario WHERE (Terminado = 0) ORDER BY Operacion"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="dsCFDI" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT Operacion FROM Inventario WHERE (Terminado = 1) AND (ISNULL(Status, 0) = 1) ORDER BY Operacion"></asp:SqlDataSource>
                            <asp:Button ID="btnGo" runat="server" CssClass="btn btn-small" Text="Abrir" Height="20px" Width="60px" Visible="False" />
                        </td>

                        <td valign="middle" align="center">
                            <asp:Panel ID="pnlValid" runat="server" Visible="false">
                                <asp:Label ID="lblValid" runat="server" Text="Este número de operación no existe, ¿Desea crear una nueva entrada?"></asp:Label><br />
                                <br />
                                &nbsp;<asp:Button ID="btnNew" runat="server" Text="Aceptar" CssClass="btn" />
                                &nbsp;<asp:Button ID="btnCancelNew" runat="server" Text="Cancelar" CssClass="btna" />
                            </asp:Panel>
                                                        <asp:Panel ID="pnlNotExists" runat="server" Visible="false">
                                <asp:Label ID="Label1" runat="server" Text="Este número de operación no existe!"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="pnlTryagain" runat="server" Visible="false" Style="color: #a90000">
                                Algo salió mal, intente de nuevo. Verifique que sea el número correcto.
                            </asp:Panel>
                        </td>

                    </tr>

                </table>

            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnNew" />
                <asp:PostBackTrigger ControlID="btnGo" />
            </Triggers>
        </asp:UpdatePanel>
        <br />
        <asp:PlaceHolder ID="plhControls" runat="server">
            <uc1:cntrlOutputData runat="server" ID="cntrlOutputData" Visible="false" />
            <uc1:cntrlInputData runat="server" ID="cntrlInputData" Visible="false" />
            <uc1:cntrlCFDIData runat="server" ID="cntrlCFDIData" Visible="false" />
            <uc1:cntrlAllData runat="server" ID="cntrlAllData" Visible="false" />
            <uc2:cntrlSalidas ID="cntrlSalidas1" runat="server" Visible="false" />

        </asp:PlaceHolder>
        <uc1:cntrlAbandono runat="server" ID="cntrlAbandono" Visible="false" />
        <uc1:cntrlReports runat="server" ID="cntrlReports" />
        <uc1:cntrlRepAbandono runat="server" ID="cntrlRepAbandono" />
    </div>

</asp:Panel>
<div id="dvMsg" class="notification" runat="server" visible="false" clientidmode="Static">
    <img src="../images/icons/ok.png" height="32" style="position: relative; top: 10px" />
    <asp:Label ID="lblMsg" runat="server">Operación exitosa!</asp:Label>
</div>


<asp:HiddenField ID="hflChanging" runat="server" Value="False" />
<asp:HiddenField ID="hflUsername" runat="server" />
<asp:HiddenField ID="hflSA" runat="server" />
<asp:HiddenField ID="hfModifyFrom" runat="server" />



<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $('#dvMsg').fadeOut(2000, function () {
            $(this).html(""); //reset label after fadeout
        });
    });
</script>
