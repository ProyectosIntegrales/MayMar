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

            Dim dt As DataTable = SQLDataTable("SELECT Nombre, Priv FROM tblUsers WHERE Username = '" & Username & "'")
            lblname.Text = dt.Rows(0)("Nombre")

            Session("IsAdmin") = dt.Rows(0)("Priv") = 5

            If dt.Rows(0)("Priv") = 0 Then
                pnlMain.Visible = False

                pnlAdmin.Visible = False
                pnlAnx.Visible = False
                pnlConsulta.Visible = True
                btnConsulta.Visible = True
                btnAdmin.Visible = False
                btnAnx.Visible = False
                btnInv.Visible = False

            Else
                pnlMain.Visible = True
                pnlAdmin.Visible = False
                pnlAnx.Visible = False
                pnlConsulta.Visible = False

                btnConsulta.Visible = False
                btnAdmin.Visible = Session("IsAdmin")
                btnAnx.Visible = True
                btnInv.Visible = True

            End If

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

    Protected Sub resetButtons()
        pnlMain.Visible = False
        pnlAdmin.Visible = False
        pnlAnx.Visible = False
        btnAnx.Enabled = True
        btnInv.Enabled = True
        btnAdmin.Enabled = True
        btnAnx.CssClass = "btnc"
        btnInv.CssClass = "btnc"
        btnAdmin.CssClass = "btnca"
    End Sub
End Class
