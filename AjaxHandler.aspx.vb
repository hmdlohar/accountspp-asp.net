
Partial Class AjaxHandler
    Inherits System.Web.UI.Page
    Dim db As New Database()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim a = Request.Params("signup")
        If Request.Params("signup") <> "" Then
            Dim username = Request.Params("username")
            Dim email = Request.Params("email")
            Dim company_name = Request.Params("company_name")
            Dim phone_no = Request.Params("phone_no")
            Dim password = Request.Params("password")

            Dim userExist = db.isUserExist(username, email)
            If userExist Then
                Response.Write("userexist")
            Else
                'Response.Write("insert into users (company_name,username,email,phone_no,password) values ('" & company_name & "','" & username & "','" & email & "','" & phone_no & "','" & password & "')")
                Dim res = db.registerUser(company_name, username, password, email, phone_no)
                If (res = 1) Then
                    Response.Write("success")
                Else
                    Response.Write(res)
                End If
            End If
        ElseIf Request.Params("login") <> "" Then
            Dim username = Request.Params("username")
            Dim password = Request.Params("password")
            Dim userExist = db.isUserExist(username, "")
            If userExist <> 1 Then
                Response.Write("usernotfound")
            Else
                Dim passwd = db.dbScalar("select password from users where username='" & username & "'")
                If passwd = password Then
                    Session("userLogged") = db.dbScalar("select id from users where username='" & username & "'")
                    Response.Write("success")

                Else
                    Response.Write("wrongpassword")
                End If
            End If
        End If
    End Sub
End Class
