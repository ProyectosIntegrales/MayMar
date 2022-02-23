
Partial Class App_Controls_cntrlSalidas
    Inherits System.Web.UI.UserControl

    Protected Sub Me_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        GridView1.DataBind()
        GridView2.DataBind()
    End Sub
    Protected Sub timer_click() Handles Timer1.Tick
        GridView1.DataBind()
        GridView2.DataBind()
    End Sub
    Protected Sub btnSalida_Click(sender As Object, e As EventArgs)
        Timer1.Enabled = False
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
        Timer1.Enabled = True
    End Sub

    Protected Sub btnCantel(sender As Object, e As EventArgs) Handles btnNo.Click
        Timer1.Enabled = True
    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            Dim btn As Button = e.Row.FindControl("btnSalida")
            btn.Visible = Session("IsCaseta")
        End If
    End Sub
End Class
