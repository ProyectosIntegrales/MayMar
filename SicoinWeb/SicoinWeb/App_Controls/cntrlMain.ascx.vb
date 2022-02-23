Imports System.Data
Imports System.Data.SqlClient

Partial Class App_Controls_cntrlMain
    Inherits System.Web.UI.UserControl

    Public Property Username As String
        Get
            Return hflUsername.Value
        End Get
        Set(value As String)
            hflUsername.Value = value
            cntrlAdmin.Username = value
            cntrlInventory.Username = value
        End Set
    End Property


    Public Sub Initialize()
        If Not Username = Nothing Then
            Dim dt As DataTable = SQLDataTable("SELECT Nombre, Priv, ServerID FROM tblUsers WHERE Username = '" & Username & "'")
            lblname.Text = dt.Rows(0)("Nombre")
            Dim priv = dt.Rows(0)("Priv")
            Dim server = dt.Rows(0)("ServerID")
            Session("IsAdmin") = priv = 5
            Session("IsAduana") = isNull(server, 0) = 2
            Select Case priv
                Case 0 'Consulta
                    pnlMain.Visible = False
                    pnlAdmin.Visible = False
                    pnlAnx.Visible = False
                    pnlSalidas.Visible = False
                    pnlConsulta.Visible = True
                    btnConsulta.Visible = True
                    btnAdmin.Visible = False
                    btnAnx.Visible = False
                    btnInv.Visible = False
                    btnSalidas.Visible = Not Session("IsAduana")
                    btnSalidas.Enabled = Not Session("IsAduana")
                Case 3 'Capturista
                    pnlMain.Visible = True
                    pnlAdmin.Visible = False
                    pnlAnx.Visible = False
                    pnlConsulta.Visible = False
                    pnlSalidas.Visible = False
                    btnConsulta.Visible = False
                    btnAdmin.Visible = Session("IsAdmin")
                    btnAnx.Visible = True
                    btnInv.Visible = True
                    btnSalidas.Visible = True
                Case 4 'Caseta
                    pnlMain.Visible = False
                    pnlAdmin.Visible = False
                    pnlAnx.Visible = False
                    pnlConsulta.Visible = False
                    pnlSalidas.Visible = True
                    btnConsulta.Visible = False
                    btnAnx.Visible = False
                    btnInv.Visible = False
                    btnAdmin.Visible = False
                Case 5 'Admin
                    pnlMain.Visible = True
                    pnlAdmin.Visible = False
                    pnlAnx.Visible = False
                    pnlConsulta.Visible = False
                    pnlSalidas.Visible = False
                    btnConsulta.Visible = False
                    btnAdmin.Visible = Session("IsAdmin")
                    btnAnx.Visible = True
                    btnInv.Visible = True
                    btnSalidas.Visible = True
            End Select
        Else
            RaiseEvent Close()
        End If
    End Sub


    Public Event Close()

    Protected Sub lnbClose_Click(sender As Object, e As EventArgs) Handles lnbClose.Click

        'If cntrlInputData.Visible Then
        '    pnlConfirm_ModalPopupExtender.Show()
        'Else

        pnlConfirm_ModalPopupExtender.Hide()
        Username = Nothing
        RaiseEvent Close()
        'End If

    End Sub

    Protected Sub btnClose_Click(sender As Object, e As EventArgs) Handles btnClose.Click

        pnlConfirm_ModalPopupExtender.Hide()

        Username = Nothing
        RaiseEvent Close()
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            If pnlMain.Visible Then
                ' txtOp.Focus()
                btnInv.Enabled = False
                btnInv.CssClass = "btnb"
                cntrlInventory.Username = hflUsername.Value
            ElseIf pnlAnx.Visible Then
            End If

        End If
    End Sub


    Protected Sub btnConsulta_Click(sender As Object, e As EventArgs) Handles btnConsulta.Click
        resetButtons()
        pnlConsulta.Visible = True
        btnConsulta.Enabled = False
        btnConsulta.CssClass = "btnb"
    End Sub


    Protected Sub btnAnx_Click(sender As Object, e As EventArgs) Handles btnAnx.Click

        resetButtons()

        pnlAnx.Visible = True
        cntrlAnexo29.Entrada()

        btnAnx.Enabled = False
        btnAnx.CssClass = "btnb"

    End Sub

    Protected Sub btnInv_Click(sender As Object, e As EventArgs) Handles btnInv.Click

        resetButtons()

        pnlMain.Visible = True
        btnInv.Enabled = False
        btnInv.CssClass = "btnb"
    End Sub

    Protected Sub btnAdmin_Click(sender As Object, e As EventArgs) Handles btnAdmin.Click

        resetButtons()

        pnlAdmin.Visible = True
        btnAdmin.Enabled = False
        btnAdmin.CssClass = "btnba"
    End Sub

    Protected Sub btnSalidas_Click(sender As Object, e As EventArgs) Handles btnSalidas.Click
        resetButtons()
        pnlSalidas.Visible = True
        btnSalidas.Enabled = False
        btnSalidas.CssClass = "btnb"
    End Sub

    Protected Sub resetButtons()
        pnlMain.Visible = False
        pnlAdmin.Visible = False
        pnlSalidas.Visible = False
        pnlConsulta.Visible = False
        pnlAnx.Visible = False
        btnAnx.Enabled = True
        btnInv.Enabled = True
        btnAdmin.Enabled = True
        btnConsulta.Enabled = True
        btnSalidas.Enabled = Not Session("IsAduana")
        btnAnx.CssClass = "btnc"
        btnInv.CssClass = "btnc"
        btnAdmin.CssClass = "btnca"
        btnSalidas.CssClass = "btnc"
        btnConsulta.CssClass = "btnc"
    End Sub
End Class
