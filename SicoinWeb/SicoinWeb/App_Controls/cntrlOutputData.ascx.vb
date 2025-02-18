Imports System.Data
Partial Class cntrlOutputData
    Inherits System.Web.UI.UserControl

    Public WriteOnly Property Operacion As String
        Set(value As String)
            hflOp.Value = value
            getData()
        End Set
    End Property

    Public WriteOnly Property Username As String
        Set(value As String)
            hflUsername.Value = value
        End Set
    End Property
    Public Sub clearAll()

        For Each c As Control In Me.Controls
            If c.GetType() = (New TextBox).GetType() Then
                Dim txtb As TextBox = DirectCast(c, TextBox)
                If txtb.Enabled Then
                    txtb.Text = ""
                    txtb.CssClass = "textboxg uppercase"
                End If
            End If

            txtSalAb.Text = ""
            txtNotaAb.Text = ""
            btnDeclAb.Visible = True
            pnlDeclAbandono.Visible = False
        Next

    End Sub

    Protected Sub getData()
        clearAll()
        Dim dt As DataTable = SQLDataTable("SELECT * FROM Inventario WHERE Operacion = '" & hflOp.Value & "'")
        If Not dt Is Nothing Then
            Dim dr As DataRow = dt.Rows(0)

            txtBox.Text = dr("Caja")
            txtMercancia.Text = dr("Mercancia")
            txtFecha.Text = isNull(dr("Fechain"), Now)
            txtPeso.Text = dr("Peso")
            txtMUM.Text = isNull(dr("Cajas"), 0)
            txtCliente.Text = dr("Cliente")
            txtNombre.Text = dr("Nombre")
            txtRazon.Text = dr("RSocial")
            txtValor.Text = dr("Valorc")
            txtFraccion.Text = dr("Fraccion")
            txtImp1.Text = dr("Importador")
            txtImp2.Text = dr("Dirimp")
            txtClave.Text = dr("ClavePed")
            txtFechaAb.Text = dr("Fechaab")
            txtCont.Text = dr("Contenedor")
            txtBultos.Text = dr("Bultos")
            txtDeclAb.Text = isNull(dr("FechaDeclAb"), "")
            txtSalAb.Text = isNull(dr("FechaSalidaAb"), "")
            txtNotaAb.Text = isNull(dr("NotaAb"), "")

            Try
                ddlUM.SelectedValue = isNull(dr("UM"), 1)
            Catch ex As Exception
                ddlUM.SelectedValue = 1
            End Try

            txtFechaout.Text = isNull(dr("Fechaout"), "1/1/1900")
            If txtFechaout.Text.Trim = "" Or txtFechaout.Text = "1/1/1900" Then
                txtFechaout.Text = Now
            End If
            txtTiempo.Text = DateDiff("d", txtFecha.Text, txtFechaout.Text)
            txtDescargado.Text = dr("Descargado")
            txtRemanente.Text = dr("Remanente")

            Dim Terminado As Boolean = dr("Terminado")

            pnlOut.Enabled = Not Terminado
            pnlButtons.Visible = Not Terminado
            If txtDescargado.Text.Trim = "0" Then txtDescargado.Text = ""

        End If
        txtDescargado.Focus()

        If txtDeclAb.Text <> "" Then
            pnlDeclAbandono.Visible = True
            btnDeclAb.Visible = False
            hflDeclAb.Value = True
            txtSalAb.Focus()
        Else
            hflDeclAb.Value = False
        End If

        btnMod.Visible = Session("IsAdmin")
    End Sub


    Public Event Aceptar()
    Public Event Cancelar()

    Dim ValidationMessage As String

    Protected Sub btnOK_Click(sender As Object, e As EventArgs) Handles btnOK.Click
        Try
            If Not ValidationOK() Then
                cntrlError.errorMessage = ValidationMessage
                Exit Sub
            End If

            If txtDescargado.Text <> "" Then
                pnlConfirm_ModalPopupExtender.Show()
            Else
                SaveData(False)
            End If
   
        Catch ex As Exception
            cntrlError.errorMessage = ex.Message
        End Try
    End Sub

    Protected Sub SaveData(term As Boolean)
        Dim result As String = ""
        result =
            doSQLProcedure("spInventario_Out", Data.CommandType.StoredProcedure, ,
                           "@Operacion", hflOp.Value,
                           "@Fechaout", CDate(txtFechaout.Text),
                           "@Caja", txtBox.Text,
                           "@User", hflUsername.Value,
                           "@Descargado", txtDescargado.Text,
                           "@Remanente", txtRemanente.Text,
                           "@Terminado", term)

        If result <> "" Then
            cntrlError.errorMessage = result
        Else

            If hflDeclAb.Value Then
                result = doSQLProcedure("spInventario_Ab", Data.CommandType.StoredProcedure,,
                               "@Operacion", hflOp.Value,
                               "@FechaDeclAb", txtDeclAb.Text,
                               "@FechaSalidaAb", IIf(txtSalAb.Text.Trim = "", DBNull.Value, txtSalAb.Text),
                               "@NotaAb", txtNotaAb.Text)

                If result <> "" Then
                    cntrlError.errorMessage = result
                End If

            End If

            If result = "" Then
                RaiseEvent Aceptar()
            End If

        End If
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        RaiseEvent Cancelar()
    End Sub

    Protected Function ValidationOK() As Boolean
        ValidationOK = True
        ValidationMessage = ""

        If Not IsNumeric(txtDescargado.Text) Then
            ValidationOK = False
            ValidationMessage &= IIf(ValidationMessage <> "", "<br>", "") & "El campo 'Descargado' debe ser numérico."
            txtDescargado.CssClass = "textboxr"
            txtDescargado.Focus()
        End If

        Return ValidationOK
    End Function

    Protected Sub txtDescargado_TextChanged(sender As Object, e As EventArgs) Handles txtDescargado.TextChanged
        If IsNumeric(txtDescargado.Text) Then
            txtRemanente.Text = txtPeso.Text - txtDescargado.Text
        End If
    End Sub

    Protected Sub btnYes_Click(sender As Object, e As EventArgs) Handles btnYes.Click
        SaveData(True)
    End Sub

    Protected Sub btnNo_Click(sender As Object, e As EventArgs) Handles btnNo.Click
        SaveData(False)
    End Sub

    Protected Sub btnDeclAb_Click(sender As Object, e As EventArgs) Handles btnDeclAb.Click
        pnlDeclAbandono.Visible = True
        btnDeclAb.Visible = False
        hflDeclAb.Value = True
        txtDeclAb.Text = Now
    End Sub

    Public Event ModBtnClicked(o As String)
    Protected Sub btnMod_Click(sender As Object, e As EventArgs) Handles btnMod.Click
        RaiseEvent ModBtnClicked("OUT")
    End Sub
End Class
