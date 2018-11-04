
Partial Class App_Controls_cntrlConsulta
    Inherits System.Web.UI.UserControl


    Protected Sub btnInventario_Click(sender As Object, e As EventArgs) Handles btnInventario.Click
        cntrlReporte.goReport()
    End Sub

    Protected Sub btnAnexo29_Click(sender As Object, e As EventArgs) Handles btnAnexo29.Click
        cntrlRepAnexo29XLS.goReport()
    End Sub

    Protected Sub btnAban_Click(sender As Object, e As EventArgs) Handles btnAban.Click
        cntrlRepAbandono.goReport()
    End Sub
End Class
