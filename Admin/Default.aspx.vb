
Partial Class Admin_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("adminLogged") = "") Then
            Response.Redirect("AdminLogin.aspx")
        End If
    End Sub
End Class
