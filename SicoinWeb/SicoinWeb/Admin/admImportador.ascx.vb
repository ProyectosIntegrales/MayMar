
Partial Class Admin_admImportador
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
        gvImportador.SetEditRow(-1)
        gvImportador.ShowFooter = True
        DirectCast(gvImportador.FooterRow.FindControl("Textbox1"), TextBox).Text = ""
        DirectCast(gvImportador.FooterRow.FindControl("Textbox2"), TextBox).Text = ""
        DirectCast(gvImportador.FooterRow.FindControl("Textbox3"), TextBox).Text = ""
        DirectCast(gvImportador.FooterRow.FindControl("Textbox1"), TextBox).Focus()
    End Sub

    Protected Sub gvImportador_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles gvImportador.RowEditing
        gvImportador.ShowFooter = False
    End Sub

    Protected Sub Save(sender As Object, e As ImageClickEventArgs)
        Dim b As ImageButton = sender
        Dim r As GridViewRow = b.Parent.Parent
        Dim clave = DirectCast(r.FindControl("Label1"), Label).Text
        Dim nombre = DirectCast(r.FindControl("Textbox2"), TextBox).Text
        Dim direccion = DirectCast(r.FindControl("Textbox3"), TextBox).Text

        Result = doSQLProcedure("spImportador", Data.CommandType.StoredProcedure, , "@Action", "UPD",
                                "@Clave", clave,
                                "@Nombre", nombre,
                                "@Direccion", direccion
)
        If Not Result = "" Then
            cntrlError1.errorMessage = Result
        Else
            gvImportador.SetEditRow(-1)
            gvImportador.DataBind()
        End If

    End Sub

    Dim Result As String
    Protected Sub Insert(sender As Object, e As ImageClickEventArgs)
        Dim r As GridViewRow = gvImportador.FooterRow
        Result = doSQLProcedure("spImportador", Data.CommandType.StoredProcedure, , "@Action", "ADD", _
                                "@Clave", DirectCast(r.FindControl("Textbox1"), TextBox).Text, _
                                "@Nombre", DirectCast(r.FindControl("Textbox2"), TextBox).Text, _
                                "@Direccion", DirectCast(r.FindControl("Textbox3"), TextBox).Text _
                                )
        If Not Result = "" Then
            cntrlError1.errorMessage = Result
        Else
            gvImportador.SetEditRow(-1)
            gvImportador.DataBind()

        End If
    End Sub

    Protected Sub Delete(sender As Object, e As ImageClickEventArgs)
        Dim b As ImageButton = sender
        Result = doSQLProcedure("spImportador", Data.CommandType.StoredProcedure, , "@Action", "DEL", _
                          "@Clave", b.CommandArgument)
        If Not Result = "" Then
            cntrlError1.errorMessage = Result
        Else
            gvImportador.DataBind()
        End If
    End Sub

    Protected Sub Cancel(Sender As Object, e As ImageClickEventArgs)
        gvImportador.SetEditRow(-1)
    End Sub

    Public Sub Initialize()
        gvImportador.PageIndex = 0
        gvImportador.SetEditRow(-1)
        gvImportador.DataBind()
    End Sub
End Class
