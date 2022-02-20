Imports System.Data
Imports System.IO
Imports System

Public Module modCommon



    Public Function isNull(ByVal objToEvaluate As Object, ByVal returnValue As Object) As Object

        If objToEvaluate Is DBNull.Value Or objToEvaluate Is Nothing Then
            Return returnValue
        Else
            Return objToEvaluate
        End If

    End Function


    Public Function isNullOrBlank(ByVal objToEvaluate As Object, ByVal returnValue As Object) As Object

        If objToEvaluate Is DBNull.Value Or objToEvaluate Is Nothing Then
            Return returnValue
        ElseIf objToEvaluate <> "" Then
            Return objToEvaluate
        Else
            Return returnValue
        End If
    End Function
    Public Function doSQLProcedure(ByVal Procedure As String, ByVal commandType As CommandType, Optional connectionName As String = "MayMarCS",
                                   Optional ByVal ParmName1 As String = "", Optional ByVal ParmValue1 As Object = Nothing,
                                   Optional ByVal ParmName2 As String = "", Optional ByVal ParmValue2 As Object = Nothing,
                                   Optional ByVal ParmName3 As String = "", Optional ByVal ParmValue3 As Object = Nothing,
                                   Optional ByVal ParmName4 As String = "", Optional ByVal ParmValue4 As Object = Nothing,
                                   Optional ByVal ParmName5 As String = "", Optional ByVal ParmValue5 As Object = Nothing,
                                   Optional ByVal ParmName6 As String = "", Optional ByVal ParmValue6 As Object = Nothing,
                                   Optional ByVal ParmName7 As String = "", Optional ByVal ParmValue7 As Object = Nothing,
                                   Optional ByVal ParmName8 As String = "", Optional ByVal ParmValue8 As Object = Nothing,
                                Optional ByVal ParmName9 As String = "", Optional ByVal ParmValue9 As Object = Nothing,
                                Optional ParmName10 As String = "", Optional ParmValue10 As Object = Nothing,
                                Optional ParmName11 As String = "", Optional ParmValue11 As Object = Nothing,
                                Optional ParmName12 As String = "", Optional ParmValue12 As Object = Nothing,
                                Optional ParmName13 As String = "", Optional ParmValue13 As Object = Nothing,
                                Optional ParmName14 As String = "", Optional ParmValue14 As Object = Nothing,
                                Optional ParmName15 As String = "", Optional ParmValue15 As Object = Nothing,
                                Optional ParmName16 As String = "", Optional ParmValue16 As Object = Nothing,
                                Optional ParmName17 As String = "", Optional ParmValue17 As Object = Nothing,
                                Optional ParmName18 As String = "", Optional ParmValue18 As Object = Nothing,
                                Optional ParmName19 As String = "", Optional ParmValue19 As Object = Nothing,
                                Optional ParmName20 As String = "", Optional ParmValue20 As Object = Nothing,
                                Optional ParmName21 As String = "", Optional ParmValue21 As Object = Nothing,
                                Optional ParmName22 As String = "", Optional ParmValue22 As Object = Nothing,
                                Optional ParmName23 As String = "", Optional ParmValue23 As Object = Nothing,
                                Optional ParmName24 As String = "", Optional ParmValue24 As Object = Nothing,
                                Optional ParmName25 As String = "", Optional ParmValue25 As Object = Nothing,
                                Optional ParmName26 As String = "", Optional ParmValue26 As Object = Nothing,
                                Optional ParmName27 As String = "", Optional ParmValue27 As Object = Nothing,
                                Optional ParmName28 As String = "", Optional ParmValue28 As Object = Nothing) As Object

        Dim cm As New SqlClient.SqlCommand
        Dim cnUTC As New SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings(connectionName).ToString)
        Try

            With cm
                .CommandText = Procedure
                .CommandType = commandType
                .Connection = cnUTC
                .CommandTimeout = 5000

                If ParmName1 <> "" Then
                    .Parameters.AddWithValue(ParmName1, ParmValue1)
                End If
                If ParmName2 <> "" Then
                    .Parameters.AddWithValue(ParmName2, ParmValue2)
                End If
                If ParmName3 <> "" Then
                    .Parameters.AddWithValue(ParmName3, ParmValue3)
                End If
                If ParmName4 <> "" Then
                    .Parameters.AddWithValue(ParmName4, ParmValue4)
                End If
                If ParmName5 <> "" Then
                    .Parameters.AddWithValue(ParmName5, ParmValue5)
                End If
                If ParmName6 <> "" Then
                    .Parameters.AddWithValue(ParmName6, ParmValue6)
                End If
                If ParmName7 <> "" Then
                    .Parameters.AddWithValue(ParmName7, ParmValue7)
                End If
                If ParmName8 <> "" Then
                    .Parameters.AddWithValue(ParmName8, ParmValue8)
                End If
                If ParmName9 <> "" Then
                    .Parameters.AddWithValue(ParmName9, ParmValue9)
                End If
                If ParmName10 <> "" Then
                    .Parameters.AddWithValue(ParmName10, ParmValue10)
                End If
                If ParmName11 <> "" Then
                    .Parameters.AddWithValue(ParmName11, ParmValue11)
                End If
                If ParmName12 <> "" Then
                    .Parameters.AddWithValue(ParmName12, ParmValue12)
                End If
                If ParmName13 <> "" Then
                    .Parameters.AddWithValue(ParmName13, ParmValue13)
                End If
                If ParmName14 <> "" Then
                    .Parameters.AddWithValue(ParmName14, ParmValue14)
                End If
                If ParmName15 <> "" Then
                    .Parameters.AddWithValue(ParmName15, ParmValue15)
                End If
                If ParmName16 <> "" Then
                    .Parameters.AddWithValue(ParmName16, ParmValue16)
                End If
                If ParmName17 <> "" Then
                    .Parameters.AddWithValue(ParmName17, ParmValue17)
                End If
                If ParmName18 <> "" Then
                    .Parameters.AddWithValue(ParmName18, ParmValue18)
                End If
                If ParmName19 <> "" Then
                    .Parameters.AddWithValue(ParmName19, ParmValue19)
                End If
                If ParmName20 <> "" Then
                    .Parameters.AddWithValue(ParmName20, ParmValue20)
                End If
                If ParmName21 <> "" Then
                    .Parameters.AddWithValue(ParmName21, ParmValue21)
                End If
                If ParmName22 <> "" Then
                    .Parameters.AddWithValue(ParmName22, ParmValue22)
                End If
                If ParmName23 <> "" Then
                    .Parameters.AddWithValue(ParmName23, ParmValue23)
                End If
                If ParmName24 <> "" Then
                    .Parameters.AddWithValue(ParmName24, ParmValue24)
                End If
                If ParmName25 <> "" Then
                    .Parameters.AddWithValue(ParmName25, ParmValue25)
                End If
                If ParmName26 <> "" Then
                    .Parameters.AddWithValue(ParmName26, ParmValue26)
                End If
                If ParmName27 <> "" Then
                    .Parameters.AddWithValue(ParmName27, ParmValue27)
                End If
                If ParmName28 <> "" Then
                    .Parameters.AddWithValue(ParmName28, ParmValue28)
                End If
                .Connection.Open()
                Dim result As Object = .ExecuteScalar
                Return result

            End With

        Catch ex As Exception
            Return "error: " & ex.Message
            doSQLProcedure("spErrorLog", CommandType.StoredProcedure, , "@logText", ex.ToString, "@logUsername", System.Environment.UserName, "@logMachineId", System.Environment.MachineName)
        Finally
            cm.Connection.Close()
        End Try

    End Function

    Public Function SQLDataTable(ByVal selectCommand As String, Optional Connection As String = "MayMarCS") As DataTable

        Try
            Dim dt As New DataTable
            Dim cn As SqlClient.SqlConnection = New SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings(Connection).ToString)

            Dim da As New SqlClient.SqlDataAdapter(selectCommand, cn)
            da.SelectCommand.CommandTimeout = 1000
            Dim ds As New DataSet
            da.Fill(ds)
            Return ds.Tables(0)
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    Public Function Mes(ByVal month As Integer) As String
        Dim meses() As String = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"}
        Return meses(month)
    End Function

    Public Function getSectionTitle(menuID As Integer) As String

        Try
            Dim dt As New Data.DataTable
            dt = SQLDataTable("SELECT dbo.tblSections.sectionTitle AS sectionTitle FROM dbo.tblMenuItems INNER JOIN dbo.tblSections ON dbo.tblMenuItems.menuSection = dbo.tblSections.sectionID WHERE (dbo.tblMenuItems.menuID = " & menuID & ")")

            If dt.Rows.Count > 0 Then
                Return isNull(dt.Rows(0).Item(0), "")
            Else
                dt = SQLDataTable("SELECT menuText FROM dbo.tblMenuItems WHERE menuID = " & menuID)
                Return isNull(dt.Rows(0).Item(0), "")
            End If
        Catch ex As Exception
            Return "[Error al obtener el título de la página]"
        End Try
    End Function

    Public Function toBoolean(value As Object) As Boolean
        Try
            Select Case value
                Case "True"
                    Return True
                Case 1
                    Return True
                Case 0
                    Return False
                Case "False"
                    Return False
                Case -1
                    Return True
                Case Else
                    Return False
            End Select

        Catch ex As Exception
            Return False
        End Try

    End Function

    Public Function getSectionID(menuID As Integer) As String

        Dim dt As New Data.DataTable
        dt = SQLDataTable("SELECT menuSection FROM dbo.tblMenuItems WHERE (dbo.tblMenuItems.menuID = " & menuID & ")")

        If Not dt Is Nothing Then
            If dt.Rows.Count > 0 Then
                Return isNull(dt.Rows(0).Item(0), 0)
            End If

        End If

        Return 0

    End Function

    Public Function getParentID(menuID As Integer) As String

        Dim dt As New Data.DataTable
        dt = SQLDataTable("SELECT menuParent FROM dbo.tblMenuItems WHERE (dbo.tblMenuItems.menuID = " & menuID & ")")

        If dt.Rows.Count > 0 Then
            Return isNull(dt.Rows(0).Item(0), 0)
        Else
            Return 0
        End If

    End Function

    Public Function canEdit(UserName As String, SectionID As Integer) As Boolean
        Dim dt As New Data.DataTable
        dt = SQLDataTable("SELECT dbo.tblPrivs.sectionID, dbo.tblUsers.userName FROM dbo.tblUsers INNER JOIN dbo.tblPrivs ON dbo.tblUsers.userId = dbo.tblPrivs.userID WHERE (dbo.tblPrivs.sectionID = " & SectionID & ") AND (dbo.tblUsers.userName = '" & UserName & "')")
        If Not dt Is Nothing Then
            Return dt.Rows.Count > 0
        Else
            Return 0
        End If

    End Function

    Public Function helpFile(SectionID As Integer) As String
        Dim dt As New Data.DataTable
        dt = SQLDataTable("SELECT sectionHelpFile from tblSections where sectionID = " & SectionID)
        If dt.Rows.Count = 1 Then
            Return isNull(dt.Rows(0).Item(0), "")
        Else
            Return False
        End If
    End Function

    Public Function menuVisible(SectionID As Integer) As Boolean
        Dim dt As New Data.DataTable
        dt = SQLDataTable("SELECT sectionLeftMenu from tblSections where sectionID = " & SectionID)
        If Not dt Is Nothing Then
            If dt.Rows.Count = 1 Then
                Return dt.Rows(0).Item(0)
            End If
        End If
        Return False

    End Function

    Public Function ReadText(ByVal TextFilePath As String) As String

        Dim sr As StreamReader
        sr = File.OpenText(TextFilePath)
        Dim contents As String = sr.ReadToEnd()
        sr.Close()
        Return contents

    End Function

    Public Function getFiscalWeek(ByVal dateD As DateTime) As Integer

        Dim dt As New Data.DataTable
        dt = SQLDataTable("select top 1 FiscalWeek from tblFiscalDates where InitialDate <= '" & dateD & "' and fiscalYear = " & Year(dateD) & " order by fiscalWeek Desc")

        Return dt.Rows(0).Item(0)

    End Function


    Public Function getUserID(Username As String) As Integer
        Try
            Dim dt As New Data.DataTable
            dt = SQLDataTable("select userID from tblUsers where username = '" & Username & "'")

            Return dt.Rows(0).Item(0)

        Catch ex As Exception
            Return 0
        End Try
    End Function

    Public Function GenerateSelectCommand(tableName As String, ConnectionString As String, Optional search As String = "", Optional schema As String = "dbo") As String

        Dim SelectCommand As String = "SELECT * FROM " & schema & "." & tableName & "    "
        If search.Trim <> "" Then
            Dim dtc As DataTable = SQLDataTable("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '" & tableName & "' AND TABLE_SCHEMA='" & schema & "'", ConnectionString)

            If dtc.Rows.Count > 0 Then
                SelectCommand &= " WHERE "
                For Each r As DataRow In dtc.Rows
                    SelectCommand &= "CHARINDEX('" & search & "', CONVERT(varchar, [" & r.Item(0) & "] ,101)) > 0 OR "
                Next
            End If
        End If
        Return Left(SelectCommand, SelectCommand.Length - 4)
    End Function

    Public Function getConfigValue(configName As String, Optional Connection As String = "MayMarCS") As String
        Dim dt As DataTable = SQLDataTable("SELECT configValue FROM tblConfigs WHERE configName = '" & configName & "'", Connection)
        If Not dt Is Nothing Then
            If dt.Rows.Count = 1 Then
                Return isNull(dt.Rows(0).Item(0), "")
            Else
                Return ""
            End If
        Else
            Return ""
        End If
    End Function
End Module


