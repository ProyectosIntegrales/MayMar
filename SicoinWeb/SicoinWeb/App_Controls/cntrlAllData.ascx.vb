Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics

Partial Class cntrlAllData
    Inherits UserControl

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles Me.PreRender
        Session("op") = txtOp.Text

    End Sub

    Public WriteOnly Property Operacion As String
        Set(value As String)
            hflOp.Value = value
            getData()
            btnOK.Visible = False
            EnableFields(False)
        End Set
    End Property

    Public Property SuperAdmin As Boolean
        Set(value As Boolean)
            hflSA.Value = value
        End Set
        Get
            Return IIf(hflSA.Value <> "", hflSA.Value, False)
        End Get
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

        Dim dt As DataTable = SQLDataTable("SELECT i.*, a.Almacenaje FROM Inventario i LEFT OUTER JOIN Almacenaje a ON a.Operacion = i.Operacion WHERE i.Operacion = '" & hflOp.Value & "'")
        If Not dt Is Nothing And dt.Rows.Count > 0 Then
            Dim dr As DataRow = dt.Rows(0)

            txtOp.Text = hflOp.Value.Trim
            txtNewOper.Text = hflOp.Value.Trim
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
            hflStatus.Value = isNull(dr("Status"), -1)
            Dim Terminado As Boolean = dr("Terminado")
            btnConfirmar.Visible = (hflStatus.Value = -1)
            btnMod.Visible = (hflStatus.Value = -1) Or SuperAdmin
            cntrlDamaged.ButtonVisible = Not Terminado
            Dim Almacenaje As Boolean = isNull(dr("Almacenaje"), False)
            chkAlmacenaje.Checked = Almacenaje

        End If
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
        result =
            doSQLProcedure("spInventario_All", CommandType.StoredProcedure, ,
                           "@Operacion", txtOp.Text,
                           "@NewOper", txtNewOper.Text,
                           "@Caja", txtBox.Text,
                           "@Mercancia", txtMercancia.Text,
                           "@FechaIn", txtFecha.Text,
                           "@Cajas", txtMUM.Text,
                           "@Peso", txtPeso.Text,
                           "@Cliente", hflCliente.Value,
                           "@Nombre", txtNombre.Text,
                           "@RSocial", hflRazon.Value,
                           "@Valorc", txtValor.Text,
                           "@Fraccion", txtFraccion.Text,
                           "@UM", ddlUM.SelectedValue,
                           "@Importador", txtImp1.Text,
                           "@ClavePed", txtClave.Text,
                           "@Fechaab", txtFechaAb.Text,
                           "@Contenedor", txtCont.Text,
                           "@DirImp", hflImp2.Value,
                           "@Bultos", txtBultos.Text,
                           "@FechaOut", txtFechaout.Text,
                           "@Descargado", txtDescargado.Text,
                           "@Remanente", txtRemanente.Text,
                           "@Factura", txtFactura.Text,
                           "@CFDI", txtCFDI.Text,
                           "@MontoCFDI", txtMontoMXP.Text,
                           "@MontoCFDIDlls", txtMontoUSD.Text,
                           "@Aprovechamiento", txtAprov.Text,
                           "@Almacenaje", chkAlmacenaje.Checked
                           )

        If result <> "" Then
            cntrlError.errorMessage = result
        Else
            If txtNewOper.Text <> txtOp.Text Then
                Session("op") = txtNewOper.Text
            End If

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

    Protected Sub btnMod_clicked(sender As Object, e As EventArgs) Handles btnMod.Click
        EnableFields(True)
        btnMod.Visible = False
        btnConfirmar.Visible = False
    End Sub

    Public Sub EnableFields(Enabled As Boolean)

        btnOK.Visible = Enabled
        For Each c As Control In Me.Controls
            If c.GetType() = (New TextBox).GetType() Then
                Dim txtb As TextBox = DirectCast(c, TextBox)
                If txtb.ID <> "txtImp2" And txtb.ID <> "txtRazon" And txtb.ID <> "txtCliente" Then
                    txtb.Enabled = Enabled
                    txtb.CssClass = "textboxg uppercase"
                End If

            End If
        Next
        ddlUM.Enabled = Enabled
        chkAlmacenaje.Enabled = Enabled

    End Sub

    Protected Sub btnConfirmar_Click(sender As Object, e As EventArgs) Handles btnConfirmar.Click
        Dim result As String = ""
        result =
            doSQLProcedure("UPDATE Inventario SET Status = 0, FechaIn = GETDATE() WHERE Operacion = '" + txtOp.Text.Trim() + "'", CommandType.Text)

        If result <> "" Then
            cntrlError.errorMessage = result
        Else
            If txtNewOper.Text <> txtOp.Text Then
                Session("op") = txtNewOper.Text
            End If

            RaiseEvent Aceptar()
        End If
    End Sub





End Class


Public Class AllDataEventArgs
    Inherits EventArgs

    Public Property AdditionalData As String

    Public Sub New(data As String)
        AdditionalData = data
    End Sub
End Class
