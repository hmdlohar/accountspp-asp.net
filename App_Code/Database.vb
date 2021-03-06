﻿Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class Database
    Dim con As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename='|DataDirectory|\Database.mdf';Integrated Security=True;User Instance=True")
    
    Function dbNonQuery(ByVal query As String) As Integer
        Dim cmd As New SqlCommand(query, con)

        Dim res = -1
        Try
            con.Open()
            res = cmd.ExecuteNonQuery()
            con.Close()
            Return res
        Catch ex As Exception

            MsgBox(ex.Message)
            Return 0
        Finally
            con.Close()
        End Try
        Return res
    End Function
    Function dbScalar(ByVal query As String) As String
        Dim cmd As New SqlCommand(query, con)
        Dim res = -1
        Try
            con.Open()
            res = cmd.ExecuteScalar()
            con.Close()
            Return res
        Catch ex As Exception
            MsgBox(ex.Message)
            Return 0
        Finally
            con.Close()
        End Try
        Return res
    End Function
    Sub FillDs(ByVal query As String, ByVal tbl As String, ByRef ds As Data.DataSet)
        Dim cmd As New SqlCommand(query, con)
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(ds, tbl)
    End Sub
    Function sqlQueryJson(ByVal query As String) As String
        Dim ds As New Data.DataSet
        Dim cmd As New SqlCommand(query, con)
        Dim da As New SqlDataAdapter(cmd)
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
    Function dbReader(ByVal query As String) As SqlDataReader
        Dim cmd As New SqlCommand(query, con)
        Dim res As SqlDataReader
        Try
            con.Open()
            res = cmd.ExecuteReader()
            Return res
        Catch ex As Exception
            MsgBox(ex.Message)
            Return res
        Finally
            'con.Close()
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
        Dim res As SqlDataReader = dbReader("select password from users where username='" & username & "'")
        If Not (res.HasRows) Then
            Return False
        End If
        Return True
    End Function

    Function addAccount(ByVal ac_name As String, ByVal ac_type As String, ByVal ac_balance As String, ByVal user_id As String) As Boolean
        Dim nid = nextId("accounts", "id")
        Return dbNonQuery("insert into accounts (id,ac_name,ac_type,ac_balance,user_id) values (" & nid & ",'" & ac_name & "','" & ac_type & "','" & ac_balance & "','" & user_id & "')")
    End Function
    Function updateAccount(ByVal ac_name As String, ByVal ac_type As String, ByVal ac_balance As String, ByVal id As String) As Boolean
        Return dbNonQuery("update accounts set ac_name='" & ac_name & "',ac_type='" & ac_type & "',ac_balance='" & ac_balance & "' where ID=" & id)
    End Function
    Function deleteAccount(ByVal id As String) As Boolean
        Return dbNonQuery("delete from accounts where ID=" & id)
    End Function

    Function addTransaction(ByVal ac_debit As String, ByVal ac_credit As String, ByVal amount As String) As Boolean
        'Return dbNonQuery("insert into transactions (ac_debit,ac_credit,amount) values ()")
        Return False
    End Function
    Function journalEntry(ByVal ac_debit As String, ByVal ac_credit As String, ByVal ac_date As String, ByVal amount As String, ByVal invoice As String) As Integer
        'MsgBox("insert into transactions (ac_debit,ac_credit,amount,date) values (" & ac_debit & "," & ac_credit & ",'" & ac_date & "'," & amount & ")")
        dbNonQuery("update accounts set ac_balance = ac_balance - " & amount & " where id=" & ac_credit)
        dbNonQuery("update accounts set ac_balance = ac_balance + " & amount & " where id=" & ac_debit)
        Return dbNonQuery("insert into transactions (ac_debit,ac_credit,date,amount,invoice) values (" & ac_debit & "," & ac_credit & ",'" & ac_date & "'," & amount & ",'" & invoice & "')")
    End Function
    Function nextId(ByVal table As String, ByVal col As String) As Integer
        Dim rs = dbScalar("select max(" & col & ") from " & table)
        If Not IsDBNull(rs) Then
            Return Val(rs) + 1
        End If
        Return 0
    End Function

End Class
