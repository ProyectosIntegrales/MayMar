Imports System.Data
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
Imports CrystalDecisions.ReportSource
Imports System.Threading
Imports System.IO
Imports System.Net

Partial Class cntrlRepAnexo29XLS
    Inherits System.Web.UI.UserControl

    '   Public Event LinkClicked(ByVal id As Integer)




    Public Event Closed()



    Public Sub goReport()


        lblError.Text = ""


        mdlPopup.Show()
        If Math.Abs(CInt(btnDOC.Visible) + CInt(btnXLS.Visible) + CInt(btnXLD.Visible) + CInt(btnPDF.Visible)) <> 1 Then
            mdlPopup.Show()

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

        If Not IsDate(txtFIni.Text) Or Not IsDate(txtFFin.Text) Then
            result = False
        End If

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

            'Dim dv As DataView = DirectCast(dsReport.Select(DataSourceSelectArguments.Empty), DataView)
            'Dim dr As DataRow = dv.Item(0).Row

            Dim reportFile As String = "~/reports/Anexo29Reporte.rpt"
            Dim reportName As String = "Anexo29Reporte.rpt"
            Dim reportTitle As String = "Anexo 29 XLS"
            Dim serverName As String = ".\SQLEXPRESS"
            Dim databaseName As String = "Maymar"

            Dim oDfDopt As New DiskFileDestinationOptions
            Dim expo As New ExportOptions

            '  Dim reportName As String = reportFile

            Dim strCrystalReportFilePath As String = reportFile
            Dim oRDoc As New ReportDocument

            Dim strFileDestinationPath As String = MapPath("~/_temp/" & reportName.Replace(".", "_") & "_" & Session.SessionID.ToString & Now.GetHashCode & ".tmp")

            oRDoc.Load(MapPath(strCrystalReportFilePath)) 'loads the crystalreports in to the memory

            oRDoc.SetParameterValue("FechaIni", txtFIni.Text)
            oRDoc.SetParameterValue("FechaFin", txtFFin.Text)




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

    Protected Sub imbClose_Click(sender As Object, e As ImageClickEventArgs) Handles imbClose.Click
        RaiseEvent Closed()
    End Sub



    Protected Sub txtCalendar(sender As Object, e As EventArgs)
        Dim t As TextBox = sender
        Dim h As HiddenField = DirectCast(t.Parent.FindControl("hflCalendar"), HiddenField)
        h.Value = CDate(t.Text)
        mdlPopup.Show()
    End Sub


End Class
