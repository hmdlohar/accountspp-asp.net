


/* equlizer codes */



function showPopup(id,per=30){
    $("#"+id).animate({top:per+"%"})
}
function hidePopup(id){
    $("#"+id).animate({top:"-200%"})
}

function validateSignup(frm){
    console.log("jhi");
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
    else if(frm.dob.value == ""){
        notie.error("Enter Date of Birth");
        return false;
    }
    notie.success("Registeration Successful");
    hidePopup("signupPopup");
    $("#loginArea").hide();
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

