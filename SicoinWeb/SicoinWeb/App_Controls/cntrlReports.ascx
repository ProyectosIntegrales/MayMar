<%@ Control Language="VB" AutoEventWireup="false" CodeFile="cntrlReports.ascx.vb"
    Inherits="cntrlReports" %>

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


<asp:Panel ID="pnlMenu" runat="server">
    <asp:Panel ID="pnlHeader" runat="server" CssClass="reportsHeader">
        <table cellpadding="0" cellspacing="0" class="style1">
            <tr style="">
                <td nowrap="nowrap">
                    <asp:Label ID="lblHeader" runat="server" CssClass="Header"></asp:Label>
                </td>
                <td align="right">
                    <asp:ImageButton ID="imbSettings" runat="server" ImageUrl="~/images/Icons/16X16/applications.png"
                        Visible="False" ToolTip="Configuración de parámetros" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td style="padding: 3px 3px 3px 3px;">
                <asp:DataList ID="DataList1" runat="server"
                    ShowFooter="False" ShowHeader="False" DataSourceID="dsReports" Font-Size="8pt"
                    RepeatColumns="1" Width="140px">
                    <ItemStyle />
                    <ItemTemplate>
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:Image ID="imgReport" runat="server" ImageUrl='<%# "~/images/Icons/16X16/" & Eval("reportIcon") %>'
                                        ImageAlign="Middle" />
                                </td>
                                <td style="padding-left: 3px; padding-right: 10px;" width="100%" nowrap="nowrap">
                                    <asp:LinkButton ID="reportTitleLinkButton1" runat="server" Text='<%# Bind("reportTitle") %>'
                                        OnClick="goReport" CommandArgument='<%# Eval("reportID") %>' ToolTip='<%# Eval("reportDescription") %>' />
                                    <asp:HiddenField ID="hflReportId" runat="server" Value='<%# Eval("reportID") %>' />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
    </table>
</asp:Panel>
<asp:SqlDataSource ID="dsReports" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>"
    SelectCommand="SELECT reportID, reportFile, reportTitle, reportType, reportIcon, reportDescription, DatabaseServerName, DatabaseName, allowDOC, allowPDF, allowXLS, allowXLT FROM tblReports WHERE (reportType = @reportType) ORDER BY Sort">
    <SelectParameters>
        <asp:ControlParameter ControlID="hfReportType" Name="reportType" PropertyName="Value"
            Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:Button ID="btnShowPopup" runat="server" Text="PopUp" Style="display: none;" />

<cc1:ModalPopupExtender ID="mdlPopup" runat="server" TargetControlID="btnShowPopup"
    PopupControlID="pnlParameters" BackgroundCssClass="modalBackground" DropShadow="True" CancelControlID="imbClose" OkControlID="btnDOC">
</cc1:ModalPopupExtender>

<asp:Button ID="btnShowSettings" runat="server" Text="PopUp" Style="display: none;" />
<cc1:ModalPopupExtender ID="mdlSettins" runat="server" TargetControlID="btnShowSettings"
    PopupControlID="pnlSettings" BackgroundCssClass="modalBackground" DropShadow="True">
</cc1:ModalPopupExtender>



<asp:Panel ID="pnlParameters" runat="server" Width="420px" CssClass="modalPopUpBig"
    BackColor="White" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" Style="display: none;">



    <div style="text-align: right; position: relative; top: -20px; right: -20px;">
        <asp:ImageButton ID="imbClose" runat="server" ImageUrl="~/images/Icons/close.png" Width="16" CausesValidation="False" />
    </div>
    <div id="Container" style="padding: 0 10px 0 10px; position: relative; top: -30px;">
        <asp:UpdatePanel ID="pnlUpdate" runat="server">
            <ContentTemplate>
                <asp:FormView ID="FormView2" runat="server" DataKeyNames="reportID" DataSourceID="dsReport">
                    <ItemTemplate>
                        <asp:Label ID="reportFileLabel" runat="server" Text='<%# Bind("reportFile") %>' Visible="False" />
                        <h1>
                            <asp:Label ID="reportTitleLabel" runat="server" Text='<%# Bind("reportTitle") %>'
                                Font-Size="12" /></h1>
                        <asp:Label ID="reportDescLabel" runat="server" Text='<%# Bind("reportDescription") %>'></asp:Label><br />
                    </ItemTemplate>
                </asp:FormView>
                <table style="width: 100%; margin-top: 10px;" cellspacing="0">
                    <asp:Repeater ID="repeaterParams" runat="server" DataSourceID="dsParams">
                        <ItemTemplate>
                            <tr>
                                <td valign="middle" align="right" nowrap="nowrap" width="50%">
                                    <asp:Label ID="paramTitleLabel" runat="server" Text='<%# Bind("paramTitle") %>' Font-Size="10"
                                        Visible='<%# Eval("paramVisible") %>' />
                                    &nbsp;
                                </td>
                                <td valign="middle" width="50%">
                                    <asp:Label ID="paramNameLabel" runat="server" Text='<%# Bind("paramName") %>' Visible="false" />
                                    <asp:Label ID="paramIsIDLabel" runat="server" Text='<%# Bind("paramIsID") %>' Visible="false" />
                                    <asp:Label ID="paramIsOptionalLabel" runat="server" Text='<%# Bind("paramIsOptional") %>'
                                        Visible="false" />
                                    <asp:Label ID="paramIsSetting" runat="server" Text='<%# Bind("paramSetting") %>' Visible="false"></asp:Label>

                                    <asp:Label ID="paramOptionalIDLabel" runat="server" Text='<%# Bind("paramOptionalID") %>'
                                        Visible="false" />
                                    <asp:Label ID="paramIdLabel" runat="server" Text='<%# Bind("paramID") %>' Visible="false" />
                                    <asp:Label ID="paramControlLabel" runat="server" Text='<%# Bind("paramControl") %>'
                                        Visible="False" />
                                    <asp:Label ID="paramDataLabel" runat="server" Visible='<%# Bind("paramIsOptional") and Eval("paramVisible") %>'
                                        Text='<%# Bind("paramData") %>' Font-Bold="True"></asp:Label>
                                    <asp:TextBox runat="server" ID="txtParam" Width="150" Visible='<%# (Eval("paramControl").trim = "textbox") and Eval("paramVisible") and not Eval("paramIsOptional") and not isnull(Eval("paramSetting"),false) %>'
                                        Font-Size="8"></asp:TextBox>
                                    <asp:ImageButton runat="server" ID="imbCalendar" Visible='<%# (Eval("paramControl").trim = "calendar") and Eval("paramVisible") and not Eval("paramIsOptional") %>'
                                        ImageUrl="~/images/icons/16x16/calendar (1).png" ImageAlign="Bottom" />
                                    <asp:TextBox runat="server" ID="calParam" Width="100" Font-Size="8" Visible='<%# (Eval("paramControl").trim = "calendar") and Eval("paramVisible") and not Eval("paramIsOptional") %>' ></asp:TextBox>
                                    <asp:Image runat="server" ID="imgReq" ImageAlign="Middle" Visible="false" ImageUrl="~/images/icons/16x16/question.png" />
                                    <cc1:CalendarExtender ID="txtDate_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="calParam" PopupButtonID="imbCalendar" Format="MMM dd, yyyy">
                                    </cc1:CalendarExtender>
                                    <asp:CheckBox ID="chkParam" runat="server" Visible='<%# (Eval("paramControl").trim = "checkbox") and Eval("paramVisible") and not Eval("paramIsOptional") %>'
                                        Font-Size="8" />
                                    <asp:HiddenField ID="hflCalendar" runat="server" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
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

<asp:Panel ID="pnlSettings" runat="server" Width="420px" CssClass="modalPopUpBig" BackColor="White"
    BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" Style="display: none;">
    <div style="text-align: right; position: relative; top: 3px; right: 1px;">
        <asp:ImageButton ID="imbClose1" runat="server" ImageUrl="~/images/misc/del.png" CausesValidation="False" />
    </div>
    <div id="Div1" style="padding: 0 10px 0 10px; position: relative; top: -10px;">

        <table style="width: 100%; margin-top: 10px;" cellspacing="0">
            <asp:Repeater ID="repSettings" runat="server" DataSourceID="dsSettings">
                <ItemTemplate>
                    <tr>
                        <td valign="middle" align="right" nowrap="nowrap" width="50%">
                            <asp:Label ID="paramIdLabel" runat="server" Text='<%# Bind("paramID") %>' Visible="false" /><asp:Label ID="reportIdLabel" runat="server" Text='<%# Bind("reportId") %>' Visible="false" />
                            <asp:Label ID="paramTitleLabel" runat="server" Text='<%# Bind("paramTitle") %>' Font-Size="10" />
                            &nbsp;
                        </td>
                        <td valign="middle" width="50%">
                            <asp:TextBox runat="server" ID="txtParamValue" Width="150" Font-Size="8" Text='<%# Eval("paramValue")  %>'></asp:TextBox>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <div class="portletbox" style="text-align: center; margin-top: 5px; padding-top: 5px; margin-right: 80px; margin-left: 80px; padding-bottom: 10px;">
            <asp:Label ID="lblErrorSettings" runat="server" Style="font-size: 8px; color: Red; padding-top: 5px; margin-bottom: 10px;"></asp:Label><br />
            <br />
            <asp:Button ID="btnSaveSettings" runat="server" Text="Guardar"
                CssClass="button" />
        </div>

    </div>
</asp:Panel>



<asp:HiddenField ID="hfReportType" runat="server" />
<asp:HiddenField ID="hfDBname" runat="server" />
<asp:HiddenField ID="hfDBServer" runat="server" />
<asp:HiddenField ID="hfParamID" runat="server" />
<asp:HiddenField ID="hfParamOptional1" runat="server" />
<asp:HiddenField ID="hfParamOptional2" runat="server" />
<asp:HiddenField ID="hfParamOptional3" runat="server" />
<asp:HiddenField ID="hfParamOptional4" runat="server" />
<asp:HiddenField ID="hfParamOptional5" runat="server" />
<asp:HiddenField ID="hfParamOptional6" runat="server" />
<asp:HiddenField ID="hfParamOptional7" runat="server" />
<asp:HiddenField ID="hfParamOptional8" runat="server" />
<asp:HiddenField ID="hfParamOptional9" runat="server" />
<asp:HiddenField ID="hflParamOptionalLabel1" runat="server" />
<asp:HiddenField ID="hflParamOptionalLabel2" runat="server" />
<asp:HiddenField ID="hflParamOptionalLabel3" runat="server" />
<asp:HiddenField ID="hflParamOptionalLabel4" runat="server" />
<asp:HiddenField ID="hflParamOptionalLabel5" runat="server" />
<asp:HiddenField ID="hflParamOptionalLabel6" runat="server" />
<asp:HiddenField ID="hflParamOptionalLabel7" runat="server" />
<asp:HiddenField ID="hflParamOptionalLabel8" runat="server" />
<asp:HiddenField ID="hflParamOptionalLabel9" runat="server" />
<asp:SqlDataSource ID="dsParams" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>"
    SelectCommand="SELECT tblReportParameters.reportID, tblReportParameters.paramName, tblReportParameters.paramType, tblReportParameters.paramTitle, ISNULL(tblReportParameters.paramVisible, 0) AS paramVisible, ISNULL(tblReportParameters.paramIsID, 0) AS paramIsID, ISNULL(tblReportParameters.paramIsOptional, 0) AS paramIsOptional, tblReportParameters.paramOptionalID, tblReportParametersType.paramControl, tblReportParameters.paramID, tblReportParameters.paramValue AS paramData, tblReportParameters.paramSetting FROM tblReportParameters LEFT OUTER JOIN tblReportParametersType ON tblReportParameters.paramType = tblReportParametersType.paramType WHERE (tblReportParameters.reportID = @rID) ORDER BY tblReportParameters.paramID">
    <SelectParameters>
        <asp:SessionParameter Name="rID" SessionField="ReportID" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="dsSettings" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>"
    SelectCommand="SELECT tblReportParameters.paramID, tblReportParameters.paramName, tblReportParameters.paramTitle, tblReportParameters.paramOptionalID, tblReports.reportType, tblReportParameters.paramValue, tblReports.reportTitle, tblReports.reportID, tblReportParameters.paramSetting FROM tblReportParameters INNER JOIN tblReports ON tblReportParameters.reportID = tblReports.reportID WHERE (tblReports.reportType = @reportType) AND (tblReportParameters.paramSetting = 1) ORDER BY tblReportParameters.paramID">
    <SelectParameters>
        <asp:ControlParameter ControlID="hfReportType" Name="reportType"
            PropertyName="Value" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:HiddenField ID="hfItemClass" runat="server" />
<asp:HiddenField ID="hflShowSettings" runat="server" Value="false" />
<asp:SqlDataSource ID="dsReport" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>"
    SelectCommand="SELECT reportID, reportFile, reportTitle, reportType, reportIcon, reportDescription, DatabaseServerName, DatabaseName, ISNULL(allowDOC, 0) AS allowDOC, ISNULL(allowPDF, 0) AS allowPDF, ISNULL(allowXLS, 0) AS allowXLS, ISNULL(allowXLT, 0) AS allowXLT FROM tblReports WHERE (reportID = @reportID)">
    <SelectParameters>
        <asp:SessionParameter Name="reportID" SessionField="ReportID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
