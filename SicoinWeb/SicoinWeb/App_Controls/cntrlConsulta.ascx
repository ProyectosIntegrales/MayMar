<%@ Control Language="VB" AutoEventWireup="false" CodeFile="cntrlConsulta.ascx.vb" Inherits="App_Controls_cntrlConsulta" %>
<%@ Register Src="~/App_Controls/cntrlReporte.ascx" TagPrefix="uc1" TagName="cntrlReporte" %>
<%@ Register Src="~/App_Controls/cntrlRepAnexo29XLS.ascx" TagPrefix="uc1" TagName="cntrlRepAnexo29XLS" %>
<%@ Register Src="~/App_Controls/cntrlRepAbandono.ascx" TagPrefix="uc1" TagName="cntrlRepAbandono" %>



<uc1:cntrlReporte runat="server" ID="cntrlReporte" />
<uc1:cntrlRepAnexo29XLS runat="server" ID="cntrlRepAnexo29XLS" />
<uc1:cntrlRepAbandono runat="server" ID="cntrlRepAbandono" />

<div style="display: flex">
    <div style="width:50%; padding-left: 20px">
        <asp:Button ID="btnInventario" runat="server" Text="Reporte de Entradas de Inventario" CssClass="btn" Height="50px" Width="320px" Font-Size="12pt" />
     </div>
<div style=" width: 50% ; padding-top:20px;">

        <a  id="lnbAb" class="btn" style="height: 80px; width: 320px; font-size: 12pt; padding-left:65px; padding-right: 65px; padding-top: 25px; padding-bottom: 25px" onclick="javascript:$('#ifraba').toggle(500);" >Consulta de Abandonos</a>
        <asp:Button ID="btnAban" runat="server" Text="Reporte de Causa de Abandono" CssClass="btn" Height="50px" Width="320px" Font-Size="12pt " Visible="false" />
        </div>
    </div>
    <div style="display: flex; padding-top:15px; padding-bottom: 40px;">
<div style="padding-left:20px;">
        <asp:Button ID="btnAnexo29" runat="server" Text="Reporte de Anexo 29" CssClass="btn" Height="50px" Width="320px" Font-Size="12pt" />
    </div>
   
    </div>
<div id="ifraba" style="display: none; position: fixed; top: 10vh; right: 0; left: 0; margin-right: auto; margin-left: auto; height: 80vh; background-color: #fff; border-color: #0a1963; border-radius: 3px; width: 90vw; border-width: 2px; box-shadow: 0px 0px 10px; padding: 10px; z-index: 20000">
    <div class="close" onclick="javascript:$('#ifraba').toggle(500);"><span>X</span></div>
    <iframe src="app_controls/cntrlAbandono.aspx" width="100%" height="100%" frameborder="0"></iframe>
</div>
