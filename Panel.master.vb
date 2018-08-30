Imports System.Data.SqlClient
Partial Class Panel
    Inherits System.Web.UI.MasterPage
    Dim db As New Database()
    Public userData As New Hashtable()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("userLogged") = "1"
        If (Session("userLogged") = "") Then
            Response.Redirect("Default.aspx")
            Return
        End If
        Dim res As SqlDataReader = db.dbReader("select company_name,username,email from users where id=" & Session("userLogged"))
        If res.HasRows Then
            res.Read()
            userData.Add("username", res.Item(1))
            userData.Add("company_name", res.Item(0))
            userData.Add("email", res.Item(2))
            res.Close()
        Else
            Response.Redirect("Default.aspx")
        End If

        Dim acs = db.sqlQueryJson("select * from accounts where user_id=" & Session("userLogged"))
        Response.Write("<script>window.accounts=JSON.parse('" & acs & "')</script>")

    End Sub
End Class

