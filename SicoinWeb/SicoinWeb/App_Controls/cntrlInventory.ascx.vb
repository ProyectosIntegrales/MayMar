Imports System.Data
Imports System.Web
Partial Class App_Controls_cntrlInventory
    Inherits UI.UserControl

    Public WriteOnly Property Username As String
        Set(value As String)
            hflUsername.Value = value
            cntrlOutputData.Username = value
        End Set
    End Property

    Public Property SuperAdmin As Boolean
        Set(value As Boolean)
            hflSA.Value = value
            btnSA.Visible = value
        End Set
        Get
            Return IIf(hflSA.Value <> "", hflSA.Value, False)
        End Get
    End Property

    Dim Terminado As Boolean

    Dim Status As Integer

    Protected Sub txtOp_TextChanged(sender As Object, e As EventArgs) Handles txtOp.TextChanged
        If hflChanging.Value = True Then
            Exit Sub
        End If

        btnGo.Visible = txtOp.Text <> ""

        cntrlInputData.Visible = False
        cntrlOutputData.Visible = False
        cntrlCFDIData.Visible = False
        cntrlInputData.clearAll()
        cntrlOutputData.clearAll()
        cntrlCFDIData.clearAll()
        cntrlAllData.clearAll()

        txtOp.Text = txtOp.Text.ToUpper
        pnlValid.Visible = False
        pnlNotExists.Visible = False
        pnlTryagain.Visible = False
        dvMsg.Visible = False

        If txtOp.Text.Trim <> "" And txtOp.Text.Trim.Length >= 11 Then
            Dim AlreadyExist As Boolean = Exists(txtOp.Text)

            If AlreadyExist Then
                If (rblOp.SelectedValue = "SA") Then
                    cntrlAllData.Visible = True
                    cntrlAllData.Operacion = txtOp.Text
                End If
            Else
                If rblOp.SelectedValue = "SA" Then
                    pnlNotExists.Visible = True
                Else
                    pnlValid.Visible = True
                End If
                btnGo.Visible = False
            End If
        Else
            If Not txtOp.Text = "" Then
                pnlTryagain.Visible = True
            End If
            txtOp.Enabled = True
            btnGo.Visible = False
            txtOp.Focus()
        End If


    End Sub

    Private Function Exists(OperationNo As String) As Boolean
        Dim dt As DataTable = SQLDataTable("SELECT * FROM Inventario WHERE Operacion = '" & OperationNo & "'")
        If Not dt Is Nothing And dt.Rows.Count = 1 Then
            Terminado = dt.Rows(0)("Terminado")
            Status = isNull(dt.Rows(0)("Status"), 0)
            Return True
        End If

        Return False
    End Function

    Protected Sub btnNew_Click(sender As Object, e As EventArgs) Handles btnNew.Click
        cntrlInputData.Visible = True
        cntrlInputData.clearAll()
        cntrlInputData.Operacion = txtOp.Text.Trim
        pnlValid.Visible = False
        pnlNotExists.Visible = False
        txtOp.Enabled = False
    End Sub

    Public Sub Initialize()
        rblOp.Items.FindByValue("SA").Enabled = SuperAdmin
        hflChanging.Value = False

            InitRbl()

            btnGo.Visible = False
            pnlTryagain.Visible = False
        pnlNotExists.Visible = False
        dvMsg.Visible = False
        txtOp.Text = ""
            txtOp.Focus()
            EnableButtons(True)

    End Sub

    Protected Sub btnCancelNew_Click(sender As Object, e As EventArgs) Handles btnCancelNew.Click
        pnlValid.Visible = False
        Initialize()
    End Sub

    Protected Sub cntrlInputData_Aceptar() Handles cntrlInputData.Aceptar
        cntrlInputData.clearAll()
        cntrlInputData.Visible = False
        Initialize()
        dvMsg.Visible = True
    End Sub

    Protected Sub cntrlOutputData_Aceptar() Handles cntrlOutputData.Aceptar
        cntrlOutputData.clearAll()
        cntrlOutputData.Visible = False
        Initialize()
        dvMsg.Visible = True
    End Sub

    Public Sub cntrlInputData_Cancelar() Handles cntrlInputData.Cancelar
        cntrlInputData.clearAll()
        cntrlInputData.Visible = False
        Initialize()
    End Sub

    Public Sub cntrlOutputData_Cancelar() Handles cntrlOutputData.Cancelar
        cntrlOutputData.clearAll()
        cntrlOutputData.Visible = False
        Initialize()
    End Sub
    Protected Sub cntrlCFDIData_Aceptar() Handles cntrlCFDIData.Aceptar
        cntrlCFDIData.clearAll()
        cntrlCFDIData.Visible = False
        Initialize()
        dvMsg.Visible = True
    End Sub

    Protected Sub cntrlCFDIData_Cancelar() Handles cntrlCFDIData.Cancelar
        cntrlCFDIData.clearAll()
        cntrlCFDIData.Visible = False
        Initialize()
    End Sub

    Protected Sub cntrlAllData_Aceptar() Handles cntrlAllData.Aceptar
        cntrlAllData.clearAll()
        cntrlAllData.Visible = False
        Initialize()
        dvMsg.Visible = True
    End Sub

    Protected Sub cntrlAllData_Cancelar() Handles cntrlAllData.Cancelar
        cntrlAllData.clearAll()
        cntrlAllData.Visible = False
        Initialize()
    End Sub

    Protected Sub InitRbl()
        Select Case rblOp.SelectedValue

            Case "IN"
                txtOp.Visible = True
                txtOp.Enabled = True
                lblOper.Visible = True
                ddlOut.Visible = False
                ddlCFDI.Visible = False
                btnGo.Visible = False
                txtOp.Focus()

            Case "OUT"
                txtOp.Visible = False
                ddlOut.Visible = True
                lblOper.Visible = True
                ddlCFDI.Visible = False
                btnGo.Visible = True
                ddlOut.DataBind()

            Case "CFDI"
                txtOp.Visible = False
                ddlOut.Visible = False
                lblOper.Visible = True
                ddlCFDI.Visible = True
                btnGo.Visible = True
                ddlCFDI.DataBind()

            Case "AB"
                txtOp.Visible = False
                ddlOut.Visible = False
                ddlCFDI.Visible = False
                lblOper.Visible = False
                btnGo.Visible = False
                cntrlAbandono.Visible = True

            Case "SA"
                txtOp.Visible = True
                txtOp.Enabled = True
                ddlOut.Visible = False
                ddlCFDI.Visible = False
                lblOper.Visible = True
                btnGo.Visible = False
                txtOp.Focus()

        End Select
    End Sub

    Protected Sub ddlOut_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlOut.SelectedIndexChanged
        cntrlOutputData.Operacion = ddlOut.SelectedValue
    End Sub

    Protected Sub btnGo_Click(sender As Object, e As EventArgs) Handles btnGo.Click
        Select Case rblOp.SelectedValue

            Case "IN"
                If txtOp.Text <> "" Then
                    txtOp.Visible = True
                    txtOp.Enabled = False
                    ddlOut.Visible = False
                    ddlCFDI.Visible = False
                    ClosePanels()
                    cntrlInputData.Operacion = txtOp.Text
                    cntrlInputData.Visible = True
                    btnGo.Visible = False
                    EnableButtons(False)
                End If

            Case "OUT"
                txtOp.Visible = True
                txtOp.Text = ddlOut.SelectedValue.Trim
                txtOp.Enabled = False
                ddlOut.Visible = False
                ClosePanels()
                cntrlOutputData.Visible = True
                cntrlOutputData.Operacion = ddlOut.SelectedValue
                btnGo.Visible = False
                EnableButtons(False)

            Case "CFDI"
                txtOp.Visible = True
                txtOp.Text = ddlCFDI.SelectedValue.Trim
                txtOp.Enabled = False
                ddlCFDI.Visible = False
                ClosePanels()
                cntrlCFDIData.Visible = True
                cntrlCFDIData.Operacion = ddlCFDI.SelectedValue
                btnGo.Visible = False
                EnableButtons(False)

            Case "SA"
                If txtOp.Text <> "" Then
                    txtOp.Visible = True
                    txtOp.Enabled = False
                    ddlOut.Visible = False
                    ddlCFDI.Visible = False
                    ClosePanels()
                    cntrlAllData.Visible = True
                    cntrlAllData.EnableFields(True)
                    btnGo.Visible = False
                    EnableButtons(False)
                End If

        End Select

        'If Not pnlTryagain.Visible Then
        '    btnGo.Visible = False
        '    txtOp.Enabled = False
        'End If

    End Sub

    Protected Sub rblOp_SelectedIndexChanged(sender As Object, e As EventArgs) Handles rblOp.SelectedIndexChanged

        Initialize()
        InitRbl()

    End Sub

    Protected Sub lnbReportes_Click(sender As Object, e As EventArgs) Handles lnbReportes.Click
        'pnlMain.Visible = False
        cntrlReports.goReport()
        ' pnlAdmin.Visible = False
    End Sub



    Protected Sub cntrlReports_Closed() Handles cntrlReports.Closed
        Initialize()
    End Sub

    Protected Sub lnbReportAb_Click(sender As Object, e As EventArgs) Handles lnbReportAb.Click
        cntrlRepAbandono.goReport()
    End Sub
    Protected Sub lnbAb_Click(sender As Object, e As EventArgs)
        cntrlAbandono.Visible = True

    End Sub
    Protected Sub ClosePanels()
        cntrlInputData.Visible = False
        cntrlOutputData.Visible = False
        cntrlCFDIData.Visible = False
        cntrlAllData.Visible = False
        cntrlAbandono.Visible = False
        btnGo.Visible = False
        pnlTryagain.Visible = False
        dvMsg.Visible = False
    End Sub

    Protected Sub btnCapturaIn_Click(sender As Object, e As EventArgs) Handles btnCapturaIn.Click
        ClosePanels()
        SetBtnClass(sender)
        rblOp.SelectedValue = "IN"
        InitRbl()
    End Sub

    Protected Sub btnCapturaOut_Click(sender As Object, e As EventArgs) Handles btnCapturaOut.Click
        ClosePanels()
        SetBtnClass(sender)
        rblOp.SelectedValue = "OUT"
        InitRbl()
    End Sub

    Protected Sub btnCDFI_Click(sender As Object, e As EventArgs) Handles btnCDFI.Click
        ClosePanels()
        SetBtnClass(sender)
        rblOp.SelectedValue = "CFDI"
        InitRbl()
    End Sub

    Protected Sub btnSA_Click(sender As Object, e As EventArgs) Handles btnSA.Click
        ClosePanels()
        SetBtnClass(sender)
        rblOp.SelectedValue = "SA"
        InitRbl()
    End Sub

    Protected Sub EnableButtons(value As Boolean)
        btnCapturaIn.Enabled = value
        btnCapturaOut.Enabled = value
        btnCDFI.Enabled = value
        btnSA.Enabled = value

        If rblOp.SelectedValue = "IN" Then
            btnCapturaIn.CssClass = "btn btn-selected"
        End If

        If (value = False) Then
            btnCapturaIn.CssClass = IIf(rblOp.SelectedValue = "IN", "btn btn-selected", "btn btn-disabled")
            btnCapturaOut.CssClass = IIf(rblOp.SelectedValue = "OUT", "btn btn-selected", "btn btn-disabled")
            btnCDFI.CssClass = IIf(rblOp.SelectedValue = "CFDI", "btn btn-selected", "btn btn-disabled")
            btnSA.CssClass = IIf(rblOp.SelectedValue = "SA", "btn btn-selected", "btn btn-disabled")
        Else
            btnCapturaIn.CssClass = IIf(rblOp.SelectedValue = "IN", "btn btn-selected", "btn")
            btnCapturaOut.CssClass = IIf(rblOp.SelectedValue = "OUT", "btn btn-selected", "btn")
            btnCDFI.CssClass = IIf(rblOp.SelectedValue = "CFDI", "btn btn-selected", "btn")
            btnSA.CssClass = IIf(rblOp.SelectedValue = "SA", "btn btn-selected", "btn")
        End If

    End Sub

    Private Sub SetBtnClass(ByRef btn As Button)
        btnCapturaIn.CssClass = "btn"
        btnCapturaOut.CssClass = "btn"
        btnCDFI.CssClass = "btn"
        btnSA.CssClass = "btn"
        btn.CssClass = "btn btn-selected"
    End Sub
End Class
