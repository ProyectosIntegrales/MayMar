
Partial Class Admin_admServers
    Inherits System.Web.UI.UserControl


    Protected Sub AddNew(sender As Object, e As ImageClickEventArgs)
        gvServers.SetEditRow(-1)
        gvServers.ShowFooter = True
        DirectCast(gvServers.FooterRow.FindControl("txtServer"), TextBox).Text = ""
        DirectCast(gvServers.FooterRow.FindControl("txtDatabase"), TextBox).Text = ""
        DirectCast(gvServers.FooterRow.FindControl("txtServer"), TextBox).Focus()
    End Sub

    Protected Sub gvServers_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles gvServers.RowEditing
        gvServers.ShowFooter = False
    End Sub

    Protected Sub Save(sender As Object, e As ImageClickEventArgs)
        Dim b As ImageButton = sender
        Dim r As GridViewRow = b.Parent.Parent
        Result = doSQLProcedure("spServers", Data.CommandType.StoredProcedure, , "@Action", "UPD",
                                "@id", b.CommandArgument,
                                "@ServerName", DirectCast(r.FindControl("txtServer"), TextBox).Text,
                                "@DatabaseName", DirectCast(r.FindControl("txtDatabase"), TextBox).Text
                                )
        If Not Result = "" Then
            cntrlError1.errorMessage = Result
        Else
            gvServers.SetEditRow(-1)
            gvServers.DataBind()
        End If

    End Sub

    Dim Result As String
    Protected Sub Insert(sender As Object, e As ImageClickEventArgs)
        Dim r As GridViewRow = gvServers.FooterRow
        Result = doSQLProcedure("spServers", Data.CommandType.StoredProcedure, , "@Action", "ADD",
                                "@ServerName", DirectCast(r.FindControl("txtServer"), TextBox).Text,
                                "@DatabaseName", DirectCast(r.FindControl("txtDatabase"), TextBox).Text
                                )
        If Not Result = "" Then
            cntrlError1.errorMessage = Result
        Else
            gvServers.SetEditRow(-1)
            gvServers.DataBind()

        End If
    End Sub

    Protected Sub Delete(sender As Object, e As ImageClickEventArgs)
        Dim b As ImageButton = sender
        Result = doSQLProcedure("spServers", Data.CommandType.StoredProcedure, , "@Action", "DEL",
                          "@id", b.CommandArgument)
        If Not Result = "" Then
            cntrlError1.errorMessage = Result
        Else
            gvServers.DataBind()
        End If
    End Sub

    Protected Sub Cancel(Sender As Object, e As ImageClickEventArgs)
        gvServers.SetEditRow(-1)
    End Sub

    Public Sub Initialize()
        gvServers.PageIndex = 0
        gvServers.SetEditRow(-1)
        gvServers.DataBind()
    End Sub
End Class
