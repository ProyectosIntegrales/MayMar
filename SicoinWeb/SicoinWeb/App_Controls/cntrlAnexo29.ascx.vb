Imports System.Data


Partial Class App_Controls_cntrlAnexo29
    Inherits System.Web.UI.UserControl


    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If txtFolio.Text.Trim = "" And rblOp.SelectedValue <> "U" Then
            rblOp.SelectedValue = Nothing
            OpcionSeleccionada()
        End If
    End Sub

    Public Sub Entrada()
        rblOp.SelectedValue = Nothing
        OpcionSeleccionada()
    End Sub
    Protected Function getNewFolio() As String

        Dim Folio As String

        Dim yr As String = Today.Year.ToString

        Try
            Dim dr As DataRow = SQLDataTable("Select Folio from vUltimoFolio").Rows(0)
            If dr Is Nothing Then
                cntrlError.errorMessage = "No se pudo generar el Nuevo Folio"
                Return Nothing
            End If

            Dim LastFolio As Integer = isNull(dr.Item("Folio"), 0)

            Folio = "M" & yr & (LastFolio + 1).ToString("0000") & FolioLetra()
            Return Folio
        Catch ex As Exception
            If ex.Message = "There is no row at position 0." Then
                Return "M" & Year(Today) & "0001" & FolioLetra()
            End If
            cntrlError.errorMessage = ex.Message

        End Try


    End Function

    Protected Sub InicializaFolios()
        txtDate.Text = Format(Now.Date, "dd/MM/yyyy")

        Select Case rblOp.SelectedValue
            Case "N", "X"
                txtFolio.Text = getNewFolio()
            Case "A"
                ddlFolios.DataBind()
            Case "U"
                txtFolio.Text = ""
                txtFolio.Focus()
        End Select

    End Sub
    Protected Function FolioLetra() As String
        Select Case rblOp.SelectedValue
            Case "N"
                Return "A"
            Case "A"
                Return "?"
            Case "X"
                Return "EX"
        End Select

        Return Nothing
    End Function

    Protected Sub rblOp_SelectedIndexChanged(sender As Object, e As EventArgs) Handles rblOp.SelectedIndexChanged

        OpcionSeleccionada()

    End Sub

    Protected Sub OpcionSeleccionada()
        clearAll()
        txtFolio.ReadOnly = True

        Select Case rblOp.SelectedValue
            Case "N", "X"

                txtFolio.ReadOnly = True

                txtFolio.Visible = True
                ddlFolios.Visible = False
                pnlData.Visible = True
                lblFolio.Visible = True
                txtDescripcion.Focus()
                CheckBox1.Visible = False

            Case "A"

                txtFolio.Visible = False
                ddlFolios.Visible = True
                pnlData.Visible = True
                lblFolio.Visible = True
                CheckBox1.Visible = False

            Case "U"
                pnlData.Visible = False
                lblFolio.Visible = True
                ddlFolios.Visible = False
                txtFolio.Visible = True
                txtFolio.ReadOnly = False
                txtFolio.Text = ""
                txtFolio.Focus()
                CheckBox1.Visible = False

            Case Else

                pnlData.Visible = False
                txtFolio.Visible = False
                ddlFolios.Visible = False
                lblFolio.Visible = False
        End Select

        InicializaFolios()
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click

        rblOp.SelectedValue = Nothing
        hflID.Value = Nothing
        OpcionSeleccionada()

    End Sub

    Protected Sub clearAll()
        pnlFields.Enabled = True
        CheckBox1.Checked = False
        hflID.Value = Nothing

        For Each c As Control In pnlFields.Controls
            Dim t As TextBox = TryCast(c, TextBox)
            If t IsNot Nothing Then
                t.Text = ""
                t.CssClass = "textboxg uppercase"
            End If
        Next

        lblError.Text = ""

    End Sub

    Protected Sub btnOK_Click(sender As Object, e As EventArgs) Handles btnOK.Click
        If ValidationOK() Then
            Dim Tipo = rblOp.SelectedValue
            If CheckBox1.Checked Then
                Tipo = "CANCELADO"
            End If

            Dim result As String

            result =
                doSQLProcedure("spAnexo29", CommandType.StoredProcedure, ,
                               "@Action", IIf(rblOp.SelectedValue = "U", "U", "A"),
                               "@Folio", FolioNumero(txtFolio.Text),
                               "@FolioTipo", Tipo,
                               "@FolioTexto", txtFolio.Text,
                               "@Fecha", Date.ParseExact(txtDate.Text, "dd/MM/yyyy",
            System.Globalization.DateTimeFormatInfo.InvariantInfo),
                               "@Descripcion", txtDescripcion.Text.ToUpper,
                               "@PesoNeto", txtPesoNeto.Text,
                               "@Regimen", txtRegimen.Text.ToUpper,
                               "@Pedimento", txtDocumento.Text.ToUpper,
                               "@Motivo", txtMotivo.Text.ToUpper,
                               "@NoContenedor", txtNoContenedor.Text.ToUpper,
                               "@Medida", txtMedida.Text.ToUpper,
                               "@Tipo", txtTipo.Text.ToUpper,
                               "@Sellos", txtSellos.Text.ToUpper,
                               "@PesoBruto", 0,
                               "@NombreExp", txtNombreExp.Text.ToUpper,
                               "@Direccion", txtDireccion.Text.ToUpper,
                               "@Ciudad", txtCiudad.Text.ToUpper,
                               "@RFC", txtRFC.Text.ToUpper,
                               "@NombreTransporte", txtNombreTrns.Text.ToUpper,
                               "@Placas", txtPlacas.Text.ToUpper,
                               "@NoEconomico", txtNumEconomico.Text.ToUpper,
                               "@CAAT", txtCAAT.Text.ToUpper,
                               "@NombreOperador", txtNombreOper.Text.ToUpper,
                               "@NoLicencia", txtNoLicencia.Text.ToUpper,
                               "@NombreAgente", txtNombreAgente.Text.ToUpper,
                               "@Patente", txtPatente.Text.ToUpper,
                               "@Username", Session("Username")
                               )

            If result = "" Then
                If IsDBNull(hflID.Value) Or hflID.Value = "" Then
                    updateExportadores()
                End If

                Dim Folio As String = txtFolio.Text
                rblOp.SelectedValue = Nothing
                hflID.Value = Nothing
                OpcionSeleccionada()

                    cntrlRepAnexo291.goReport(Folio)

                Else
                    cntrlError.errorMessage = result
            End If

        Else
            cntrlError.errorMessage = ValidationMessage
        End If



    End Sub

    Protected Sub updateExportadores()
        Try
            Dim result As String
            result = doSQLProcedure("spAddUpdateExportadores", CommandType.StoredProcedure, , "@ID", hflID.Value, "@NombreExp", txtNombreExp.Text.ToUpper(), "@Direccion", txtDireccion.Text.ToUpper(), "@Ciudad", txtCiudad.Text.ToUpper(), "@RFC", txtRFC.Text.ToUpper())
        Catch ex As Exception

        End Try

    End Sub

    Protected Function FolioNumero(FolioText As String) As Integer
        Return Right(Left(FolioText, 9), 4)
    End Function

    Protected Sub ddlFolios_DataBound(sender As Object, e As EventArgs) Handles ddlFolios.DataBound
        'Try
        '    txtFolio.Text = ddlFolios.Items(0).Value
        '    CopiarFolio(txtFolio.Text.Trim)
        'Catch ex As Exception
        '    rblOp.SelectedValue = "N"
        '    OpcionSeleccionada()
        'End Try

    End Sub

    Protected Sub ddlFolios_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlFolios.SelectedIndexChanged
        txtFolio.Text = ddlFolios.SelectedValue

        CopiarFolio(txtFolio.Text.Trim)
    End Sub

    Protected Sub CopiarFolio(Folio As String)

        Try
            Dim folioLetra As String = Right(Folio, 1)
            Dim folioNumero As String = Left(Folio, 9)
            Dim PrevLetra As String = Chr(Asc(folioLetra) - 1)

            Dim dr As DataRow = SQLDataTable("Select * From tblAnexo29 Where FolioTexto = '" & folioNumero + PrevLetra & "'").Rows(0)

            CopiarDatos(dr)

        Catch ex As Exception
            cntrlError.errorMessage = ex.Message

        End Try

    End Sub

    Protected Sub CopiarDatos(dr As DataRow)

        txtDescripcion.Text = dr.Item("Descripcion")
        txtDate.Text = Format(dr.Item("Fecha"), "dd/MM/yyyy")
        txtPesoNeto.Text = dr.Item("PesoNeto")
        txtRegimen.Text = dr.Item("Regimen")
        txtDocumento.Text = dr.Item("Pedimento")
        txtMotivo.Text = dr.Item("Motivo")
        txtNoContenedor.Text = dr.Item("NoContenedor")
        txtMedida.Text = dr.Item("Medida")
        txtTipo.Text = dr.Item("Tipo")
        txtSellos.Text = dr.Item("Sellos")

        txtNombreExp.Text = dr.Item("NombreExp")
        txtDireccion.Text = dr.Item("Direccion")
        txtCiudad.Text = dr.Item("Ciudad")
        txtRFC.Text = dr.Item("RFC")
        txtNombreTrns.Text = dr.Item("NombreTransporte")
        txtPlacas.Text = dr.Item("Placas")
        txtNumEconomico.Text = dr.Item("NoEconomico")
        txtCAAT.Text = dr.Item("CAAT")
        txtNombreOper.Text = dr.Item("NombreOperador")
        txtNoLicencia.Text = dr.Item("NoLicencia")
        txtNombreAgente.Text = dr.Item("NombreAgente")
        txtPatente.Text = dr.Item("Patente")

        If Not CheckBox1.Checked Then
            If dr.Item("FolioTipo").trim = "CANCELADO" Then
                CheckBox1.Checked = True
                CheckBox1.Text = "CANCELADO"
                pnlFields.Enabled = False
            Else
                CheckBox1.Checked = False
                CheckBox1.Text = "Marcar como cancelado"
                pnlFields.Enabled = True
            End If
        End If

    End Sub

    Protected Sub cntrlRepAnexo291_Closed() Handles cntrlRepAnexo291.Closed
        rblOp.SelectedValue = Nothing
        OpcionSeleccionada()
    End Sub

    Protected Sub txtFolio_TextChanged(sender As Object, e As EventArgs) Handles txtFolio.TextChanged
        lblError.Text = ""

        If txtFolio.Text <> "" Then
            Dim dt As DataTable = SQLDataTable("SELECT * From tblAnexo29 WHERE FolioTexto = '" & txtFolio.Text & "'")
            If Not dt Is Nothing Then
                If dt.Rows.Count = 1 Then
                    pnlData.Visible = True
                    ModificaFolio(txtFolio.Text)
                Else
                    lblError.Text = "No se encontró el folio especificado."
                    txtFolio.Focus()
                End If

            End If
        End If
    End Sub

    Protected Sub ModificaFolio(Folio As String)
        CheckBox1.Visible = True
        Try

            Dim dr As DataRow = SQLDataTable("Select * From tblAnexo29 Where FolioTexto = '" & Folio & "'").Rows(0)

            CopiarDatos(dr)

        Catch ex As Exception
            cntrlError.errorMessage = ex.Message

        End Try

    End Sub

    Dim ValidationMessage As String
    Protected Function ValidationOK() As Boolean
        ValidationOK = True
        ValidationMessage = ""

        For Each c As Control In pnlData.Controls
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

        If Not IsNumeric(txtPesoNeto.Text) Then
            ValidationOK = False
            ValidationMessage &= IIf(ValidationMessage <> "", "<br>", "") & "El campo 'Peso neto' debe ser numérico."
            txtPesoNeto.CssClass = "textboxr uppercase"
        End If

        'If Not ValidImportador(txtImp1.Text) Then
        '    txtImp1.CssClass = "textboxr uppercase"
        '    ValidationOK = False
        '    ValidationMessage &= IIf(ValidationMessage <> "", "<br>", "") & "El Nombre del Importador no es válido."
        'End If

        'If Not ValidClient(txtNombre.Text) Then
        '    txtNombre.CssClass = "textboxr uppercase"
        '    ValidationOK = False
        '    ValidationMessage &= IIf(ValidationMessage <> "", "<br>", "") & "El Nombre del Cliente no es válido."
        'End If

        'If Not IsNumeric(txtMUM.Text) Then
        '    txtMUM.CssClass = "textboxr uppercase"
        '    ValidationOK = False
        '    ValidationMessage &= IIf(ValidationMessage <> "", "<br>", "") & "El campo 'Mercancía en UM' debe ser numérico."
        'End If

        Return ValidationOK
    End Function

    Protected Sub lnbReporte_Click(sender As Object, e As EventArgs) Handles lnbReporte.Click
        cntrlRepAnexo29XLS1.goReport()
    End Sub

    Protected Sub CheckBox1_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox1.CheckedChanged

        pnlFields.Enabled = Not CheckBox1.Checked
        ModificaFolio(txtFolio.Text)

        'Dim tb As New TextBox
        'For Each c As Control In pnlMain.Controls
        '    If TypeOf c Is TextBox Then
        '        tb = c
        '        tb.Enabled = Not CheckBox1.Checked
        '    End If

        'Next
    End Sub
End Class
