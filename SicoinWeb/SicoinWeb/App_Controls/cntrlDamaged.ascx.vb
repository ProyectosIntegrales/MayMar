
Imports CrystalDecisions.Shared
Imports System.Data
Imports System.Data.SqlClient
Imports System.Windows.Forms
Imports System.Windows.Forms.VisualStyles.VisualStyleElement

Partial Class App_Controls_cntrlDamaged
    Inherits System.Web.UI.UserControl

    Public Sub Show()
        txtFecha.Text = DateTime.Now.ToString("MM/dd/yyyy")
        lblError.Visible = Not ValidarCantidad(txtCantidad.Text) And Trim(txtCantidad.Text) <> ""
        mdlPopup.Show()
    End Sub

    Protected Sub btnOk_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnOk.Click

        Dim cantidad = txtCantidad.Text
        Dim comentario = txtComments.Text
        Dim fecha = txtFecha.Text


        If Not ValidarCantidad(cantidad) Then
            cntrlError.errorMessage = "Cantidad Inválida, debe ser numérica."
            cntrlError.Show()
            Exit Sub
        End If
        SaveData(cantidad, comentario, fecha)
    End Sub

    Private Function ValidarCantidad(cantidad As String) As Boolean
        Dim numero As Double
        If Not Double.TryParse(cantidad, numero) Then
            Return False
        End If
        Return True
    End Function

    Protected Sub SaveData(ByVal cantidad As Double, ByVal comentario As String, fecha As DateTime)
        Dim result As String = ""
        result =
            doSQLProcedure("spDamaged", CommandType.StoredProcedure, ,
                           "@Action", "ADD",
                           "@Operacion", Session("op"),
                           "@Cantidad", cantidad,
                           "@Comentario", comentario,
                           "@Fecha", fecha,
                           "@CreatedBy", Session("Username")
                            )

        If result <> "" Then
            cntrlError.errorMessage = result
        Else

        End If
    End Sub

    Protected Sub Cancel(ByVal sender As Object, e As EventArgs) Handles btnCancel.Click
        mdlPopup.Hide()
    End Sub
End Class
