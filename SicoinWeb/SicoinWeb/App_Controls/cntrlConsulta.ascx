<%@ Control Language="VB" AutoEventWireup="false" CodeFile="cntrlConsulta.ascx.vb" Inherits="App_Controls_cntrlConsulta" %>
<%@ Register Src="~/App_Controls/cntrlReporte.ascx" TagPrefix="uc1" TagName="cntrlReporte" %>
<%@ Register Src="~/App_Controls/cntrlRepAnexo29XLS.ascx" TagPrefix="uc1" TagName="cntrlRepAnexo29XLS" %>
<%@ Register Src="~/App_Controls/cntrlRepAbandono.ascx" TagPrefix="uc1" TagName="cntrlRepAbandono" %>



<uc1:cntrlReporte runat="server" ID="cntrlReporte" />
<uc1:cntrlRepAnexo29XLS runat="server" ID="cntrlRepAnexo29XLS" />
<uc1:cntrlRepAbandono runat="server" ID="cntrlRepAbandono" />

<div class="d-flex" style="padding-bottom: 20px;">
    <div class="d-flex" style="width: 50%; height: 100%; max-width: 50%; display: flex; flex-direction: column; justify-content: space-between; align-items: center;">
        <asp:Button ID="btnInventario" runat="server" Text="Reporte de Entradas de Inventario" CssClass="btn m-3" Height="60px" Width="320px" Font-Size="12pt" />
        <asp:Button ID="btnAnexo29" runat="server" Text="Reporte de Anexo 29" CssClass="btn m-3" Height="60px" Width="320px" Font-Size="12pt" />
    </div>
    <div class="d-flex" style="width: 50%; height: 100%; max-width: 50%; display: flex; flex-direction: column; justify-content: space-between; align-items: center;">

        <a id="lnbAb" class="btn m-3" style="height: 50px; width: 320px; font-size: 12pt; display: flex; align-items: center; justify-content: center;" onclick="javascript:$('#ifraba').fadeToggle(250);">Consulta de Abandonos</a>
        <a id="lnbDm" href="#" class="btn m-3" onclick="javascript:$('#ifrdamage').fadeToggle(200);" style="height: 50px; width: 320px; font-size: 12pt; display: flex; align-items: center; justify-content: center;">Mcia Dañada</a>
        <a id="lnbAlm" href="#" class="btn m-3" onclick="javascript:$('#ifralm').fadeToggle(200);" style="height: 50px; width: 320px; font-size: 12pt; display: flex; align-items: center; justify-content: center;">Almacenaje</a>
    </div>
</div>


<div id="ifraba" style="display: none; position: fixed; top: 10vh; right: 0; left: 0; margin-right: auto; margin-left: auto; height: 80vh; background-color: #fff; border-color: #0a1963; border-radius: 3px; width: 90vw; border-width: 2px; box-shadow: 0px 0px 10px; padding: 10px; z-index: 20000">
    <div class="close" onclick="javascript:$('#ifraba').fadeToggle(250);"><span>X</span></div>
    <iframe src="app_controls/cntrlAbandono.aspx" width="100%" height="100%" frameborder="0"></iframe>
</div>
<div id="ifrdamage" style="display: none; position: fixed; top: 10vh; right: 0; left: 0; margin-right: auto; margin-left: auto; height: 80vh; background-color: #fff; border-color: #0a1963; border-radius: 3px; width: 90vw; border-width: 2px; box-shadow: 0px 0px 10px; padding: 10px; z-index: 20000">
    <div class="close" onclick="javascript:$('#ifrdamage').fadeToggle(200);"><span>X</span></div>
    <iframe src="app_controls/cntrlDamagedReport.aspx" width="100%" height="100%" frameborder="0"></iframe>
</div>
<div id="ifralm" style="display: none; position: fixed; top: 10vh; right: 0; left: 0; margin-right: auto; margin-left: auto; height: 80vh; background-color: #fff; border-color: #0a1963; border-radius: 3px; width: 90vw; border-width: 2px; box-shadow: 0px 0px 10px; padding: 10px; z-index: 20000">
    <div class="close" onclick="javascript:$('#ifralm').fadeToggle(200);"><span>X</span></div>
    <iframe src="app_controls/cntrlAlmacenaje.aspx" width="100%" height="100%" frameborder="0"></iframe>
</div>
