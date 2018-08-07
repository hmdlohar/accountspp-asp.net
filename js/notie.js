window.notie = {
    success: function (msg, time) {
        if (!time) {
            time = 2000;
        }
        notiePopup.innerHTML = msg;
        notiePopup.style.top = "0px";
        notiePopup.style.backgroundColor = "green";
        setTimeout(function () {
            notiePopup.style.top = "-70px";
        }, time);
    },
    error: function (msg, time) {
        if (!time) {
            time = 2000;
        }
        notiePopup.innerHTML = msg;
        notiePopup.style.top = "0px";
        notiePopup.style.backgroundColor = "red";
        setTimeout(function () {
            notiePopup.style.top = "-70px";
        }, time);
    }
}


window.notiePopup=document.getElementById("notiePopup");