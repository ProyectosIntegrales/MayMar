
Partial Class Admin_admUsers
    Inherits System.Web.UI.UserControl


    Public Property Username As String
        Get
            Return hflUsername.Value
        End Get
        Set(value As String)
            hflUsername.Value = value
        End Set
    End Property
    Protected Sub AddNew(sender As Object, e As ImageClickEventArgs)
        gvUsers.SetEditRow(-1)
        gvUsers.ShowFooter = True
        DirectCast(gvUsers.FooterRow.FindControl("Textbox1"), TextBox).Text = ""
        DirectCast(gvUsers.FooterRow.FindControl("Textbox2"), TextBox).Text = ""
        DirectCast(gvUsers.FooterRow.FindControl("Textbox3"), TextBox).Text = ""
        DirectCast(gvUsers.FooterRow.FindControl("Textbox4"), TextBox).Text = ""
        DirectCast(gvUsers.FooterRow.FindControl("Textbox1"), TextBox).Focus()
    End Sub

    Protected Sub gvUsers_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles gvUsers.RowEditing
        gvUsers.ShowFooter = False
    End Sub

    Protected Sub Save(sender As Object, e As ImageClickEventArgs)
        Dim b As ImageButton = sender
        Dim r As GridViewRow = b.Parent.Parent
        Result = doSQLProcedure("spUsers", Data.CommandType.StoredProcedure, , "@Action", "UPD", _
                                "@Username", DirectCast(r.FindControl("Label1"), Label).Text, _
                                "@Nombre", DirectCast(r.FindControl("Textbox2"), TextBox).Text, _
                                "@Email", DirectCast(r.FindControl("Textbox3"), TextBox).Text, _
                                "@Priv", DirectCast(r.FindControl("ddlPrivs"), DropDownList).SelectedValue _
                               )
        If Not Result = "" Then
            cntrlError1.errorMessage = Result
        Else
            gvUsers.SetEditRow(-1)
            gvUsers.DataBind()
        End If

    End Sub

    Dim Result As String
    Protected Sub Insert(sender As Object, e As ImageClickEventArgs)
        Dim r As GridViewRow = gvUsers.FooterRow
        Result = doSQLProcedure("spUsers", Data.CommandType.StoredProcedure, , "@Action", "ADD", _
                                "@Username", DirectCast(r.FindControl("Textbox1"), TextBox).Text, _
                                "@Nombre", DirectCast(r.FindControl("Textbox2"), TextBox).Text, _
                                "@Email", DirectCast(r.FindControl("Textbox3"), TextBox).Text, _
                                "@Password", DirectCast(r.FindControl("Textbox4"), TextBox).Text, _
                                "@Priv", DirectCast(r.FindControl("ddlPrivs"), DropDownList).SelectedValue _
                                )
        If Not Result = "" Then
            cntrlError1.errorMessage = Result
        Else
            gvUsers.SetEditRow(-1)
            gvUsers.DataBind()
        End If
    End Sub

    Protected Sub Delete(sender As Object, e As ImageClickEventArgs)
        Dim b As ImageButton = sender
        Result = doSQLProcedure("spUsers", Data.CommandType.StoredProcedure, , "@Action", "DEL", _
                          "@Username", b.CommandArgument)
        If Not Result = "" Then
            cntrlError1.errorMessage = Result
        Else
            gvUsers.DataBind()
        End If
    End Sub

    Protected Sub Cancel(Sender As Object, e As ImageClickEventArgs)
        gvUsers.SetEditRow(-1)
    End Sub

    Public Sub Initialize()
        gvUsers.PageIndex = 0
        gvUsers.SetEditRow(-1)
        gvUsers.DataBind()
    End Sub

    Protected Sub changePassword(sender As Object, e As EventArgs)
        Dim lnb As LinkButton = sender
        DirectCast(lnb.Parent.Parent.FindControl("Textbox4"), TextBox).Visible = True
        DirectCast(lnb.Parent.Parent.FindControl("imbPwd"), ImageButton).Visible = True
        DirectCast(lnb.Parent.Parent.FindControl("imbCancPwd"), ImageButton).Visible = True
        DirectCast(lnb.Parent.Parent.FindControl("Textbox4"), TextBox).Text = ""
        DirectCast(lnb.Parent.Parent.FindControl("Textbox4"), TextBox).Focus()
        lnb.Visible = False
    End Sub

    Protected Sub chgPwd(sender As Object, e As ImageClickEventArgs)
        Dim imb As ImageButton = sender
        Dim txt As TextBox = DirectCast(imb.Parent.Parent.FindControl("Textbox4"), TextBox)

        If txt.Text <> "" Then
            Dim r As GridViewRow = imb.Parent.Parent
            Result = doSQLProcedure("spUsers", Data.CommandType.StoredProcedure, , "@Action", "PWD", _
                                    "@Username", DirectCast(r.FindControl("Label1"), Label).Text, _
                                    "@Password", DirectCast(r.FindControl("Textbox4"), TextBox).Text _
                                   )
            If Not Result = "" Then
                cntrlError1.errorMessage = Result
            Else
                gvUsers.SetEditRow(-1)
                gvUsers.DataBind()
            End If
        End If
        imb.Visible = False
        txt.Visible = False
        DirectCast(imb.Parent.Parent.FindControl("imbCancPwd"), ImageButton).Visible = False
        DirectCast(imb.Parent.Parent.FindControl("lnbPassword"), LinkButton).Visible = True
    End Sub

    Protected Sub canPwd(sender As Object, e As ImageClickEventArgs)
        Dim imb As ImageButton = sender
        imb.Visible = False
        DirectCast(imb.Parent.Parent.FindControl("Textbox4"), TextBox).Visible = False
        DirectCast(imb.Parent.Parent.FindControl("imbPwd"), ImageButton).Visible = False
        DirectCast(imb.Parent.Parent.FindControl("lnbPassword"), LinkButton).Visible = True
    End Sub
End Class
