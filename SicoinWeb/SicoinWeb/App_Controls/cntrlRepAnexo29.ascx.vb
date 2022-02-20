Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
Imports CrystalDecisions.ReportSource
Imports System.Data

Partial Class App_Controls_cntrlRepAnexo29
    Inherits System.Web.UI.UserControl

    Public Sub goReport(Folio As String)
        mdlPopup.Show()
        reportTitleLabel.Text = "Anexo 29 - Folio: " & Folio
        hflFolio.Value = Folio

    End Sub
    Public Sub GenerarReporte()

        Dim FileDestinationPath As String, reportTitle As String, exportExtension As String = "PDF"
        Try
            Dim folioNum As String = hflFolio.Value

            Dim reportFile As String = "~/reports/Anexo29.rpt"
            Dim reportName As String = Mid(reportFile, reportFile.LastIndexOf("/") + 2)
            reportTitle = "Anexo 29 - Folio: " & folioNum
            Dim serverName As String = ".\SQLEXPRESS"
            Dim databaseName As String = "Maymar"

            Dim dvs As DataView = DirectCast(dsServer.Select(DataSourceSelectArguments.Empty), DataView)
            Dim drs As DataRow = dvs.Item(0).Row

            If Not drs Is DBNull.Value Then
                serverName = drs.Item("ServerName")
                databaseName = drs.Item("DatabaseName")
            End If

            Dim oDfDopt As New DiskFileDestinationOptions
            Dim expo As New ExportOptions

            '  Dim reportName As String = reportFile

            Dim strCrystalReportFilePath As String = reportFile
            Dim oRDoc As New ReportDocument

            FileDestinationPath = MapPath("~/_temp/" & reportName.Replace(".", "_") & "_" & Session.SessionID.ToString & Now.GetHashCode & ".tmp")

            oRDoc.Load(MapPath(strCrystalReportFilePath)) 'loads the crystalreports in to the memory
            oRDoc.SetParameterValue("Folio", folioNum)

            oDfDopt.DiskFileName = FileDestinationPath 'path of file where u want to locate ur PDF
            oRDoc.SetDatabaseLogon("maymaruser", "mm2016")
            expo = oRDoc.ExportOptions
            expo.ExportDestinationType = ExportDestinationType.DiskFile
            expo.ExportFormatType = ExportFormatType.PortableDocFormat
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

            Dim isDefPort As Boolean
            isDefPort = System.Web.HttpContext.Current.Request.Url.IsDefaultPort

            If isDefPort Then
                Response.Redirect("/app_addins/getReport.aspx?reportFile=" & FileDestinationPath & "&reportTitle=" & reportTitle & "&reportType=" & exportExtension, False)
            Else
                Response.Redirect("~/app_addins/getReport.aspx?reportFile=" & FileDestinationPath & "&reportTitle=" & reportTitle & "&reportType=" & exportExtension, False)
            End If



        Catch ex As Exception

            cntrlError.errorMessage = ex.Message
        End Try

    End Sub

    Public Event Closed()


    Protected Sub btnPDF_Click(sender As Object, e As ImageClickEventArgs) Handles btnPDF.Click

        mdlPopup.Hide()
        RaiseEvent Closed()
        GenerarReporte()

    End Sub

    Protected Sub imbClose_Click(sender As Object, e As ImageClickEventArgs) Handles imbClose.Click
        mdlPopup.Hide()
        RaiseEvent Closed()
    End Sub
End Class
