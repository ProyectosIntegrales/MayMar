Imports System.Data
Imports CrystalDecisions.Web

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

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then

        End If
    End Sub

    Protected Sub getData()
        Dim dt As DataTable = SQLDataTable("SELECT i.*, a.Almacenaje FROM Inventario i LEFT OUTER JOIN Almacenaje a ON a.Operacion = i.Operacion WHERE i.Operacion = '" & hflOp.Value & "'")
        If dt IsNot Nothing Then
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
            pnlCompartido.Visible = False
            Dim Terminado As Boolean = dr("Terminado")
            Dim Almacenaje As Boolean = isNull(dr("Almacenaje"), False)

            chkCompartido.Checked = False
            chkAlmacenaje.Checked = Almacenaje
            txtFactura.Focus()
            txtCFDI.ReadOnly = False
            txtMontoMXP.Enabled = True
            txtMontoUSD.Enabled = True

        End If
        clearAll()
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

            SaveData(False)

        Catch ex As Exception
            cntrlError.errorMessage = ex.Message
        End Try
    End Sub

    Protected Sub SaveData(term As Boolean)
        Dim compartidoCon As String = ""
        If chkCompartido.Checked Then
            compartidoCon = ddFacturas.SelectedItem.Text
        End If

        Dim result As String = ""
        result =
            doSQLProcedure("spInventario_CFDI", Data.CommandType.StoredProcedure, ,
                           "@Operacion", hflOp.Value,
                           "@Factura", txtFactura.Text,
                           "@CFDI", txtCFDI.Text,
                           "@MontoCFDI", txtMontoMXP.Text,
                           "@MontoCFDIDlls", txtMontoUSD.Text,
                           "@Aprovechamiento", txtAprov.Text,
                           "@Compartido", chkCompartido.Checked,
                           "@CompartidoCon", compartidoCon,
                           "@Almacenaje", chkAlmacenaje.Checked
            )

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

        If chkCompartido.Checked And ddFacturas.SelectedItem Is Nothing Then
            ValidationOK = False
            ValidationMessage &= IIf(ValidationMessage <> "", "<br>", "") & "No se ha seleccionado Operacion/Pedimento Compartido"
            ddFacturas.CssClass = "textboxr"
        End If

        Return ValidationOK
    End Function

    Protected Sub txtDescargado_TextChanged(sender As Object, e As EventArgs) Handles txtDescargado.TextChanged
        If IsNumeric(txtDescargado.Text) Then
            txtRemanente.Text = txtPeso.Text - txtDescargado.Text
        End If
    End Sub

    Protected Sub chkCompartido_CheckedChanged(sender As Object, e As EventArgs)
        pnlCompartido.Visible = chkCompartido.Checked
        If chkCompartido.Checked Then
            dsFacturas.DataBind()
            ddFacturas.DataBind()
            SetValues()
        Else
            txtCFDI.Text = ""
            txtMontoMXP.Text = ""
            txtMontoUSD.Text = ""
            txtAprov.Text = ""
            txtCFDI.ReadOnly = False
            txtMontoMXP.Enabled = True
            txtMontoUSD.Enabled = True
            txtAprov.Enabled = True
            txtCFDI.Focus()
        End If
    End Sub

    Protected Sub txtFactura_TextChanged(sender As Object, e As EventArgs)
        dsFacturas.DataBind()
        ddFacturas.DataBind()
        If ddFacturas.Items.Count > 0 Then
            pnlCompartido.Visible = True
            chkCompartido.Checked = True
            chkCompartido.Enabled = False
            SetValues()
        Else
            pnlCompartido.Visible = False
            chkCompartido.Checked = False
            chkCompartido.Enabled = True
            SetValues()
        End If
    End Sub

    Protected Sub ddFacturas_SelectedIndexChanged(sender As Object, e As EventArgs)
        txtCFDI.Text = ddFacturas.SelectedItem.Value
        txtAprov.Focus()
    End Sub

    Private Sub SetValues()
        If ddFacturas.SelectedItem IsNot Nothing Then
            Dim dv As DataView = DirectCast(dsFacturas.Select(DataSourceSelectArguments.Empty), DataView)
            Dim dr As DataRow = dv.Item(0).Row
            txtCFDI.Text = ddFacturas.SelectedItem.Value
            txtAprov.Text = "0"
            txtMontoMXP.Text = dr.Item("MontoCFDI")
            txtMontoUSD.Text = dr.Item("MontoCFDIDlls")
            txtAprov.Enabled = False
            txtMontoMXP.Enabled = False
            txtMontoUSD.Enabled = False
            txtCFDI.ReadOnly = True
        Else
            txtCFDI.Text = ""
            txtMontoMXP.Text = ""
            txtMontoUSD.Text = ""
            txtAprov.Text = ""
            txtAprov.Enabled = True
            txtMontoMXP.Enabled = True
            txtMontoUSD.Enabled = True
            txtCFDI.ReadOnly = False
        End If
    End Sub

    Public Event ModBtnClicked(o As String)
    Protected Sub btnMod_Click(sender As Object, e As EventArgs) Handles btnMod.Click
        RaiseEvent ModBtnClicked("CDFI")
    End Sub
End Class
