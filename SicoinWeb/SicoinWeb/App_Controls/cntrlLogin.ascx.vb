Imports System.Data
Partial Class App_Controls_cntrlLogin
    Inherits System.Web.UI.UserControl

    Public Event LoginOK(Username As String)
    Public Event Cancel()
    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        txtPassword.Text = Nothing
        txtUsername.Text = Nothing
        txtUsername.Focus()
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        lblError.Text = ""
        RaiseEvent Cancel()
    End Sub

    Protected Sub btnOK_Click(sender As Object, e As EventArgs) Handles btnOK.Click
        Dim OK As Boolean = False
        Dim dt As DataTable = SQLDataTable("SELECT * FROM tblUsers WHERE Username = '" & txtUsername.Text & "' AND [Password] = '" & txtPassword.Text & "'")
        If Not dt Is Nothing Then
            If dt.Rows.Count = 1 Then
                Session.Timeout = 30
                Session("Username") = txtUsername.Text
                lblError.Text = ""
                OK = True
                RaiseEvent LoginOK(txtUsername.Text)
            End If
        End If

        If Not OK Then
            lblError.Text = "Error en el Nombre de Usuario o Contraseña, por favor revise sus datos."
            Session("Username") = Nothing
            Session.Abandon()
        End If
    End Sub

    Public Sub Initialize()
        lblError.Text = ""
        Session("Username") = Nothing
    End Sub

End Class
