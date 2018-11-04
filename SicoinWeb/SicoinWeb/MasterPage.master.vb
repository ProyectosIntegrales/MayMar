Imports System.Configuration
Imports System.Web.Configuration
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Public Property MenuId As Integer
        Get
            Return hflMenuId.Value
        End Get
        Set(value As Integer)
            hflMenuID.Value = value
            Session("MenuID") = value
        End Set
    End Property

    Public Property SectionID As Integer
        Get
            Return hflSectionID.Value
        End Get
        Set(value As Integer)
            hflSectionID.Value = value
            Session("SectionID") = value
        End Set
    End Property
    Public Property Username As String
        Get
            Return hflUsername.Value
        End Get
        Set(value As String)
            hflUsername.Value = value
            Response.Cookies("UserSettings")("Username") = value
            Session("Username") = value
        End Set
    End Property

    Public Property EmployeeNo As Integer
        Get
            Return hflEmployeeNo.Value
        End Get
        Set(value As Integer)
            hflEmployeeNo.Value = value
            Session("EmployeeNo") = value
        End Set
    End Property


    Public Event MenuItemSelected()

    Private Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init

    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

        End If
        setSession()
    End Sub

    Public Sub setSession()

        If Not Session("Username") Is Nothing Then
            Response.Cache.SetCacheability(HttpCacheability.NoCache)

            Session("Reset") = True
            Dim config As Configuration = WebConfigurationManager.OpenWebConfiguration("~/Web.Config")
            Dim section As SessionStateSection = DirectCast(config.GetSection("system.web/sessionState"), SessionStateSection)
            Dim timeout As Integer = CInt(section.Timeout.TotalMinutes) * 1000 * 60
       
        End If

  
    End Sub

    Protected Sub resetState()


        'Session.RemoveAll()



        '   imbEnableEdit.Visible = False

        'EditEnabled = False
        Username = Nothing
        EmployeeNo = Nothing

        Response.Cookies("UserSettings")("employeeNo") = Nothing
        Response.Cookies("UserSettings")("isAdmin") = Nothing

        'lblEditing.Visible = False
        'hlnHelp.Visible = False

        '  cntrlTopMenu1.Refresh(Nothing)
    End Sub

  
End Class

