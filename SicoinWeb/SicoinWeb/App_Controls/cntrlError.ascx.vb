
Partial Class App_Controls_cntrlError
    Inherits System.Web.UI.UserControl
    Public WriteOnly Property errorMessage As String
        Set(ByVal value As String)
            lblError.Text = value
            If lblError.Text <> "" Then
                ModalPopupExtender1.Show()
            End If

        End Set
    End Property

    Public WriteOnly Property returnToHome As Boolean
        Set(value As Boolean)
            hflReturn.Value = value
        End Set
    End Property

    Public Event closeError()

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        ModalPopupExtender1.Hide()
        RaiseEvent closeError()

        If hflReturn.Value Then
            Response.Redirect(".")
        End If

    End Sub

    Public Sub Show()
        ModalPopupExtender1.Show()
    End Sub

End Class
