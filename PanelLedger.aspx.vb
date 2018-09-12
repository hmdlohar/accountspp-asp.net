
Partial Class Default2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.Params("id") <> "" Then
            Page.Title = Request.Params("name")
            Response.Write("<script>window.acid='" & Request.Params("id") & "';window.acname='" & Request.Params("name") & "';</script>")
        Else
            Response.Redirect("Accounts.aspx")
        End If


    End Sub
End Class
