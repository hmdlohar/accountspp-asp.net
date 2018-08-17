Imports Microsoft.VisualBasic
Imports System.Data.OleDb

Public Class Database
    Dim con As New OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\hmdvb\Documents\acpp.accdb")

    Function dbNonQuery(ByVal query As String) As Integer
        Dim cmd As New OleDbCommand(query, con)
        Dim res = -1
        Try
            con.Open()
            res = cmd.ExecuteNonQuery()
            con.Close()
            Return res
        Catch ex As Exception
            MsgBox(query)
            Return -2
        Finally
            con.Close()
        End Try
        Return res
    End Function
    Function dbScalar(ByVal query As String) As String
        Dim cmd As New OleDbCommand(query, con)
        Dim res = -1
        Try
            con.Open()
            res = cmd.ExecuteScalar()
            con.Close()
            Return res
        Catch ex As Exception
            Return ex.Message
        Finally
            con.Close()
        End Try
        Return res
    End Function
    Function dbReader(ByVal query As String) As Object
        Dim cmd As New OleDbCommand(query, con)
        Dim res
        Try
            con.Open()
            res = cmd.ExecuteScalar()
            con.Close()
            Return res
        Catch ex As Exception
            Return res
        Finally
            con.Close()
        End Try
        Return res
    End Function

    Function registerUser(ByVal company_name As String, ByVal username As String, ByVal password As String, ByVal email As String, ByVal phone_no As String) As Integer

        Return dbNonQuery("insert into users (company_name, username, email, phone_no, [password]) values ('" & company_name & "','" & username & "','" & email & "','" & phone_no & "','" & password & "')")
    End Function


    Function isUserExist(ByVal username As String, ByVal email As String) As Integer
        Return dbScalar("select count(id) from users where email='" & email & "' or username='" & username & "'")
    End Function

    Function checkLoginData(ByVal username As String, ByVal password As String) As Boolean
        Dim res As OleDbDataReader = dbReader("select password from users where username='" & username & "'")
        If Not (res.HasRows) Then
            Return False
        End If
        Return True
    End Function
End Class
