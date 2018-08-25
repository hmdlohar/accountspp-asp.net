
Partial Class dataModel
    Inherits System.Web.UI.Page
    Dim db As New Database()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.Params("all_accounts") <> "" Then
            Dim aa = db.sqlQueryJson("select * from accounts")
            Response.Write(aa)
        ElseIf Request.Params("ac-add") <> "" Then
            Dim ac_name = Request.Params("ac-name")
            Dim ac_type = Request.Params("ac-type")
            Dim ac_balance = Request.Params("ac-balance")
            Dim res = db.addAccount(ac_name, ac_type, ac_balance)
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
        End If
    End Sub
End Class
