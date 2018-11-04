
Partial Class Admin_admClientes
    Inherits System.Web.UI.UserControl

    Public Property Filter As String
        Get
            Return hflFilter.Value
        End Get
        Set(value As String)
            hflFilter.Value = IIf(value <> "", value, "*")

        End Set
    End Property

    Protected Sub AddNew(sender As Object, e As ImageClickEventArgs)
        gvClientes.SetEditRow(-1)
        gvClientes.ShowFooter = True
        DirectCast(gvClientes.FooterRow.FindControl("Textbox1"), TextBox).Text = ""
        DirectCast(gvClientes.FooterRow.FindControl("Textbox2"), TextBox).Text = ""
        DirectCast(gvClientes.FooterRow.FindControl("Textbox3"), TextBox).Text = ""
        DirectCast(gvClientes.FooterRow.FindControl("Textbox4"), TextBox).Text = ""
        DirectCast(gvClientes.FooterRow.FindControl("Textbox5"), TextBox).Text = ""
        DirectCast(gvClientes.FooterRow.FindControl("Textbox6"), TextBox).Text = ""
        DirectCast(gvClientes.FooterRow.FindControl("Textbox1"), TextBox).Focus()
    End Sub

    Protected Sub gvClientes_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles gvClientes.RowEditing
        gvClientes.ShowFooter = False
    End Sub

    Protected Sub Save(sender As Object, e As ImageClickEventArgs)
        Dim b As ImageButton = sender
        Dim r As GridViewRow = b.Parent.Parent
        Result = doSQLProcedure("spClientes", Data.CommandType.StoredProcedure, , "@Action", "UPD", _
                                "@Clave", DirectCast(r.FindControl("Label1"), Label).Text, _
                                "@Nombre", DirectCast(r.FindControl("Textbox2"), TextBox).Text, _
                                "@RSocial", DirectCast(r.FindControl("Textbox3"), TextBox).Text, _
                                "@Rfc", DirectCast(r.FindControl("Textbox4"), TextBox).Text, _
                                "@Direccion", DirectCast(r.FindControl("Textbox5"), TextBox).Text, _
                                "@Patente", DirectCast(r.FindControl("Textbox6"), TextBox).Text _
                                )
        If Not Result = "" Then
            cntrlError1.errorMessage = Result
        Else
            gvClientes.SetEditRow(-1)
            gvClientes.DataBind()
        End If

    End Sub

    Dim Result As String
    Protected Sub Insert(sender As Object, e As ImageClickEventArgs)
        Dim r As GridViewRow = gvClientes.FooterRow
        Result = doSQLProcedure("spClientes", Data.CommandType.StoredProcedure, , "@Action", "ADD", _
                                "@Clave", DirectCast(r.FindControl("Textbox1"), TextBox).Text, _
                                "@Nombre", DirectCast(r.FindControl("Textbox2"), TextBox).Text, _
                                "@RSocial", DirectCast(r.FindControl("Textbox3"), TextBox).Text, _
                                "@Rfc", DirectCast(r.FindControl("Textbox4"), TextBox).Text, _
                                "@Direccion", DirectCast(r.FindControl("Textbox5"), TextBox).Text, _
                                "@Patente", DirectCast(r.FindControl("Textbox6"), TextBox).Text _
                                )
        If Not Result = "" Then
            cntrlError1.errorMessage = Result
        Else
            gvClientes.DataBind()
        End If
    End Sub

    Protected Sub Delete(sender As Object, e As ImageClickEventArgs)
        Dim b As ImageButton = sender
        Result = doSQLProcedure("spClientes", Data.CommandType.StoredProcedure, , "@Action", "DEL", _
                          "@Clave", b.CommandArgument)
        If Not Result = "" Then
            cntrlError1.errorMessage = Result
        Else
            gvClientes.DataBind()
        End If
    End Sub

    Protected Sub Cancel(Sender As Object, e As ImageClickEventArgs)
        gvClientes.SetEditRow(-1)
    End Sub

    Public Sub Initialize()
        gvClientes.PageIndex = 0
        gvClientes.SetEditRow(-1)
        gvClientes.DataBind()
    End Sub
End Class
