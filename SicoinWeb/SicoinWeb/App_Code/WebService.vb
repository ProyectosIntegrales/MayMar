Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Data.SqlClient
Imports System.Web.Script.Services
Imports System.Collections.Generic
Imports System.Data

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")>
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)>
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
<ScriptService()>
Public Class WebService
    Inherits System.Web.Services.WebService



    <WebMethod()>
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)>
    Public Function getImporters(ByVal prefix As String) As String()
        Dim conn As SqlConnection = New SqlConnection
        conn.ConnectionString = ConfigurationManager _
         .ConnectionStrings("MaymarCS").ConnectionString
        Dim cmd As SqlCommand = New SqlCommand
        cmd.CommandText = "select Nombre, Clave, Direccion from Importador where" &
        " Nombre like @SearchText + '%' order by Nombre"
        cmd.Parameters.AddWithValue("@SearchText", prefix.Trim)
        cmd.Connection = conn
        conn.Open()
        Dim Nombres As List(Of String) = New List(Of String)
        Dim sdr As SqlDataReader = cmd.ExecuteReader
        While sdr.Read
            Nombres.Add(String.Format("{0}-{1}-{2}", sdr("Nombre").trim, sdr("Clave").trim, sdr("Direccion").trim))
        End While
        conn.Close()
        Return Nombres.ToArray
    End Function

    <WebMethod()>
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)>
    Public Function getClientes(ByVal prefix As String) As String()
        Dim conn As SqlConnection = New SqlConnection
        conn.ConnectionString = ConfigurationManager _
         .ConnectionStrings("MaymarCS").ConnectionString
        Dim cmd As SqlCommand = New SqlCommand
        cmd.CommandText = "select Nombre, Clave, RSocial from Clientes where" &
        " Nombre like @SearchText + '%' order by Nombre"
        cmd.Parameters.AddWithValue("@SearchText", prefix.Trim)
        cmd.Connection = conn
        conn.Open()
        Dim Nombres As List(Of String) = New List(Of String)
        Dim sdr As SqlDataReader = cmd.ExecuteReader
        While sdr.Read
            Nombres.Add(String.Format("{0}-{1}-{2}", sdr("Nombre").trim, sdr("Clave").trim, sdr("RSocial").trim))
        End While
        conn.Close()
        Return Nombres.ToArray
    End Function

    <WebMethod()>
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)>
    Public Function getExporters(ByVal prefix As String) As String()
        Dim conn As SqlConnection = New SqlConnection
        conn.ConnectionString = ConfigurationManager _
         .ConnectionStrings("MaymarCS").ConnectionString
        Dim cmd As SqlCommand = New SqlCommand
        cmd.CommandText = "SELECT TOP (100) MIN(ID) AS ID, NombreExp, MAX(DISTINCT Direccion) AS Direccion,         MAX(DISTINCT Ciudad) AS Ciudad, MAX(DISTINCT RFC) AS RFC FROM dbo.tblExportadores                        GROUP BY NombreExp HAVING (UPPER(NombreExp) = NombreExp) AND (MIN(CASE WHEN NombreExp COLLATE Latin1_General_BIN LIKE @SearchText + '%' THEN 1 ELSE 0 END) = 1) ORDER BY ID"

        cmd.Parameters.AddWithValue("@SearchText", prefix.Trim.ToUpper())
        cmd.Connection = conn
        conn.Open()
        Dim Nombres As List(Of String) = New List(Of String)
        Dim sdr As SqlDataReader = cmd.ExecuteReader
        While sdr.Read
            Nombres.Add(String.Format("{0}-{1}-{2}-{3}-{4}", sdr("NombreExp").trim, sdr("Direccion").trim, sdr("Ciudad").trim, sdr("RFC").trim, sdr("ID")))
        End While
        conn.Close()
        Return Nombres.ToArray
    End Function

    <WebMethod()>
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)>
    Public Function getSalidas() As DataTable
        Using conn As New SqlConnection(ConfigurationManager.ConnectionStrings("MaymarCS").ConnectionString)
            Using cmd As New SqlCommand("select * from vSalidas")
                Dim ds As New DataSet()
                cmd.Connection = conn
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(ds, "Salidas")
                End Using
                Return ds.Tables(0)
            End Using
        End Using
    End Function
End Class