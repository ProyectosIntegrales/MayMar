
Partial Class Admin_admMedidas
    Inherits System.Web.UI.UserControl


    Protected Sub AddNew(sender As Object, e As ImageClickEventArgs)
        gvMedidas.SetEditRow(-1)
        gvMedidas.ShowFooter = True
        DirectCast(gvMedidas.FooterRow.FindControl("Textbox1"), TextBox).Text = ""
        DirectCast(gvMedidas.FooterRow.FindControl("Textbox2"), TextBox).Text = ""
        DirectCast(gvMedidas.FooterRow.FindControl("Textbox1"), TextBox).Focus()
    End Sub

    Protected Sub gvMedidas_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles gvMedidas.RowEditing
        gvMedidas.ShowFooter = False
    End Sub

    Protected Sub Save(sender As Object, e As ImageClickEventArgs)
        Dim b As ImageButton = sender
        Dim r As GridViewRow = b.Parent.Parent
        Result = doSQLProcedure("spMedidas", Data.CommandType.StoredProcedure, , "@Action", "UPD", _
                                "@Clave", DirectCast(r.FindControl("Label1"), Label).Text, _
                                "@Descripcion", DirectCast(r.FindControl("Textbox2"), TextBox).Text _
                                )
        If Not Result = "" Then
            cntrlError1.errorMessage = Result
        Else
            gvMedidas.SetEditRow(-1)
            gvMedidas.DataBind()
        End If

    End Sub

    Dim Result As String
    Protected Sub Insert(sender As Object, e As ImageClickEventArgs)
        Dim r As GridViewRow = gvMedidas.FooterRow
        Result = doSQLProcedure("spMedidas", Data.CommandType.StoredProcedure, , "@Action", "ADD", _
                                "@Clave", DirectCast(r.FindControl("Textbox1"), TextBox).Text, _
                                "@Descripcion", DirectCast(r.FindControl("Textbox2"), TextBox).Text _
                                )
        If Not Result = "" Then
            cntrlError1.errorMessage = Result
        Else
            gvMedidas.SetEditRow(-1)
            gvMedidas.DataBind()

        End If
    End Sub

    Protected Sub Delete(sender As Object, e As ImageClickEventArgs)
        Dim b As ImageButton = sender
        Result = doSQLProcedure("spMedidas", Data.CommandType.StoredProcedure, , "@Action", "DEL", _
                          "@Clave", b.CommandArgument)
        If Not Result = "" Then
            cntrlError1.errorMessage = Result
        Else
            gvMedidas.DataBind()
        End If
    End Sub

    Protected Sub Cancel(Sender As Object, e As ImageClickEventArgs)
        gvMedidas.SetEditRow(-1)
    End Sub

    Public Sub Initialize()
        gvMedidas.PageIndex = 0
        gvMedidas.SetEditRow(-1)
        gvMedidas.DataBind()
    End Sub
End Class
