


/* equlizer codes */



function showPopup(id,per=30){
    $("#"+id).animate({top:per+"%"})
}
function hidePopup(id){
    $("#"+id).animate({top:"-200%"})
}

function validateSignup(frm){

   
    
    window.frm=frm;
    if(frm.name.value == ""){
        notie.error("Please Enter Full Name");
        return false;
    }
    else if(frm.username.value == ""){
        notie.error("Please Enter username");
        return false;
    }
    else if(frm.username.value.length < 8){
        notie.error("Username should not be less then 8 characters");
        return false;
    }
    else if(frm.email.value.indexOf("@")== -1 || frm.email.value.indexOf(".",frm.email.value.indexOf("@"))==-1||frm.email.value.indexOf("@") > frm.email.value.indexOf(".",frm.email.value.indexOf("@"))){
      notie.error("Enter valid email");
        return false;  
    }
    else if(frm.password.value == "" || frm.password.value.length < 8){
        notie.error("Password Must be atleast 8 characters long");
        return false;
    }
    else if(frm.password.value != frm.repassword.value){
        notie.error("Retype Password Do not match");
        return false;
    }
    else if(frm.phone_no.value == ""){
        notie.error("phone no");
        return false;
    }
     $.ajax({
        url: "AjaxHandler.aspx",
        type: "POST",
        data:{
            signup: "true",
            company_name: frm.name.value,
            username: frm.username.value,
            email: frm.email.value,
            password: frm.password.value,
            phone_no: frm.phone_no.value
        },
        success:function(data){
            console.log(data);
            if(data=="success"){
                notie.success("Registeration Successful");
                hidePopup("signupPopup");
                $("#loginArea").hide();
            }
            else if(data=="userexist"){
                notie.success("Account with same Username or Email already Exist");
            }
            else if(data=="a"){
                notie.success("Account with same Username or Email already Exist");
            }
            else {
                notie.success("Internal Server Error");
            }
            
        },
        error:function(er){
            console.log(er);
            notie.success("Error submitting form");
        }
    });
    
    
    return false;
}
function validateLogin(frm){
    if(frm.username.value == ""){
        notie.error("Please Enter username");
        return false;
    }
    else if(frm.password.value == ""){
        notie.error("Please Enter password");
        return false;
    }
    notie.success("Login Successful");
    hidePopup("loginPopup");
    $("#loginArea").hide();
    return false;
}


function submitSignup(){
    
}