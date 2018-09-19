
Partial Class Admin_AdminLogin
    Inherits System.Web.UI.Page

    Protected Sub btnAdminLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdminLogin.Click
        If (txtUsername.Text = "admin" And txtPassword.Text = "admin") Then
            Session("adminLogged") = "true"
            Response.Redirect("Default.aspx")
        End If
    End Sub
End Class
