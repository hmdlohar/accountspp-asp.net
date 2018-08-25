Imports Microsoft.VisualBasic
Imports System.Data.OleDb
Imports System.Data

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
            MsgBox(ex.Message)
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
    Sub FillDs(ByVal query As String, ByVal tbl As String, ByRef ds As Data.DataSet)
        Dim cmd As New OleDbCommand(query, con)
        Dim da As New OleDbDataAdapter(cmd)
        da.Fill(ds, tbl)
    End Sub
    Function sqlQueryJson(ByVal query As String) As String
        Dim ds As New Data.DataSet
        Dim cmd As New OleDbCommand(query, con)
        Dim da As New OleDbDataAdapter(cmd)
        da.Fill(ds)
        Return GetJson(ds.Tables(0))
    End Function
    Private Function GetJson(ByVal dt As DataTable) As String
        Dim Jserializer As New System.Web.Script.Serialization.JavaScriptSerializer()
        Dim rowsList As New List(Of Dictionary(Of String, Object))()
        Dim row As Dictionary(Of String, Object)
        For Each dr As DataRow In dt.Rows
            row = New Dictionary(Of String, Object)()
            For Each col As DataColumn In dt.Columns
                row.Add(col.ColumnName, dr(col))
            Next
            rowsList.Add(row)
        Next
        Return Jserializer.Serialize(rowsList)
    End Function
    Function dbReader(ByVal query As String) As Object
        Dim cmd As New OleDbCommand(query, con)
        Dim res = ""
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

    Function addAccount(ByVal ac_name As String, ByVal ac_type As String, ByVal ac_balance As String) As Boolean
        Return dbNonQuery("insert into accounts (ac_name,ac_type,ac_balance) values ('" & ac_name & "','" & ac_type & "','" & ac_balance & "')")
    End Function
    Function updateAccount(ByVal ac_name As String, ByVal ac_type As String, ByVal ac_balance As String, ByVal id As String) As Boolean
        Return dbNonQuery("update accounts set ac_name='" & ac_name & "',ac_type='" & ac_type & "',ac_balance='" & ac_balance & "' where ID=" & id)
    End Function
    Function deleteAccount(ByVal id As String) As Boolean
        Return dbNonQuery("delete from accounts where ID=" & id)
        
    End Function
End Class
