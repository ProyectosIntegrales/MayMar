
Partial Class App_Controls_cntrlAdmin
    Inherits System.Web.UI.UserControl

    Public Property Username As String
        Get
            Return hflUsername.Value
        End Get
        Set(value As String)
            hflUsername.Value = value
            admUsers.Username = value
        End Set
    End Property
    Protected Sub ddlSelect_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlSelect.SelectedIndexChanged
        clearControls()

        txtFilter.Text = ""

        OpenControl()

    End Sub

    Protected Sub clearControls()
        admClientes.Visible = False
        admImportador.Visible = False
        admMedidas.Visible = False
        admUsers.Visible = False
    End Sub

    Protected Sub txtFilter_TextChanged(sender As Object, e As EventArgs) Handles txtFilter.TextChanged
        OpenControl()
    End Sub

    Protected Sub OpenControl()

        Select Case ddlSelect.SelectedValue

            Case "Usuarios"
                admUsers.Visible = True
                admUsers.Initialize()
                pnlFilter.Visible = False

            Case "Clientes"
                admClientes.Visible = True
                admClientes.Filter = txtFilter.Text
                admClientes.Initialize()
                pnlFilter.Visible = True

            Case "Importador"
                admImportador.Visible = True
                admImportador.Filter = txtFilter.Text
                admImportador.Initialize()
                pnlFilter.Visible = True

            Case "Reportes"

            Case "Medidas"
                admMedidas.Visible = True
                admMedidas.Initialize()
                pnlFilter.Visible = False

        End Select
    End Sub

    Protected Sub lnbReset_Click(sender As Object, e As EventArgs) Handles lnbReset.Click
        txtFilter.Text = ""

        OpenControl()
    End Sub
End Class
