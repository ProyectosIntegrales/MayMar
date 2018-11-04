Imports System.Data
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
Imports CrystalDecisions.ReportSource
Imports System.Threading
Imports System.IO
Imports System.Net

Partial Class cntrlReports
    Inherits System.Web.UI.UserControl

    '   Public Event LinkClicked(ByVal id As Integer)

    Public Property ReportType() As String
        Get
            Return hfReportType.Value
        End Get
        Set(ByVal value As String)
            hfReportType.Value = value
        End Set
    End Property

    Public WriteOnly Property ParamID As String
        Set(ByVal value As String)
            hfParamID.Value = value
        End Set

    End Property

    Public WriteOnly Property ParamOptional1() As String
        Set(ByVal value As String)
            hfParamOptional1.Value = value
        End Set

    End Property

    Public WriteOnly Property ParamOptional1Label() As String
        Set(ByVal value As String)
            hflParamOptionalLabel1.Value = value
        End Set

    End Property

    Public WriteOnly Property ParamOptional2() As String
        Set(ByVal value As String)
            hfParamOptional2.Value = value
        End Set

    End Property

    Public WriteOnly Property ParamOptional2Label() As String
        Set(ByVal value As String)
            hflParamOptionalLabel2.Value = value
        End Set

    End Property

    Public WriteOnly Property ParamOptional3() As String
        Set(ByVal value As String)
            hfParamOptional3.Value = value
        End Set

    End Property

    Public WriteOnly Property ParamOptional3Label() As String
        Set(ByVal value As String)
            hflParamOptionalLabel3.Value = value
        End Set

    End Property

    Public WriteOnly Property ParamOptional4() As String
        Set(ByVal value As String)
            hfParamOptional4.Value = value
        End Set

    End Property

    Public WriteOnly Property ParamOptional4Label() As String
        Set(ByVal value As String)
            hflParamOptionalLabel4.Value = value
        End Set

    End Property

    Public WriteOnly Property ParamOptional5() As String
        Set(ByVal value As String)
            hfParamOptional5.Value = value
        End Set

    End Property

    Public WriteOnly Property ParamOptional5Label() As String
        Set(ByVal value As String)
            hflParamOptionalLabel5.Value = value
        End Set

    End Property

    Public WriteOnly Property ParamOptional6() As String
        Set(ByVal value As String)
            hfParamOptional6.Value = value
        End Set

    End Property

    Public WriteOnly Property ParamOptional6Label() As String
        Set(ByVal value As String)
            hflParamOptionalLabel6.Value = value
        End Set

    End Property

    Public WriteOnly Property ParamOptional7() As String
        Set(ByVal value As String)
            hfParamOptional7.Value = value
        End Set

    End Property

    Public WriteOnly Property ParamOptional7Label() As String
        Set(ByVal value As String)
            hflParamOptionalLabel7.Value = value
        End Set

    End Property

    Public WriteOnly Property ParamOptional8() As String
        Set(ByVal value As String)
            hfParamOptional8.Value = value
        End Set

    End Property

    Public WriteOnly Property ParamOptional8Label() As String
        Set(ByVal value As String)
            hflParamOptionalLabel8.Value = value
        End Set

    End Property

    Public WriteOnly Property ParamOptional9() As String
        Set(ByVal value As String)
            hfParamOptional9.Value = value
        End Set

    End Property

    Public WriteOnly Property ParamOptional9Label() As String
        Set(ByVal value As String)
            hflParamOptionalLabel9.Value = value
        End Set

    End Property

    Public WriteOnly Property Header() As String
        Set(ByVal value As String)
            If value.Trim <> "" Then
                lblHeader.Text = value
                pnlHeader.Visible = True
            Else
                pnlHeader.Visible = False
            End If
        End Set
    End Property

    Public WriteOnly Property HeaderClass() As String
        Set(ByVal value As String)
            lblHeader.CssClass = value

        End Set
    End Property

    Public WriteOnly Property ItemClass As String
        Set(ByVal value As String)
            hfItemClass.Value = value
        End Set
    End Property

    Public WriteOnly Property Orientation As String
        Set(value As String)
            Select Case value
                Case "H"
                    DataList1.RepeatColumns = 100
                    pnlMenu.Width = Nothing
                Case "V"
                    DataList1.RepeatColumns = 1
                    pnlMenu.Width = 148
            End Select
        End Set
    End Property

    Public WriteOnly Property ShowSettings As Boolean
        Set(value As Boolean)
            hflShowSettings.Value = value
            showSettingsButton()
        End Set
    End Property


    Public Event Closed()

    Public Sub Refresh()
        dsReports.DataBind()
        repeaterParams.DataBind()
    End Sub

    Protected Sub showSettingsButton()
        Dim dt As New DataTable
        dt = SQLDataTable("SELECT dbo.tblReports.reportType, dbo.tblReportParameters.paramSetting FROM dbo.tblReports INNER JOIN dbo.tblReportParameters ON dbo.tblReports.reportID = dbo.tblReportParameters.reportID GROUP BY dbo.tblReports.reportType, dbo.tblReportParameters.paramSetting HAVING (dbo.tblReports.reportType = '" & hfReportType.Value & "') AND (dbo.tblReportParameters.paramSetting = 1)")

        If Not dt Is Nothing Then
            If dt.Rows.Count > 0 Then
                If hflShowSettings.Value Then
                    imbSettings.Visible = True
                End If
            End If
        End If


    End Sub

    Public Sub goReport(ByVal sender As LinkButton, ByVal e As EventArgs)
        Dim lb As LinkButton = sender
        Session("ReportID") = lb.CommandArgument
        '  RaiseEvent LinkClicked(lb.CommandArgument)

        lblError.Text = ""

        Dim dv As DataView = DirectCast(dsReport.Select(DataSourceSelectArguments.Empty), DataView)

        btnDOC.Visible = dv.Table.Rows(0).Item("allowDOC")
        btnXLS.Visible = dv.Table.Rows(0).Item("allowXLS")
        btnXLD.Visible = dv.Table.Rows(0).Item("allowXLT")
        btnPDF.Visible = dv.Table.Rows(0).Item("allowPDF")

        If Math.Abs(CInt(btnDOC.Visible) + CInt(btnXLS.Visible) + CInt(btnXLD.Visible) + CInt(btnPDF.Visible)) <> 1 Then
            mdlPopup.Show()
            repeaterParams.DataBind()
        Else

            If btnDOC.Visible Then
                If validateParams() Then GenerarReporte("doc", ExportFormatType.WordForWindows)
            End If

            If btnXLS.Visible Then
                If validateParams() Then GenerarReporte("xls", ExportFormatType.Excel)
            End If

            If btnXLD.Visible Then
                If validateParams() Then GenerarReporte("xls", ExportFormatType.ExcelRecord)
            End If

            If btnPDF.Visible Then
                If validateParams() Then GenerarReporte("pdf", ExportFormatType.PortableDocFormat)
            End If
        End If


    End Sub

    Private Function validateParams() As Boolean
        Dim result As Boolean = True
        For Each ri As RepeaterItem In repeaterParams.Items
            Dim pOptional As Boolean = DirectCast(ri.FindControl("paramIsOptionalLabel"), Label).Text
            If Not pOptional Then
                Dim txtP As TextBox = DirectCast(ri.FindControl("txtParam"), TextBox)
                Dim txtD As TextBox = DirectCast(ri.FindControl("calParam"), TextBox)
                DirectCast(ri.FindControl("imgReq"), Image).Visible = False
                If txtP.Visible Or txtD.Visible Then
                    If txtP.Text.Trim = "" And txtD.Text.Trim = "" Then
                        DirectCast(ri.FindControl("imgReq"), Image).Visible = True
                        result = False
                    End If
                End If
            End If
        Next
        If Not result Then
            mdlPopup.Show()
            lblError.Text = "Error en parametros"
        End If

        Return result
    End Function

    Protected Sub genDOC(ByVal sender As Object, ByVal e As ImageClickEventArgs) Handles btnDOC.Click
        If validateParams() Then GenerarReporte("doc", ExportFormatType.WordForWindows)
    End Sub

    Protected Sub genXLS(ByVal sender As Object, ByVal e As ImageClickEventArgs) Handles btnXLS.Click
        If validateParams() Then GenerarReporte("xls", ExportFormatType.Excel)
    End Sub

    Protected Sub genXLD(ByVal sender As Object, ByVal e As ImageClickEventArgs) Handles btnXLD.Click
        If validateParams() Then GenerarReporte("xls", ExportFormatType.ExcelRecord)
    End Sub

    Protected Sub genPDF(ByVal sender As Object, ByVal e As ImageClickEventArgs) Handles btnPDF.Click
        If validateParams() Then GenerarReporte("pdf", ExportFormatType.PortableDocFormat)
    End Sub

    Protected Sub GenerarReporte(ByVal exportExtension As String, ByVal exportFormat As ExportFormatType)

        Try

            Dim dv As DataView = DirectCast(dsReport.Select(DataSourceSelectArguments.Empty), DataView)
            Dim dr As DataRow = dv.Item(0).Row

            Dim reportFile As String = dr.Item("reportFile")
            Dim reportName As String = Mid(reportFile, reportFile.LastIndexOf("/") + 2)
            Dim reportTitle As String = dr.Item("reportTitle").ToString.Trim
            Dim serverName As String = dr.Item("DatabaseServerName")
            Dim databaseName As String = dr.Item("DatabaseName")

            Dim oDfDopt As New DiskFileDestinationOptions
            Dim expo As New ExportOptions

            '  Dim reportName As String = reportFile

            Dim strCrystalReportFilePath As String = reportFile
            Dim oRDoc As New ReportDocument

            Dim strFileDestinationPath As String = MapPath("~/_temp/" & reportName.Replace(".", "_") & "_" & Session.SessionID.ToString & Now.GetHashCode & ".tmp")

            oRDoc.Load(MapPath(strCrystalReportFilePath)) 'loads the crystalreports in to the memory
            'oRDoc.RecordSelectionFormula = sRecSelFormula 'used if u want pass the query to u r crystal form
            'oRDoc.RecordSelectionFormula = "{vDocuments.documentDeptoID} = " & hfParamOptional1.Value

            Dim dvParams As DataView = DirectCast(dsParams.Select(DataSourceSelectArguments.Empty), DataView)

            'repeaterParams.DataBind()
            For Each r As RepeaterItem In repeaterParams.Items

                Dim paramControlType As String = DirectCast(r.FindControl("paramControlLabel"), Label).Text.Trim
                Dim paramVisible As Boolean = DirectCast(r.FindControl("paramTitleLabel"), Label).Visible
                Dim paramIsID As Boolean = DirectCast(r.FindControl("paramIsIdLabel"), Label).Text.Trim
                Dim paramIsOptional As Boolean = DirectCast(r.FindControl("paramIsOptionalLabel"), Label).Text.Trim
                Dim paramOptionalID As String = DirectCast(r.FindControl("paramOptionalIDLabel"), Label).Text.Trim

                Dim paramData As String = String.Empty

                If paramIsID Then
                    'Default ID
                    paramData = hfParamID.Value
                ElseIf paramIsOptional Then
                    paramData = DirectCast(FindControl("hfParamOptional" & paramOptionalID), HiddenField).Value
                Else
                    Select Case paramControlType
                        Case "textbox"
                            paramData = DirectCast(r.FindControl("txtParam"), TextBox).Text.Trim
                        Case "calendar"
                            'paramData = DirectCast(r.FindControl("txtDate_CalendarExtender"), AjaxControlToolkit.CalendarExtender).SelectedDate
                            paramData = CDate(DirectCast(r.FindControl("calParam"), TextBox).Text)
                        Case "checkbox"
                            paramData = DirectCast(r.FindControl("chkParam"), CheckBox).Checked
                    End Select

                End If

                Dim paramName As String = DirectCast(r.FindControl("paramNameLabel"), Label).Text.Trim
                If DirectCast(r.FindControl("paramIsSetting"), Label).Text = "True" Then
                    paramData = getSettingValue(Session("ReportID"), DirectCast(r.FindControl("paramIdLabel"), Label).Text)
                    ' paramData = DirectCast(r.FindControl("paramDataLabel"), Label).Text
                End If

                Dim pc As Integer = oRDoc.ParameterFields.Count

                Dim ps As CrystalDecisions.Shared.ParameterFields = oRDoc.ParameterFields

                For Each p As CrystalDecisions.Shared.ParameterField In ps
                    If p.Name = paramName Then
                        If p.ReportName = "" Then
                            oRDoc.SetParameterValue(paramName, paramData)
                        Else
                            oRDoc.SetParameterValue(paramName, paramData, p.ReportName)
                        End If
                    End If

                Next


            Next

            oDfDopt.DiskFileName = strFileDestinationPath 'path of file where u want to locate ur PDF
            oRDoc.SetDatabaseLogon("maymaruser", "mm2016")
            expo = oRDoc.ExportOptions
            expo.ExportDestinationType = ExportDestinationType.DiskFile
            expo.ExportFormatType = exportFormat
            expo.DestinationOptions = oDfDopt

            Dim ci As New ConnectionInfo
            ci.DatabaseName = databaseName
            ci.ServerName = serverName
            ci.UserID = "maymaruser"
            ci.Password = "mm2016"
            ci.Type = ConnectionInfoType.SQL

            For Each T As Table In oRDoc.Database.Tables
                Dim TLogonInfo As TableLogOnInfo = T.LogOnInfo
                TLogonInfo.ConnectionInfo = ci
                T.ApplyLogOnInfo(TLogonInfo)
            Next

            oRDoc.Export()
            oRDoc.Close()
            oRDoc.Dispose()

            If System.Web.HttpContext.Current.Request.Url.IsDefaultPort Then
                Response.Redirect("/app_addins/getReport.aspx?reportFile=" & strFileDestinationPath & "&reportTitle=" & reportTitle & "&reportType=" & exportExtension, False)
            Else
                Response.Redirect("~/app_addins/getReport.aspx?reportFile=" & strFileDestinationPath & "&reportTitle=" & reportTitle & "&reportType=" & exportExtension, False)
            End If

            'System.Diagnostics.Process.Start(System.Web.HttpContext.Current.Request.Url.AbsoluteUri.Replace("Default.aspx", "").Replace("default.aspx", "") & "app_addins/getReport.aspx?reportFile=" & strFileDestinationPath & "&reportTitle=" & reportTitle & "&reportType=" & exportExtension)

            mdlPopup.Hide()
            RaiseEvent Closed()

        Catch ex As Exception
            mdlPopup.Show()
            lblError.Text = ex.Message
        End Try

    End Sub

    Protected Function getSettingValue(reportId As Integer, paramId As Integer) As Object
        Dim dt As New DataTable
        dt = SQLDataTable("Select paramValue from tblReportParameters where reportId = " & reportId & " and paramId = " & paramId)
        If dt.Rows.Count = 1 Then
            Return dt.Rows(0).Item(0)
        Else
            Return 0
        End If

    End Function

    Protected Sub DataList1_ItemCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemCreated

        DirectCast(e.Item.FindControl("reportTitleLinkButton1"), LinkButton).CssClass = hfItemClass.Value
    End Sub

    Protected Sub repeaterParams_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles repeaterParams.ItemDataBound
        If repeaterParams.Visible Then
            Dim paramID As Integer = DirectCast(e.Item.FindControl("paramOptionalIDLabel"), Label).Text
            Dim paramLabel As String = DirectCast(FindControl("hflParamOptionalLabel" & paramID), HiddenField).Value
            Dim paramIsSetting As Boolean = DirectCast(e.Item.FindControl("paramIsSetting"), Label).Text = "True"
            Dim paramData As Object = DirectCast(FindControl("hfParamOptional" & paramID), HiddenField).Value

            If Not paramIsSetting Then
                DirectCast(e.Item.FindControl("paramDataLabel"), Label).Text = IIf(paramLabel <> "", paramLabel, paramData)
            End If
        End If

    End Sub

    Protected Sub imbSettings_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles imbSettings.Click
        mdlSettins.Show()
    End Sub

    Protected Sub btnSaveSettings_Click(sender As Object, e As System.EventArgs) Handles btnSaveSettings.Click
        For Each i As RepeaterItem In repSettings.Items
            lblErrorSettings.Text = doSQLProcedure("update tblReportParameters set paramValue = '" & DirectCast(i.FindControl("txtParamValue"), TextBox).Text & "' where paramId = " & DirectCast(i.FindControl("paramIdLabel"), Label).Text & " and reportId = " & DirectCast(i.FindControl("reportIdLabel"), Label).Text, CommandType.Text)
        Next
        mdlSettins.Hide()
    End Sub

    Protected Sub imbClose_Click(sender As Object, e As ImageClickEventArgs) Handles imbClose.Click
        RaiseEvent Closed()
    End Sub

    Protected Sub imbClose1_Click(sender As Object, e As ImageClickEventArgs) Handles imbClose1.Click
        RaiseEvent Closed()
    End Sub

    Protected Sub txtCalendar(sender As Object, e As EventArgs)
        Dim t As TextBox = sender
        Dim h As HiddenField = DirectCast(t.Parent.FindControl("hflCalendar"), HiddenField)
        h.Value = CDate(t.Text)
        mdlPopup.Show()
    End Sub
End Class
