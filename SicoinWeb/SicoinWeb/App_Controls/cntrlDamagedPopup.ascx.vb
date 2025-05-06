
Imports System.Data

Partial Class App_Controls_cntrlDamagedPopup
    Inherits System.Web.UI.UserControl
    Public Sub Show()
        txtFecha.Text = DateTime.Now.ToString("MM/dd/yyyy")
        txtCantidad.Text = ""
        txtComments.Text = ""
        lblError.Visible = Not ValidarCantidad(txtCantidad.Text) And Trim(txtCantidad.Text) <> ""
        mdlPopup.Show()
        gvDamaged.DataBind()
        Dim hasrows = gvDamaged.Rows.Count > 0
        pnlTable.Visible = hasrows
        pnlAdd.Visible = Not hasrows

    End Sub

    Protected Sub btnOk_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnOK.Click

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
            Show()
        End If
        mdlPopup.Show()
    End Sub

    Protected Sub Cancel(ByVal sender As Object, e As EventArgs) Handles btnCancel.Click
        mdlPopup.Hide()
    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs)
        pnlAdd.Visible = True
        pnlTable.Visible = False
        mdlPopup.Show()
    End Sub

    Protected Sub imbDelete_Click(sender As Object, e As ImageClickEventArgs)
        Dim b As ImageButton = sender
        Dim r As GridViewRow = b.Parent.Parent
        Dim result = doSQLProcedure("spDamaged", Data.CommandType.StoredProcedure, ,
                      "@Action", "DEL",
                      "@ID", TryCast(r.FindControl("lblID"), Label).Text,
)
        If Not result = "" Then
            cntrlError.errorMessage = result
        Else
            gvDamaged.SetEditRow(-1)
            gvDamaged.DataBind()

        End If
        mdlPopup.Show()
    End Sub

    Protected Sub imbSave_Click(sender As Object, e As ImageClickEventArgs)
        Dim b As ImageButton = sender
        Dim r As GridViewRow = b.Parent.Parent
        Dim fecha As DateTime
        Dim fechaText As String = TryCast(r.FindControl("txtFecha"), TextBox).Text
        If DateTime.TryParseExact(fechaText, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, fecha) Then
            Dim result = doSQLProcedure("spDamaged", Data.CommandType.StoredProcedure, ,
                        "@Action", "UPD",
                        "@ID", TryCast(r.FindControl("lblID"), Label).Text,
                        "@Cantidad", TryCast(r.FindControl("txtCantidad"), TextBox).Text,
                        "@Comentario", TryCast(r.FindControl("txtComentarios"), TextBox).Text,
                        "@Fecha", fecha.ToString("yyyy-MM-dd")
                        )
            If Not result = "" Then
                cntrlError.errorMessage = result
            Else
                gvDamaged.SetEditRow(-1)
                gvDamaged.DataBind()

            End If
        End If
        mdlPopup.Show()
        btnAdd.Visible = True
    End Sub

    Protected Sub imbCancel_Click(sender As Object, e As ImageClickEventArgs)
        gvDamaged.EditIndex = -1
        gvDamaged.ShowFooter = False
        mdlPopup.Show()
        btnAdd.Visible = True
    End Sub

    Protected Sub imbAdd_Click(sender As Object, e As ImageClickEventArgs)
        gvDamaged.EditIndex = -1
        pnlTable.Visible = False
        pnlAdd.Visible = True
        mdlPopup.Show()
    End Sub

    Protected Sub imbEdit_Command(sender As Object, e As CommandEventArgs)
        If e.CommandName = "EDIT" Then
            ' Logic to put the control or row into edit mode
            ' For example, in a GridView:
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            gvDamaged.EditIndex = index
            gvDamaged.DataBind() ' Rebind data to refresh the GridView with the row in edit mode
            mdlPopup.Show()
            btnAdd.Visible = False
        End If
    End Sub

    Protected WithEvents cntrlDamagedPopup As App_Controls_cntrlDamagedPopup

    Public Event PopupClosed As EventHandler

    Protected Sub imbClose_Click(sender As Object, e As ImageClickEventArgs) Handles imbClose.Click
        RaiseEvent PopupClosed(Me, EventArgs.Empty)
    End Sub
End Class
