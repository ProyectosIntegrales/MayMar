
Partial Class App_Controls_cntrlSalidas
    Inherits System.Web.UI.UserControl

    Protected Sub btnSalida_Click(sender As Object, e As EventArgs)
        Dim b As Button = sender
        Dim args As String() = b.CommandArgument.Split(",")
        hflID.Value = args(0)
        lblOperacion.Text = args(1)
        lblCaja.Text = args(2)
        pnlConfirm_ModalPopupExtender.Show()
    End Sub

    Protected Sub btnConfirm_Click(sender As Object, e As EventArgs) Handles btnYes.Click
        doSQLProcedure("spAcceptOut", Data.CommandType.StoredProcedure,,
                       "@id", hflID.Value,
                       "@username", Session("Username"))
        GridView1.DataBind()
        GridView2.DataBind()
    End Sub
End Class
