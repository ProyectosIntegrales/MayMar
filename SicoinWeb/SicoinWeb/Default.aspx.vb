Imports System.Data.SqlClient

Partial Class _Default
    Inherits System.Web.UI.Page

    Public Sub New()
        AddMigrations()
    End Sub

    Protected Sub cntrlWelcome1_LoginClicked()

        cntrlWelcome1.Visible = False
        cntrlLogin.Visible = True
        cntrlLogin.initialize()
    End Sub

    Protected Sub cntrlLogin_Cancel() Handles cntrlLogin.Cancel
        cntrlLogin.Visible = False
        cntrlWelcome1.Visible = True
    End Sub

    Protected Sub cntrlLogin_LoginOK(Username As String)
        cntrlLogin.Visible = False
        cntrlMain.Visible = True
        cntrlMain.Username = Username
        cntrlMain.Initialize()
    End Sub

    Protected Sub cntrlLogin_Cancel1()
        cntrlLogin.Visible = False
        cntrlWelcome1.Visible = True
    End Sub

    Protected Sub cntrlMain_Close() Handles cntrlMain.Close
        cntrlMain.Visible = False
        cntrlWelcome1.Visible = True
    End Sub
End Class
