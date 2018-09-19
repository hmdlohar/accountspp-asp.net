
Partial Class Admin_Logout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session.Clear()
        Response.Redirect("Default.aspx")
    End Sub
End Class
