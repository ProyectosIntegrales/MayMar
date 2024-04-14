
Partial Class Admin_admExportadores
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
        gvExportadores.SetEditRow(-1)
        gvExportadores.ShowFooter = True
        DirectCast(gvExportadores.FooterRow.FindControl("Textbox1"), TextBox).Text = ""
        DirectCast(gvExportadores.FooterRow.FindControl("Textbox2"), TextBox).Text = ""
        DirectCast(gvExportadores.FooterRow.FindControl("Textbox3"), TextBox).Text = ""
        DirectCast(gvExportadores.FooterRow.FindControl("Textbox4"), TextBox).Text = ""
        DirectCast(gvExportadores.FooterRow.FindControl("Textbox1"), TextBox).Focus()
    End Sub

    Protected Sub gvImportador_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles gvExportadores.RowEditing
        gvExportadores.ShowFooter = False
    End Sub

    Protected Sub Save(sender As Object, e As ImageClickEventArgs)
        Dim b As ImageButton = sender
        Dim r As GridViewRow = b.Parent.Parent
        Result = doSQLProcedure("spExportador", Data.CommandType.StoredProcedure, , "@Action", "UPD",
                                "@ID", b.CommandArgument,
                                "@Nombre", DirectCast(r.FindControl("Textbox1"), TextBox).Text,
                                "@Direccion", DirectCast(r.FindControl("Textbox2"), TextBox).Text,
                                "@Ciudad", DirectCast(r.FindControl("Textbox3"), TextBox).Text,
                                "@RFC", DirectCast(r.FindControl("Textbox4"), TextBox).Text
                                )
        If Not Result = "" Then
            cntrlError1.errorMessage = Result
        Else
            gvExportadores.SetEditRow(-1)
            gvExportadores.DataBind()
        End If

    End Sub

    Dim Result As String
    Protected Sub Insert(sender As Object, e As ImageClickEventArgs)
        Dim r As GridViewRow = gvExportadores.FooterRow
        Result = doSQLProcedure("spExportador", Data.CommandType.StoredProcedure, , "@Action", "ADD",
                                "@Nombre", DirectCast(r.FindControl("Textbox1"), TextBox).Text,
                                "@Direccion", DirectCast(r.FindControl("Textbox2"), TextBox).Text,
                                "@Ciudad", DirectCast(r.FindControl("Textbox3"), TextBox).Text,
                                "@RFC", DirectCast(r.FindControl("Textbox4"), TextBox).Text
                                )
        If Not Result = "" Then
            cntrlError1.errorMessage = Result
        Else
            gvExportadores.SetEditRow(-1)
            gvExportadores.DataBind()

        End If
    End Sub

    Protected Sub Delete(sender As Object, e As ImageClickEventArgs)
        Dim b As ImageButton = sender
        Result = doSQLProcedure("spExportador", Data.CommandType.StoredProcedure, , "@Action", "DEL",
                          "@ID", b.CommandArgument)
        If Not Result = "" Then
            cntrlError1.errorMessage = Result
        Else
            gvExportadores.DataBind()
        End If
    End Sub

    Protected Sub Cancel(Sender As Object, e As ImageClickEventArgs)
        gvExportadores.SetEditRow(-1)
    End Sub

    Public Sub Initialize()
        gvExportadores.PageIndex = 0
        gvExportadores.SetEditRow(-1)
        gvExportadores.DataBind()
    End Sub
End Class
