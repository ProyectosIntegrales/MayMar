Imports Microsoft.VisualBasic
Imports System.Data
Imports System


Public Class UserIntranet

    Public Property Username As String
        Get
            Return _username
        End Get
        Set(value As String)
            _username = value
        End Set
    End Property

    Public Property FirstName As String
        Get
            Return _firstname
        End Get
        Set(value As String)
            _firstname = value
        End Set
    End Property

    Public Property LastName As String
        Get
            Return _lastname
        End Get
        Set(value As String)
            _lastname = value
        End Set
    End Property

    Public Property Language As String
        Get
            Return _language
        End Get
        Set(value As String)
            _language = value
        End Set
    End Property

    Public Property EmployeeNo As Integer
        Get
            Return _employeeno
        End Get
        Set(value As Integer)
            _employeeno = value
        End Set
    End Property

    Public Property Department As Integer
        Get
            Return _dept
        End Get
        Set(value As Integer)
            _dept = value
        End Set
    End Property

    Public Property Area As Integer
        Get
            Return _area
        End Get
        Set(value As Integer)
            _area = value
        End Set
    End Property

    Public Property BirthDate As Date
        Get
            Return _birthdate
        End Get
        Set(value As Date)
            _birthdate = value
        End Set
    End Property

    Public Property Gender As String
        Get
            Return _gender
        End Get
        Set(value As String)
            _gender = value
        End Set
    End Property

    Public Property Admin As Boolean
        Get
            Return _admin
        End Get
        Set(value As Boolean)
            _admin = value
        End Set
    End Property

    Public Property EMailAddress As String
        Get
            Return _email
        End Get
        Set(value As String)
            _email = value
        End Set
    End Property

    Public ReadOnly Property ManagerName As String
        Get
            Return _managerName
        End Get
    End Property

    Public ReadOnly Property ManagerEmailAddress As String
        Get
            Return _managerEmailAddress
        End Get
    End Property

    Public ReadOnly Property GenericUser As Boolean
        Get
            Return _generic
        End Get
    End Property

    Public ReadOnly Property Exists As Boolean
        Get
            Return _exists
        End Get
    End Property

    Dim _username, _firstname, _lastname, _language, _gender, _email, _managerName, _managerEmailAddress As String
    Dim _dept, _area, _employeeno As Integer
    Dim _birthdate As Date
    Dim _admin, _generic, _exists As Boolean

    Public Sub New(Username As String)
        getUserInfo(Username)
    End Sub

    Private Sub getUserInfo(User_name As String)


        Dim dtUser As New DataTable
        dtUser = SQLDataTable("Select * from vUsers where Username = '" & User_name & "'")
        If Not dtUser Is Nothing Then
            If dtUser.Rows.Count > 0 Then
                Dim dr As DataRow = dtUser.Rows(0)
                _username = dr.Item("userName").ToString.Trim.ToLower
                _firstname = isNull(dr.Item("userFirstName"), "[No Name]").ToString.Trim
                _lastname = isNull(dr.Item("userLastName"), "[No Lastname]").ToString.Trim
                _language = dr.Item("userLang").ToString.Trim
                _employeeno = isNull(dr.Item("userEmployeeNo"), 0)
                _dept = isNull(dr.Item("userDept"), 0)
                _area = isNull(dr.Item("userArea"), 0)
                _birthdate = isNull(dr.Item("userBirthDate"), "1/1/1900")
                _gender = dr.Item("userGender").ToString.Trim
                _admin = isNull(dr.Item("userisAdmin"), False)
                _email = isNull(dr.Item("userEmailAddress"), "")
                _managerName = isNull(dr.Item("managerFullName"), "")
                _managerEmailAddress = isNull(dr.Item("managerEmailAddress"), "")
                _generic = isNull(dr.Item("userGeneric"), False)
                _exists = True
                Exit Sub
            End If
        End If
        _username = Nothing
        _firstname = ""
        _lastname = ""
        _language = ""
        _employeeno = 0
        _dept = 0
        _area = 0
        _birthdate = Today
        _gender = ""
        _admin = False
        _generic = False
        _exists = False

    End Sub

End Class

Public Class Employee

    'Public Property Username As String
    '    Get
    '        Return _username
    '    End Get
    '    Set(value As String)
    '        _username = value
    '    End Set
    'End Property

    'Public Property FirstName As String
    '    Get
    '        Return _firstname
    '    End Get
    '    Set(value As String)
    '        _firstname = value
    '    End Set
    'End Property

    'Public Property LastName As String
    '    Get
    '        Return _lastname
    '    End Get
    '    Set(value As String)
    '        _lastname = value
    '    End Set
    'End Property

    'Public Property Language As String
    '    Get
    '        Return _language
    '    End Get
    '    Set(value As String)
    '        _language = value
    '    End Set
    'End Property

    Public Property EmployeeNo As Integer
        Get
            Return _employeeno
        End Get
        Set(value As Integer)
            _employeeno = value
        End Set
    End Property

    Public Property Department As Integer
        Get
            Return _dept
        End Get
        Set(value As Integer)
            _dept = value
        End Set
    End Property

    Public Property Area As Integer
        Get
            Return _area
        End Get
        Set(value As Integer)
            _area = value
        End Set
    End Property

    'Public Property BirthDate As Date
    '    Get
    '        Return _birthdate
    '    End Get
    '    Set(value As Date)
    '        _birthdate = value
    '    End Set
    'End Property

    Public Property Gender As String
        Get
            Return _gender
        End Get
        Set(value As String)
            _gender = value
        End Set
    End Property

    'Public Property Admin As Boolean
    '    Get
    '        Return _admin
    '    End Get
    '    Set(value As Boolean)
    '        _admin = value
    '    End Set
    'End Property

    'Public Property EMailAddress As String
    '    Get
    '        Return _email
    '    End Get
    '    Set(value As String)
    '        _email = value
    '    End Set
    'End Property

    'Public ReadOnly Property ManagerName As String
    '    Get
    '        Return _managerName
    '    End Get
    'End Property

    'Public ReadOnly Property ManagerEmailAddress As String
    '    Get
    '        Return _managerEmailAddress
    '    End Get
    'End Property

    'Public ReadOnly Property AbreviatedName As String
    '    Get
    '        Return _abre
    '    End Get
    'End Property

    Public ReadOnly Property FullName As String
        Get
            Return _full
        End Get
    End Property

    Public ReadOnly Property Exists As Boolean
        Get
            Return _exists
        End Get
    End Property

    Dim _username, _firstname, _lastname, _language, _gender, _email, _managerName, _managerEmailAddress, _abre, _full As String
    Dim _dept, _area, _employeeno As Integer
    Dim _birthdate As Date
    Dim _admin, _exists As Boolean

    Public Sub New(EmployeeNo As Object)
        getUserInfo(EmployeeNo)
    End Sub

    Private Sub getUserInfo(EmployeeNo As Object)

        Try
            Dim empNo As Integer = CInt(EmployeeNo)

            Dim dtUser As New DataTable
            dtUser = SQLDataTable("Select * from vUsers where userEmployeeNo = " & empNo)
            If dtUser.Rows.Count > 0 Then
                Dim dr As DataRow = dtUser.Rows(0)
                _username = dr.Item("userName").ToString.Trim.ToLower
                _firstname = isNull(dr.Item("userFirstName"), "[No Name]").ToString.Trim
                _lastname = isNull(dr.Item("userLastName"), "[No Lastname]").ToString.Trim
                _language = dr.Item("userLang").ToString.Trim
                _employeeno = isNull(dr.Item("userEmployeeNo"), 0)
                _dept = isNull(dr.Item("userDept"), 0)
                _area = isNull(dr.Item("userArea"), 0)
                _birthdate = isNull(dr.Item("userBirthDate"), "1/1/1900")
                _gender = dr.Item("userGender").ToString.Trim
                _admin = isNull(dr.Item("userisAdmin"), False)
                _email = isNull(dr.Item("userEmailAddress"), "")
                _managerName = isNull(dr.Item("managerFullName"), "")
                _managerEmailAddress = isNull(dr.Item("managerEmailAddress"), "")
                _abre = Mid(isNull(dr.Item("userFirstName"), "[No Name]").ToString.Trim, 1, 1) & ". " & isNull(dr.Item("userLastName"), "[No Lastname]").ToString.Trim
                _full = isNull(dr.Item("userFirstName"), "[No Name]").ToString.Trim & " " & isNull(dr.Item("userLastName"), "[No Lastname]").ToString.Trim
                _exists = True

            Else
                Dim dtEmpleados As New DataTable
                dtEmpleados = SQLDataTable("Select * from vempleados where empNumber = " & empNo)

                If dtEmpleados.Rows.Count > 0 Then

                    Dim dr As DataRow = dtEmpleados.Rows(0)
                    _full = dr.Item("empName")
                    _dept = dr.Item("empDept")
                    _area = dr.Item("empArea")
                    _employeeno = empNo
                    _gender = dr.Item("empGender").trim
                    _exists = True

                Else
                    _exists = False
                    _username = Nothing
                    _firstname = "No"
                    _lastname = "Existe"
                    _language = ""
                    _employeeno = 0
                    _dept = 0
                    _area = 0
                    _birthdate = Today
                    _gender = ""
                    _admin = False
                    _abre = "<span class='blink'>No Existe</span>"
                    _full = "<span class='blink'>No. de empleado inválido.</span>"
                End If
            End If

        Catch ex As Exception
            _exists = False
            _abre = "<span class='blink'>No Existe</span>"
            _full = "<span class='blink'>No. de empleado inválido.</span>"
            _firstname = "No"
            _lastname = "Existe"
        End Try

    End Sub


End Class

Public Class MailServer

    Public ReadOnly Property SMPTAddress As String
        Get
            Return _address
        End Get
    End Property

    Public ReadOnly Property SMTPPort As Integer
        Get
            Return _port
        End Get
    End Property

    Public ReadOnly Property SMTPSSL As Boolean
        Get
            Return _ssl
        End Get
    End Property

    Public ReadOnly Property SMTPAuthentication As Boolean
        Get
            Return _auth
        End Get
    End Property

    Public ReadOnly Property EmailAddress As String
        Get
            Return _email
        End Get
    End Property

    Public ReadOnly Property Password As String
        Get
            Return _pwd
        End Get
    End Property

    Dim _address, _email, _pwd As String
    Dim _port As Integer
    Dim _ssl, _auth As Boolean

    Public Sub New()
        _address = SQLDataTable("Select ItemValue from tblConfig where ItemName = 'SMTPServer'").Rows(0).Item(0)
        _port = SQLDataTable("Select ItemValue from tblConfig where ItemName = 'SMTPPort'").Rows(0).Item(0)
        _ssl = SQLDataTable("Select ItemValue from tblConfig where ItemName = 'SMTPSSL'").Rows(0).Item(0)
        _auth = SQLDataTable("Select ItemValue from tblConfig where ItemName = 'SMTPAuthentication'").Rows(0).Item(0)
        _email = "piratazz@gmail.com"
        _pwd = "axiant:01"
    End Sub
End Class

Public Class Depto
    Public Property DeptoID As Integer
        Get
            Return _deptoId
        End Get
        Set(value As Integer)
            _deptoId = value
        End Set
    End Property

    Public ReadOnly Property Name As String
        Get
            Return _name
        End Get
    End Property

    Public ReadOnly Property Code As String
        Get
            Return _code
        End Get
    End Property

    Public ReadOnly Property Manager As Integer
        Get
            Return _manager
        End Get
    End Property

    Public ReadOnly Property ManagerName As String
        Get
            Return _managerName
        End Get
    End Property

    Public ReadOnly Property ManagerEmailAddress As String
        Get
            Return _managerEmail
        End Get
    End Property

    Dim _deptoId, _manager As Integer
    Dim _name, _code, _managerName, _managerEmail As String

    Public Sub New(DeptoId As Integer)
        getDeptInfo(DeptoId)
    End Sub

    Protected Sub getDeptInfo(dId As Integer)
        Dim dt As New DataTable
        dt = SQLDataTable("select * from vDeptos where deptoId = " & dId)

        If dt.Rows.Count > 0 Then
            Dim dr As DataRow = dt.Rows(0)
            _deptoId = dId
            _manager = isNull(dr.Item("deptoManagerNo"), 0)
            _managerName = isNull(dr.Item("ManagerName"), "")
            _code = isNull(dr.Item("deptoMnemonic"), "").trim
            _managerEmail = isNull(dr.Item("userEmailAddress"), "").trim
        Else
            _deptoId = 0
            _manager = 0
            _managerEmail = ""
            _managerName = ""
            _code = ""
            _name = ""
        End If
    End Sub
End Class

