
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
Imports System.Data

Partial Class App_Controls_cntrlAlmacenaje
    Inherits System.Web.UI.Page

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        GVDatabind()
    End Sub

    Protected Sub GVDatabind()

        Dim d As String = DropDownList1.SelectedValue
        Dim y As String = Split(d, "-")(0)
        Dim m As String = Split(d, "-")(1)

        Dim cn As SqlClient.SqlConnection = New SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("MayMarCS").ToString)

        Dim cm As New SqlClient.SqlCommand("spAlmacenaje", cn)
        cm.CommandType = CommandType.StoredProcedure
        cm.Parameters.AddWithValue("@year", y)
        cm.Parameters.AddWithValue("@month", m)

        Dim da As New SqlClient.SqlDataAdapter(cm)
        da.SelectCommand.CommandTimeout = 1000
        Dim ds As New DataSet
        da.Fill(ds)

        GridView1.DataSource = ds

        GridView1.DataBind()

    End Sub

    Private Sub App_Controls_cntrlAlmacenaje_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            DropDownList1.DataBind()
            GVDatabind()
        End If


    End Sub
    Protected Sub lnbExp_Click(sender As Object, e As EventArgs) Handles lnbExp.Click

        Dim dt As String = DropDownList1.SelectedValue

        Dim y As String = dt.Split("-")(0)
        Dim m As String = dt.Split("-")(1)

        Dim idate As Date = CDate(m & "/01/" & y)

        Dim fnxm As String = IIf(CInt(m) = 12, 1, CInt(m) + 1)
        Dim fnxy As String = IIf(CInt(m) = 12, CInt(y) + 1, y)

        Dim fnxd As String = fnxy & "/" & fnxm & "/1"
        Dim fnxdate As Date = CDate(fnxd).AddDays(-1)


        Dim fdate As String = fnxdate.ToString(Format("MM/dd/yyyy"))

        GenerarReporte(idate, fdate, "xls", ExportFormatType.Excel)


    End Sub

    Protected Sub GenerarReporte(FIni As String, FFin As String, ByVal exportExtension As String, ByVal exportFormat As ExportFormatType)

        Try

            'Dim dv As DataView = DirectCast(dsReport.Select(DataSourceSelectArguments.Empty), DataView)
            'Dim dr As DataRow = dv.Item(0).Row

            Dim reportFile As String = "~/reports/Almacenaje.rpt"
            Dim reportName As String = "Almacenaje.rpt"
            Dim reportTitle As String = "Almacenaje"
            Dim serverName As String = ".\SQLEXPRESS"
            Dim databaseName As String = "Maymar"

            Dim oDfDopt As New DiskFileDestinationOptions
            Dim expo As New ExportOptions

            '  Dim reportName As String = reportFile

            Dim strCrystalReportFilePath As String = reportFile
            Dim oRDoc As New ReportDocument

            Dim strFileDestinationPath As String = MapPath("~/_temp/" & reportName.Replace(".", "_") & "_" & Session.SessionID.ToString & Now.GetHashCode & ".tmp")

            oRDoc.Load(MapPath(strCrystalReportFilePath)) 'loads the crystalreports in to the memory

            oRDoc.SetParameterValue("FechaIni", FIni)
            oRDoc.SetParameterValue("FechaFin", FFin)
            'oRDoc.SetParameterValue("FechaAb", txtFAban.Text)



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



        Catch ex As Exception
            Console.Write(ex.ToString())
        End Try

    End Sub
End Class
