
Partial Class dataModel
    Inherits System.Web.UI.Page
    Dim db As New Database()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.Params("all_accounts") <> "" Then
            Dim aa = db.sqlQueryJson("select * from accounts where user_id=" & Session("userLogged"))
            Response.Write(aa)
        ElseIf Request.Params("ac-add") <> "" Then
            Dim ac_name = Request.Params("ac-name")
            Dim ac_type = Request.Params("ac-type")
            Dim ac_balance = Request.Params("ac-balance")
            Dim res = db.addAccount(ac_name, ac_type, ac_balance, Session("userLogged"))
            If res Then
                Response.Write("success")
            Else
                Response.Write("error")
            End If

        ElseIf Request.Params("ac-update") <> "" Then
            'Response.Write("updating")
            Dim ac_name = Request.Params("ac-name")
            Dim ac_type = Request.Params("ac-type")
            Dim ac_balance = Request.Params("ac-balance")
            Dim id = Request.Params("id")
            Dim res = db.updateAccount(ac_name, ac_type, ac_balance, id)
            If res Then
                Response.Write("success")
            Else
                Response.Write("error")
            End If
        ElseIf Request.Params("ac-delete") <> "" Then
            Dim id = Request.Params("id")
            Dim res = db.deleteAccount(id)
            If res Then
                Response.Write("success")
            Else
                Response.Write("error")
            End If
        ElseIf Request.Params("entryType") <> "" Then
            Dim entryType = Request.Params("entryType")
            Dim acDebit = Request.Params("acDebit")
            Dim acCredit = Request.Params("acCredit")
            Dim acDate = Request.Params("acDate")
            Dim acAmount = Request.Params("acAmount")
            Dim acInvoice = Request.Params("acInvoice")

            Dim res = db.journalEntry(acDebit, acCredit, acDate, acAmount, acInvoice)
            If res = 0 Then
                Response.Write("error")
            Else
                Response.Write("success")
            End If
        ElseIf Request.Params("acByName") <> "" Then
            Dim res = db.dbScalar("select id from accounts where ac_name='" & Request.Params("acByName") & "'")
            If res = 0 Then
                'Response.Write("notfound")
                Dim nid = db.nextId("accounts", "id")
                Dim res2 = db.dbNonQuery("insert into accounts (id,ac_name,ac_type,ac_balance,user_id) values (" & nid & ",'" & Request.Params("acByName") & "','" & Request.Params("acType") & "',0," & Session("userLogged") & ")")
                If res2 = 0 Then
                    Response.Write("cantcreate")
                Else
                    Response.Write(nid)
                End If
            Else
                Response.Write(res)
            End If
        ElseIf Request.Params("listTransaction") <> "" Then
            Dim id = Request.Params("listTransaction")
            Dim res = db.sqlQueryJson("select id,date,ac_debit,ac_credit,amount,invoice,(select ac_name from accounts where id=transactions.ac_debit) as name_debit,(select ac_name from accounts where id=transactions.ac_credit) as name_credit from transactions where ac_debit=" & id & " or ac_credit=" & id & " order by date desc")
            Response.Write(res)
        ElseIf Request.Params("listAllTransaction") <> "" Then
            Dim limit = Request.Params("listAllTransaction")

            Dim res = db.sqlQueryJson("select TOP " & limit & " id,date,ac_debit,ac_credit,amount,invoice,(select ac_name from accounts where id=transactions.ac_debit) as name_debit,(select ac_name from accounts where id=transactions.ac_credit) as name_credit from transactions order by date desc ")
            Response.Write(res)
        End If


    End Sub
End Class
