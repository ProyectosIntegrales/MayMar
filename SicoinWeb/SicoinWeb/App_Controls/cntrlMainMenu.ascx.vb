
Partial Class App_Controls_cntrlMainMenu
    Inherits System.Web.UI.UserControl
    Public Property IsAdmin As Boolean
        Get
            If Session.Mode = SessionStateMode.Off Then
                Session("IsAdmin") = False
            End If
            Return Session("IsAdmin")
        End Get
        Set(value As Boolean)

        End Set
    End Property

    Public Property MenuId As Integer
        Get
            Return hflMenuId.Value
        End Get
        Set(value As Integer)
            Response.Cookies("SessionSettings")("MenuID") = value
            hflMenuId.Value = value
            RaiseEvent ItemSelected()
        End Set
    End Property

    Public Event ItemSelected()

    Private Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        Dim mee As UserIntranet = New UserIntranet(Session("Username"))
        Session("IsAdmin") = mee.Admin
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub openSection(sender As Object, e As EventArgs)
        Dim lnb As LinkButton = sender
        MenuId = isNull(lnb.CommandArgument, 1)

        Session("helpLink") = Nothing

    End Sub
End Class
