window.currentHover=0;
	var ul1='<ul class="select-popup" style="display: none">\
				</ul>';
	var ul2=document.createElement("ul");
	ul2.className="select-popup";
	ul2.style.display="none";
	ul2.id="acList";
	
    $(document).ready(function(){
        $("#btnEntry").click(btnEntryClick);
        $("#acAmountCredit").change(function(){
            $("#acAmountDebit").val($(this).val());
        });
        $("#acAmountDebit").change(function(){
            $("#acAmountCredit").val($(this).val());
        });
    });

	$('.ac-date').datetimepicker();

	$(".ac-list").on("input",function(){
		//console.log(this.value);
		$(ul2).empty();
		currentHover=0;
		for(a of acs){
			if(a.name.toLowerCase().includes(this.value.toLowerCase())){
				$(ul2).append("<li data-id="+a.id+">"+a.name+"</li>");
			}
		}
		this.parentElement.appendChild(ul2);
		$(ul2).find("li").hover(liHoverFunction);
		$(ul2).find("li").click(liOnClick);
		$("#acList li").eq(currentHover).css("background","grey");
		$(ul2).show();

	});
	$(".ac-list").on("keydown",function(e){
		if(e.keyCode==40){
            /* Key Down */
			acListDown();
		}
		else if(e.keyCode==38){
            /* Key Up */
			acListUp();
		}
		else if(e.keyCode==13 || e.keyCode==9){  /* Key Enter=13 and Tab=9 */
			window.acId=$("#acList li").eq(currentHover).attr("data-id");
			for(a of acs){
				if(a.id==acId){
					this.value=a.name;
                    $(this).attr("data-id",a.id);
					$("#acList").hide();
					break;
				}
			}
		}
		else if(e.keyCode==27){
            /* Key Escape */
			$("#acList").hide();
		}
		else if(false){
			//goForNext();
		}
	});
	$(".table-custom *").focus(function(){
		$(this).addClass("active");
	});
	$(".table-custom *").blur(function(){
		$(this).removeClass("active");
	});
	function liHoverFunction(){
		$("#acList li").eq(currentHover).css("background","none");
		window.currentHover=$(this).prevAll().length;
		$("#acList li").eq(currentHover).css("background","grey");

	}
	function liOnClick(){
		window.acId=$("#acList li").eq(currentHover).attr("data-id");
		for(a of acs){
			if(a.id==acId){
				$(this).parent().prev().val(a.name);
				$(this).parent().prev().attr("data-id",a.id);
				$(this).parent().hide()
				break;
			}
		}
	}
	function acListUp(){
		$("#acList li").eq(currentHover).css("background","none");
		window.currentHover--;
		$("#acList li").eq(currentHover).css("background","grey");
	}
	function acListDown(){
		$("#acList li").eq(currentHover).css("background","none");
		window.currentHover++;
		$("#acList li").eq(currentHover).css("background","grey");
	}

    function btnEntryClick(){
        if(checkForValidEntry()){
        var dta={
                    entryType: "journal",
                    acDebit: $("#acDebit").data("id"),
                    acCredit: $("#acCredit").data("id"),
                    acAmount: $("#acAmountDebit").val(),
                    acInvoice: $("#acInvoice").val(),
                    acDate: $("#acDate").val()
                };
            console.log(dta);
            $.ajax({
                url: "dataModel.aspx",
                type: "POST",
                data:dta,
                success:function(data){
                    if(data=="success"){
                        if(loadRecords){
                            loadRecords(window.acid);
                        }
                        notie.success("Transaction Successful");
                    }
                    console.log(data);
                },
                error:function(err){
                    console.log(err.responseText);
                }
            });
        }
    }
    function checkForValidEntry(){
      

        if(!$("#acDebit").data("id")){
            notie.error("Account Debit is empty");
            return false;
        }
        else if(!$("#acCredit").data("id")){
            notie.error("Account Credit is empty");
            return false;
        }
        else if(!$("#acAmountDebit").val()){
            notie.error("Amount Debit is empty");
            return false;
        }
        else if(!$("#acAmountCredit").val()){
            notie.error("Amount Credit is empty");
            return false;
        }
        else if(!$("#acInvoice").val()){
            notie.error("Invoice Number is empty");
            return false;
        }
        else if(!$("#acDate").val()){
            notie.error("Select Date");
            return false;
        }
        else if($("#acCredit").data("id")==$("#acDebit").data("id")){
            notie.error("Debit and credit accounts both are same");
            return false;
        }
       
        return true;
       
    }
   
