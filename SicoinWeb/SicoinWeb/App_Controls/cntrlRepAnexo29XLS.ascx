<%@ Control Language="VB" AutoEventWireup="false" CodeFile="cntrlRepAnexo29XLS.ascx.vb"
    Inherits="cntrlRepAnexo29XLS" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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



<asp:Button ID="btnShowPopup" runat="server" Text="PopUp" Style="display: none;" />

<cc1:ModalPopupExtender ID="mdlPopup" runat="server" TargetControlID="btnShowPopup"
    PopupControlID="pnlParameters" BackgroundCssClass="modalBackground" DropShadow="True" CancelControlID="imbClose" >
</cc1:ModalPopupExtender>

<asp:Panel ID="pnlParameters" runat="server" Width="420px" CssClass="modalPopUpBig"
    BackColor="White" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" style="display:none;">

        
                            <asp:Label ID="reportTitleLabel" runat="server" Text="Reporte Anexo 29"
                                Font-Size="11" Font-Bold="true" style ="padding-bottom:50px" />

    <div style="text-align: right; position: relative; top: -35px; right: -20px;">
        <asp:ImageButton ID="imbClose" runat="server" ImageUrl="~/images/Icons/close.png" Width="16" CausesValidation="False" />
    </div>

    <div id="Container" style="padding: 0 10px 0 10px; position: relative; top: -10px;">
        <asp:UpdatePanel ID="pnlUpdate" runat="server">
            <ContentTemplate>
                
                <table style="width: 100%; margin-top: 10px;" cellspacing="0" cellpadding="5">
                    <tr >
                        <td align="right">Fecha Inicial</td>
                         <td>
                             <asp:ImageButton ID="imbCalendar2" runat="server" ImageAlign="Bottom" ImageUrl="~/images/icons/16x16/calendar (1).png" />
                             <asp:TextBox ID="txtFIni" runat="server" Font-Size="8" Width="100"></asp:TextBox>
                             <asp:Image ID="Image1" runat="server" ImageAlign="Middle" ImageUrl="~/images/icons/16x16/question.png" Visible="false" />
                             <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" Format="MM/dd/yyyy" PopupButtonID="imbCalendar2" TargetControlID="txtFIni">
                             </cc1:CalendarExtender>
                             </td>
                         </tr>
                    <tr >
                        <td align="right">Fecha Final</td>
                         <td>
                             <asp:ImageButton ID="imbCalendar1" runat="server" ImageAlign="Bottom" ImageUrl="~/images/icons/16x16/calendar (1).png" style="width: 16px" />
                             <asp:TextBox ID="txtFFin" runat="server" Font-Size="8" Width="100"></asp:TextBox>
                             <asp:Image ID="imgReq" runat="server" ImageAlign="Middle" ImageUrl="~/images/icons/16x16/question.png" Visible="false" />
                             <cc1:CalendarExtender ID="CalendarExtender0" runat="server" Enabled="True" Format="MM/dd/yyyy" PopupButtonID="imbCalendar1" TargetControlID="txtFFin">
                             </cc1:CalendarExtender>
                         </td>
                         
                         </tr>

    
                     
                         
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>


    <div style="text-align: center; margin-top: 5px; padding-top: 5px; margin-right: 80px; margin-left: 80px; padding-bottom: 10px;">
        <asp:Label ID="lblError" runat="server" Style="font-size: 8px; color: Red; padding-top: 5px; margin-bottom: 10px;"></asp:Label><br />
        <br />
        <asp:ImageButton ID="btnDOC" runat="server" Height="24px" ImageUrl="~/images/misc/doc.jpg"
            ToolTip="Documento de MS Word" CausesValidation="True" Visible='<%# Bind("allowDOC") %>'
            Style="padding-right: 15px;" />
        <asp:ImageButton ID="btnXLS" runat="server" Height="24px" ImageUrl="~/images/misc/xls.jpg"
            ToolTip="Documento de MS Excel" CausesValidation="True" Style="padding-right: 15px;"
            Visible='<%# Bind("allowXLS") %>' />
        <asp:ImageButton ID="btnXLD" runat="server" Height="24px" ImageUrl="~/images/misc/xld.jpg"
            ToolTip="Hoja de datos de MS Excel" CausesValidation="True" Style="padding-right: 15px;"
            Visible='<%# Bind("allowXLT") %>' />
        <asp:ImageButton ID="btnPDF" runat="server" Height="24px" ImageUrl="~/images/misc/pdf.jpg"
            ToolTip="Documento Acrobat PDF" CausesValidation="True" Visible='<%# Bind("allowPDF") %>' />
    </div>


</asp:Panel>



<asp:HiddenField ID="hfItemClass" runat="server" />


<asp:SqlDataSource ID="dsReport" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT reportID, reportFile, reportTitle, reportType, reportIcon, reportDescription, sort, DatabaseServerName, DatabaseName, allowDOC, allowPDF, allowXLS, allowXLT FROM tblReports"></asp:SqlDataSource>



