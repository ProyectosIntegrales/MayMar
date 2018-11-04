
Partial Class App_Controls_cntrlWelcome
    Inherits System.Web.UI.UserControl

    Public Event LoginClicked()


    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        RaiseEvent LoginClicked()
    End Sub
End Class
