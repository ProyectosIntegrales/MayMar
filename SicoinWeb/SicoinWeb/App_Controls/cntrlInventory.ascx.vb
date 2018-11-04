Imports System.Data
Partial Class App_Controls_cntrlInventory
    Inherits System.Web.UI.UserControl

    Dim Terminado As Boolean

    Dim Status As Integer
    Protected Sub txtOp_TextChanged(sender As Object, e As EventArgs) Handles txtOp.TextChanged
        If hflChanging.Value = True Then
            Exit Sub
        End If

        cntrlInputData.Visible = False
        cntrlOutputData.Visible = False
        cntrlCFDIData.Visible = False
        cntrlInputData.clearAll()
        cntrlOutputData.clearAll()
        cntrlCFDIData.clearAll()

        txtOp.Text = txtOp.Text.ToUpper
        pnlValid.Visible = False
        pnlTryagain.Visible = False
        '  dvMsg.Visible = False

        If txtOp.Text.Trim <> "" And txtOp.Text.Trim.Length >= 11 Then
            Dim AlreadyExist As Boolean = Exists(txtOp.Text)
            pnlValid.Visible = Not AlreadyExist
            btnNew.Focus()

            If AlreadyExist Then
                If Terminado = False Then
                    cntrlOutputData.Visible = True
                    cntrlOutputData.Operacion = txtOp.Text
                    ddlOut.DataBind()
                    ddlOut.Items.FindByText(txtOp.Text)
                    rblOp.SelectedValue = "OUT"
                ElseIf Status = 1 Then
                    cntrlCFDIData.Visible = True
                    cntrlCFDIData.Operacion = txtOp.Text
                    ddlCFDI.DataBind()
                    ddlCFDI.Items.FindByText(txtOp.Text)
                    rblOp.SelectedValue = "CFDI"
                ElseIf Status = 2 Then
                    cntrlAllData.Visible = True
                    cntrlAllData.Operacion = txtOp.Text
                    rblOp.SelectedValue = "IN"

                End If

            End If

        Else
            If Not txtOp.Text = "" Then
                pnlTryagain.Visible = True

            End If
            txtOp.Enabled = True
            txtOp.Focus()
            btnGo.Visible = True
        End If


    End Sub

    Private Function Exists(OperationNo As String) As Boolean
        Dim dt As DataTable = SQLDataTable("SELECT * FROM Inventario WHERE Operacion = '" & OperationNo & "'")
        If Not dt Is Nothing Then

            If dt.Rows.Count = 1 Then
                Terminado = dt.Rows(0)("Terminado")
                Status = isNull(dt.Rows(0)("Status"), 0)
                Return True
            End If
        End If

        Return False
    End Function

    Protected Sub btnNew_Click(sender As Object, e As EventArgs) Handles btnNew.Click
        cntrlInputData.Visible = True
        cntrlInputData.clearAll()
        cntrlInputData.Operacion = txtOp.Text.Trim
        pnlValid.Visible = False
    End Sub

    Public Sub Initialize()



        hflChanging.Value = False

        InitRbl()

        btnGo.Visible = True

        

            dvMsg.Visible = False
            txtOp.Text = ""
            txtOp.Focus()
   
 
    End Sub

    Protected Sub btnCancelNew_Click(sender As Object, e As EventArgs) Handles btnCancelNew.Click
        pnlValid.Visible = False

        Initialize()

    End Sub

    Protected Sub cntrlInputData_Aceptar() Handles cntrlInputData.Aceptar
        dvMsg.Visible = True
        cntrlInputData.clearAll()
        cntrlInputData.Visible = False
        Initialize()
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
        cntrlInputData.Visible = False
        cntrlOutputData.Visible = False
        cntrlCFDIData.Visible = False
        cntrlAllData.Visible = False
        cntrlAbandono.Visible = False

        Select Case rblOp.SelectedValue

            Case "IN"
                txtOp.Visible = True
                txtOp.Enabled = True
                lblOper.Visible = True
                ddlOut.Visible = False
                ddlCFDI.Visible = False
                btnGo.Visible = True

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

        End Select
    End Sub

    Protected Sub ddlOut_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlOut.SelectedIndexChanged
        cntrlOutputData.Operacion = ddlOut.SelectedValue
    End Sub

    Protected Sub btnGo_Click(sender As Object, e As EventArgs) Handles btnGo.Click
        Select Case rblOp.SelectedValue

            Case "IN"
                txtOp.Visible = True
                ddlOut.Visible = False
                ddlCFDI.Visible = False
            Case "OUT"
                txtOp.Visible = True
                txtOp.Text = ddlOut.SelectedValue.Trim
                ddlOut.Visible = False
                cntrlOutputData.Visible = True
                cntrlInputData.Visible = False
                cntrlCFDIData.Visible = False
                cntrlOutputData.Operacion = ddlOut.SelectedValue
            Case "CFDI"
                txtOp.Visible = True
                txtOp.Text = ddlCFDI.SelectedValue.Trim
                ddlCFDI.Visible = False
                cntrlOutputData.Visible = False
                cntrlInputData.Visible = False
                cntrlCFDIData.Visible = True
                cntrlCFDIData.Operacion = ddlCFDI.SelectedValue
        End Select

        If Not pnlTryagain.Visible Then
            btnGo.Visible = False
            txtOp.Enabled = False
        End If

    End Sub
    Protected Sub Modify() Handles cntrlOutputData.ModBtnClicked, cntrlCFDIData.ModBtnClicked
        cntrlOutputData.Visible = False
        cntrlInputData.Visible = False
        cntrlCFDIData.Visible = False

        cntrlAllData.Visible = True
        cntrlAllData.Operacion = txtOp.Text
        rblOp.SelectedValue = "IN"
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
End Class
