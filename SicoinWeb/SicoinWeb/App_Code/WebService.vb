Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Data.SqlClient
Imports System.Web.Script.Services
Imports System.Collections.Generic

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
<ScriptService()> _
Public Class WebService
    Inherits System.Web.Services.WebService



    <WebMethod()> _
   <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Function getImporters(ByVal prefix As String) As String()
        Dim conn As SqlConnection = New SqlConnection
        conn.ConnectionString = ConfigurationManager _
         .ConnectionStrings("MaymarCS").ConnectionString
        Dim cmd As SqlCommand = New SqlCommand
        cmd.CommandText = "select Nombre, Clave, Direccion from Importador where" & _
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

    <WebMethod()> _
 <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Function getClientes(ByVal prefix As String) As String()
        Dim conn As SqlConnection = New SqlConnection
        conn.ConnectionString = ConfigurationManager _
         .ConnectionStrings("MaymarCS").ConnectionString
        Dim cmd As SqlCommand = New SqlCommand
        cmd.CommandText = "select Nombre, Clave, RSocial from Clientes where" & _
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

    <WebMethod()> _
<ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Function getExporters(ByVal prefix As String) As String()
        Dim conn As SqlConnection = New SqlConnection
        conn.ConnectionString = ConfigurationManager _
         .ConnectionStrings("MaymarCS").ConnectionString
        Dim cmd As SqlCommand = New SqlCommand
        cmd.CommandText = "select ID, NombreExp, Direccion, Ciudad, RFC from tblExportadores where" & _
        " NombreExp like @SearchText + '%' order by NombreExp"
        cmd.Parameters.AddWithValue("@SearchText", prefix.Trim)
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

End Class