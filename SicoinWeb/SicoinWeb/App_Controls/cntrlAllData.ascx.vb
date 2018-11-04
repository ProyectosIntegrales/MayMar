Imports System.Data
Partial Class cntrlAllData
    Inherits System.Web.UI.UserControl

    Public WriteOnly Property Operacion As String
        Set(value As String)
            hflOp.Value = value
            getData()
            btnModify.Visible = True
            btnOK.Visible = False
            EnableFields(False)
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
        Next

    End Sub

    Protected Sub getData()
        Dim dt As DataTable = SQLDataTable("SELECT * FROM Inventario WHERE Operacion = '" & hflOp.Value & "'")
        If Not dt Is Nothing Then
            Dim dr As DataRow = dt.Rows(0)

            txtOp.Text = hflOp.Value.Trim
            txtBox.Text = dr("Caja")
            txtMercancia.Text = dr("Mercancia")
            txtFecha.Text = dr("Fechain")
            txtPeso.Text = dr("Peso")
            txtMUM.Text = isNull(dr("Cajas"), 0)
            txtCliente.Text = dr("Cliente")
            hflCliente.Value = dr("Cliente")
            txtNombre.Text = dr("Nombre")
            txtRazon.Text = dr("RSocial")
            hflRazon.Value = dr("RSocial")
            txtValor.Text = dr("Valorc")
            txtFraccion.Text = dr("Fraccion")
            txtImp1.Text = dr("Importador")
            txtImp2.Text = dr("Dirimp")
            hflImp2.Value = dr("DirImp")
            txtClave.Text = dr("ClavePed")
            txtFechaAb.Text = dr("Fechaab")
            txtCont.Text = dr("Contenedor")
            txtBultos.Text = dr("Bultos")
            ddlUM.SelectedValue = dr("UM")
            txtFechaout.Text = dr("Fechaout")
            txtTiempo.Text = DateDiff("d", txtFecha.Text, txtFechaout.Text)
            txtDescargado.Text = dr("Descargado")
            txtRemanente.Text = dr("Remanente")
            txtFactura.Text = isNull(dr("Factura"), "").trim
            txtCFDI.Text = isNull(dr("CFDI"), "").trim
            txtMontoMXP.Text = isNull(dr("MontoCFDI"), "")
            txtMontoUSD.Text = isNull(dr("MontoCFDIDlls"), "")
            txtAprov.Text = isNull(dr("Aprovechamiento"), "")

            Dim Terminado As Boolean = dr("Terminado")

            btnModify.Visible = Session("IsAdmin")
            
        End If
        '  clearAll()
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

            SaveData(False)

        Catch ex As Exception
            cntrlError.errorMessage = ex.Message
        End Try
    End Sub

    Protected Sub SaveData(term As Boolean)
        Dim result As String = ""
        result = _
            doSQLProcedure("spInventario_All", Data.CommandType.StoredProcedure, , _
                           "@Operacion", hflOp.Value,
                           "@NewOper", txtOp.Text, _
                           "@Caja", txtBox.Text, _
                           "@Mercancia", txtMercancia.Text, _
                           "@FechaIn", txtFecha.Text, _
                           "@Cajas", txtMUM.Text, _
                           "@Peso", txtPeso.Text, _
                           "@Cliente", hflCliente.Value, _
                           "@Nombre", txtNombre.Text, _
                           "@RSocial", hflRazon.Value, _
                           "@Valorc", txtValor.Text, _
                           "@Fraccion", txtFraccion.Text, _
                           "@UM", ddlUM.SelectedValue, _
                           "@Importador", txtImp1.Text, _
                           "@ClavePed", txtClave.Text, _
                           "@Fechaab", txtFechaAb.Text, _
                           "@Contenedor", txtCont.Text, _
                           "@DirImp", hflImp2.Value, _
                           "@Bultos", txtBultos.Text, _
                           "@FechaOut", txtFechaout.Text, _
                           "@Descargado", txtDescargado.Text, _
                           "@Remanente", txtRemanente.Text, _
                           "@Factura", txtFactura.Text,
                           "@CFDI", txtCFDI.Text, _
                           "@MontoCFDI", txtMontoMXP.Text, _
                           "@MontoCFDIDlls", txtMontoUSD.Text, _
                           "@Aprovechamiento", txtAprov.Text)

        If result <> "" Then
            cntrlError.errorMessage = result
        Else
            RaiseEvent Aceptar()
        End If
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        RaiseEvent Cancelar()
    End Sub

    Protected Function ValidationOK() As Boolean
        ValidationOK = True
        ValidationMessage = ""

        If Not IsNumeric(txtMontoMXP.Text) And txtMontoMXP.Text <> "" And txtCFDI.Text <> "" Then
            ValidationOK = False
            ValidationMessage &= IIf(ValidationMessage <> "", "<br>", "") & "El campo 'Monto MXP' debe ser numérico."
            txtFraccion.CssClass = "textboxr"
        End If

        If Not IsNumeric(txtMontoUSD.Text) And txtMontoUSD.Text <> "" And txtCFDI.Text <> "" Then
            ValidationOK = False
            ValidationMessage &= IIf(ValidationMessage <> "", "<br>", "") & "El campo 'Monto USD' debe ser numérico."
            txtFraccion.CssClass = "textboxr"
        End If

        Return ValidationOK
    End Function

    Protected Sub txtDescargado_TextChanged(sender As Object, e As EventArgs) Handles txtDescargado.TextChanged
        If IsNumeric(txtDescargado.Text) Then
            txtRemanente.Text = txtPeso.Text - txtDescargado.Text
        End If
    End Sub


    Protected Sub btnModify_Click(sender As Object, e As EventArgs) Handles btnModify.Click
        mdlLogin.Show()
    End Sub

    Protected Sub cntrlLogin_Cancel() Handles cntrlLogin.Cancel
        mdlLogin.Hide()
    End Sub
    Protected Sub cntrlLogin_LoginOK(Username As String) Handles cntrlLogin.LoginOK

        btnModify.Visible = False
        btnOK.Visible = True
        EnableFields(True)

    End Sub
    Protected Sub EnableFields(Enabled As Boolean)

        For Each c As Control In Me.Controls
            If c.GetType() = (New TextBox).GetType() Then
                Dim txtb As TextBox = DirectCast(c, TextBox)
                If txtb.ID <> "txtImp2" And txtb.ID <> "txtRazon" And txtb.ID <> "txtCliente" Then
                    txtb.Enabled = Enabled
                    txtb.CssClass = "textboxg uppercase"
                End If

            End If
            ddlUM.Enabled = Enabled
        Next


    End Sub
End Class
