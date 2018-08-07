window.currentHover=0;
	var ul1='<ul class="select-popup" style="display: none">\
				</ul>';
	var ul2=document.createElement("ul");
	ul2.className="select-popup";
	ul2.style.display="none";
	ul2.id="acList";
	
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
			acListDown();
		}
		else if(e.keyCode==38){
			acListUp();
		}
		else if(e.keyCode==13 || e.keyCode==9){
			window.acId=$("#acList li").eq(currentHover).attr("data-id");
			for(a of acs){
				if(a.id==acId){
					this.value=a.name;
					$("#acList").hide();
					break;
				}
			}
		}
		else if(e.keyCode==27){
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