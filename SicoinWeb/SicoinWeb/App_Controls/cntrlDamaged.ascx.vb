
Imports CrystalDecisions.Shared
Imports System.Data
Imports System.Data.SqlClient
Imports System.Windows.Forms
Imports System.Windows.Forms.VisualStyles.VisualStyleElement

Partial Class App_Controls_cntrlDamaged
    Inherits System.Web.UI.UserControl

    Public ReadOnly Property Cantidad As Double
        Get
            Return txtDamage.Text
        End Get

    End Property

    Public WriteOnly Property ButtonVisible As Boolean
        Set(value As Boolean)
            btnDamaged.Visible = value
        End Set
    End Property

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles Me.PreRender
        BindDamageValue()
    End Sub

    Protected Sub btnDamaged_Click(sender As Object, e As EventArgs) Handles btnDamaged.Click
        cntrlDamagedPopup.Show()
    End Sub

    Private Sub BindDamageValue()

        Dim dt As DataTable = SQLDataTable("SELECT SUM(Cantidad) AS Cantidad FROM Damages WHERE Operacion = '" & Session("op") & "' GROUP BY Operacion")
        If Not dt Is Nothing And dt.Rows.Count > 0 Then
            Dim dr As DataRow = dt.Rows(0)
            txtDamage.Text = dr("Cantidad")
        End If

    End Sub
End Class
