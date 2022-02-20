Imports System.Threading
Partial Class getReport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try
            Dim reportFile As String = Request.QueryString("reportFile")
            Dim reportTitle As String = Request.QueryString("reportTitle")
            Dim reportType As String = Request.QueryString("reportType")

            Dim repContentType As String
            Select Case reportType
                Case "DOC"
                    repContentType = "application/msword"
                Case "XLS"
                    repContentType = "application/vnd.ms-excel"
                Case "PDF"
                    repContentType = "application/pdf"
            End Select

            Response.ClearContent()
            Response.ClearHeaders()
            Response.AddHeader("Content-Disposition", "attachment; filename=" & reportTitle & "." & reportType)
            Response.ContentType = repContentType
            Response.WriteFile(reportFile)
            Response.Flush()
            Response.Close()
            Response.End()

            Thread.Sleep(5000)
            System.IO.File.Delete(reportFile)
        Catch ex As Exception

        Finally


        End Try
    End Sub
End Class
