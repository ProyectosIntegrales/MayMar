<%@ Control Language="VB" AutoEventWireup="false" CodeFile="cntrlRepAnexo29.ascx.vb" Inherits="App_Controls_cntrlRepAnexo29" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/cntrlError.ascx" TagPrefix="uc1" TagName="cntrlError" %>

<style type="text/css">
    .modalBackground {
        background-color: #414141;
        filter: alpha(opacity=50);
        opacity: 0.5;
    }

    .upCalendar {
        z-index: 10002;
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



<asp:SqlDataSource ID="dsServer" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT tblUsers.ServerID, tblServers.ServerName, tblServers.DatabaseName, tblUsers.Username FROM tblServers INNER JOIN tblUsers ON tblServers.ID = tblUsers.ServerID WHERE (tblUsers.Username = @Username)">
    <SelectParameters>
        <asp:SessionParameter Name="Username" SessionField="Username" />
    </SelectParameters>
</asp:SqlDataSource>



<uc1:cntrlError runat="server" ID="cntrlError" />

<asp:Button ID="btnShowPopup" runat="server" Text="PopUp" Style="display: none;" />

<cc1:ModalPopupExtender ID="mdlPopup" runat="server" TargetControlID="btnShowPopup"
    PopupControlID="pnlParameters" BackgroundCssClass="modalBackground" DropShadow="True" CancelControlID="imbClose" >
</cc1:ModalPopupExtender>

<asp:Panel ID="pnlParameters" runat="server" Width="420px" CssClass="modalPopUpBig"
    BackColor="White" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" style="display:none">

        
                            <asp:Label ID="reportTitleLabel" runat="server" Text="Anexo 29"
                                Font-Size="11" Font-Bold="true" style ="padding-bottom:50px" />

    <div style="text-align: right; position: relative; top: -35px; right: -20px;">
        <asp:ImageButton ID="imbClose" runat="server" ImageUrl="~/images/Icons/close.png" Width="16" CausesValidation="False" />
    </div>

    
    <div style="text-align: center; margin-top: 5px; padding-top: 5px; margin-right: 80px; margin-left: 80px; padding-bottom: 10px;">
        <asp:Label ID="lblError" runat="server" Style="font-size: 8px; color: Red; padding-top: 5px; margin-bottom: 10px;"></asp:Label><br />
        <br />
    
        <asp:ImageButton ID="btnPDF" runat="server" Height="24px" ImageUrl="~/images/misc/pdf.jpg"
            ToolTip="Documento Acrobat PDF" CausesValidation="True" />
    </div>


</asp:Panel>

<asp:HiddenField ID="hflFolio" runat="server" />


<asp:SqlDataSource ID="dsReport" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT reportID, reportFile, reportTitle, reportType, reportIcon, reportDescription, sort, DatabaseServerName, DatabaseName, allowDOC, allowPDF, allowXLS, allowXLT FROM tblReports"></asp:SqlDataSource>




