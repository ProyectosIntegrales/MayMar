﻿Imports System.Data
Partial Class cntrlCFDIData
    Inherits System.Web.UI.UserControl

    Public WriteOnly Property Operacion As String
        Set(value As String)
            hflOp.Value = value
            getData()
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

            txtBox.Text = dr("Caja")
            txtMercancia.Text = dr("Mercancia")
            txtFecha.Text = dr("Fechain")
            txtPeso.Text = dr("Peso")
            txtCliente.Text = dr("Cliente")
            txtNombre.Text = dr("Nombre")
            txtRazon.Text = dr("RSocial")
            txtMUM.Text = isNull(dr("Cajas"), 0)
            txtValor.Text = dr("Valorc")
            txtFraccion.Text = dr("Fraccion")
            txtImp1.Text = dr("Importador")
            txtImp2.Text = dr("Dirimp")
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

            btnMod.Visible = Session("IsAdmin")

            txtFactura.Focus()

        End If
        clearAll()
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
            doSQLProcedure("spInventario_CFDI", Data.CommandType.StoredProcedure, , _
                           "@Operacion", hflOp.Value, _
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

    Public Event ModBtnClicked()
    Protected Sub btnMod_Click(sender As Object, e As EventArgs) Handles btnMod.Click
        RaiseEvent ModBtnClicked()
    End Sub
End Class
