Imports System.Data
Partial Class cntrlInputData
    Inherits System.Web.UI.UserControl

    Public WriteOnly Property Operacion As String
        Set(value As String)
            hflOp.Value = value
        End Set
    End Property
    Public Sub clearAll()
        Try
            ddlUM.SelectedIndex = 0
            rbt1.Checked = True
        Catch ex As Exception

        End Try

        For Each c As Control In Me.Controls
            If c.GetType() = txtBox.GetType Then
                DirectCast(c, TextBox).Text = ""
            End If
        Next
        txtFecha.Text = Now
        txtFechaAb.Text = NewAbDate()
        txtBox.Focus()

    End Sub

    Protected Sub rbt_CheckedChanged(sender As Object, e As EventArgs) Handles rbt1.CheckedChanged, rbt2.CheckedChanged
        txtFechaAb.Text = NewAbDate()
    End Sub

    Protected Function NewAbDate() As DateTime
        Return Now.AddDays(IIf(rbt1.Checked, 45, 90))
    End Function

    Public Event Aceptar()
    Public Event Cancelar()

    Dim ValidationMessage As String
    Protected Sub btnOK_Click(sender As Object, e As EventArgs) Handles btnOK.Click
        Try
            If Not ValidationOK() Then
                cntrlError.errorMessage = ValidationMessage
                Exit Sub
            End If

            Dim result As String = ""
            result = _
                doSQLProcedure("spInventario_Add", Data.CommandType.StoredProcedure, , _
                               "@Operacion", hflOp.Value, _
                               "@Caja", txtBox.Text, _
                               "@Mercancia", txtMercancia.Text, _
                               "@FechaIn", CDate(txtFecha.Text), _
                               "@Peso", txtPeso.Text,
                               "@Cliente", hflCliente.Value, _
                               "@Nombre", txtNombre.Text, _
                               "@RSocial", hflRazon.Value, _
                               "@Valorc", txtValor.Text, _
                               "@Fraccion", txtFraccion.Text, _
                               "@Cajas", txtMUM.Text, _
                               "@UM", ddlUM.SelectedValue, _
                               "@Importador", txtImp1.Text, _
                               "@DirImp", hflImp2.Value, _
                               "@ClavePed", txtClave.Text, _
                               "@FechaAb", txtFechaAb.Text, _
                               "@Contenedor", txtCont.Text, _
                               "@Bultos", txtBultos.Text)

            If result <> "" Then
                cntrlError.errorMessage = result
            Else
                RaiseEvent Aceptar()
            End If
        Catch ex As Exception
            cntrlError.errorMessage = ex.Message
        End Try
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        RaiseEvent Cancelar()
    End Sub

    Protected Function ValidationOK() As Boolean
        ValidationOK = True
        ValidationMessage = ""

        For Each c As Control In Me.Controls
            If c.GetType() = (New TextBox).GetType() Then
                Dim txtb As TextBox = DirectCast(c, TextBox)
                If txtb.Enabled Then
                    txtb.CssClass = "textboxg uppercase"
                    Dim t As String = txtb.Text
                    If t.Trim = "" Then
                        ValidationOK = False
                        txtb.CssClass = "textboxr uppercase"
                    End If
                End If
            End If
        Next

        If Not ValidationOK Then
            ValidationMessage = "Ninguno de los valores pueden quedar vacíos."
        End If

        If Not IsNumeric(txtValor.Text) Then
            ValidationOK = False
            ValidationMessage &= IIf(ValidationMessage <> "", "<br>", "") & "El campo 'Valor Comercial' debe ser numérico."
            txtValor.CssClass = "textboxr uppercase"
        End If

        If Not IsNumeric(txtFraccion.Text) Or txtFraccion.Text.Trim.Length > 8 Then
            ValidationOK = False
            ValidationMessage &= IIf(ValidationMessage <> "", "<br>", "") & "El campo 'Fracción A.' debe ser numérico y no mayor de 8 dígitos."
            txtFraccion.CssClass = "textboxr uppercase"
        End If

        If txtClave.Text.Trim.Length < 2 Or txtClave.Text.Trim.Length > 10 Then
            ValidationOK = False
            ValidationMessage &= IIf(ValidationMessage <> "", "<br>", "") & "El campo 'Clave de pedimento' debe mínimo de 2 caracteres y máximo 10."
            txtClave.CssClass = "textboxr uppercase"
        End If

        If Not ValidImportador(txtImp1.Text) Then
            txtImp1.CssClass = "textboxr uppercase"
            ValidationOK = False
            ValidationMessage &= IIf(ValidationMessage <> "", "<br>", "") & "El Nombre del Importador no es válido."
        End If

        If Not ValidClient(txtNombre.Text) Then
            txtNombre.CssClass = "textboxr uppercase"
            ValidationOK = False
            ValidationMessage &= IIf(ValidationMessage <> "", "<br>", "") & "El Nombre del Cliente no es válido."
        End If

        If Not IsNumeric(txtMUM.Text) Then
            txtMUM.CssClass = "textboxr uppercase"
            ValidationOK = False
            ValidationMessage &= IIf(ValidationMessage <> "", "<br>", "") & "El campo 'Mercancía en UM' debe ser numérico."
        End If

        Return ValidationOK
    End Function

    Protected Function ValidClient(Clientname As String) As Boolean
        Dim dt As DataTable = SQLDataTable("SELECT Clave FROM Clientes WHERE Nombre = '" & Clientname & "'")
        If Not dt Is Nothing Then
            If dt.Rows.Count = 1 Then
                Return True
            End If
        End If

        Return False
    End Function

    Protected Function ValidImportador(Importador As String) As Boolean
        Dim dt As DataTable = SQLDataTable("SELECT Clave FROM Importador WHERE Nombre = '" & Importador & "'")
        If Not dt Is Nothing Then
            If dt.Rows.Count = 1 Then
                Return True
            End If
        End If

        Return False
    End Function

End Class
