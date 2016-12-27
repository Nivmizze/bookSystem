$(
		function(){
			//div隐藏
			var flag = false;
			$("#checkbox").click(function(){
				if(flag){
					$("#center").css("display","block");
					$("#right").css("display","none");
					flag = !flag;
				}else{
					$("#right").css("display","block");
					$("#center").css("display","none");
					flag = !flag;
				}
			});
			
			//图片交换
			$("#update").css("background","url(/bookSystem/images/huang_2_btn.jpg)");
			$("#update").mouseover(function(){
				$("#update").css("background","url(/bookSystem/images/huang_1_btn.jpg)");
			});
			$("#update").mouseout(function(){
				$("#update").css("background","url(/bookSystem/images/huang_2_btn.jpg)");
			});
			
			
			$("#detele").css("background","url(/bookSystem/images/hong_2_btn.jpg)");
			$("#detele").mouseover(function(){
				$("#detele").css("background","url(/bookSystem/images/hong_1_btn.jpg)");
			});
			$("#detele").mouseout(function(){
				$("#detele").css("background","url(/bookSystem/images/hong_2_btn.jpg)");
			});
			
			//当前价格的算法
			$("#price").blur(function(){
				if(0 == $("#discount").val()){
					$("#currprice").val($("#price").val());
				}else{
					$("#currprice").val($("#price").val()/10*$("#discount").val());
				}
			});
			$("#discount").blur(function(){
				if(0 == $("#discount")){
					$("#currprice").val($("#price").val());
				}else{
					$("#currprice").val($("#price").val()/10*$("#discount").val());
				}
			});
			
			
			//分类集联
			$("#father").change(function(){
				var value=$("#father").val();
				var s=document.getElementById("son");
				s.options.length=0;
				$.ajax({
					type:"post",
					url:"book/ajax.action",
					data:"cid="+value,
					dataType:"text",
					success:function(son){
						var arr=son.split(",");
						for(var i=0;i<arr.length-1;i+=2){
							var op = new Option(arr[i+1],arr[i]);
							s.options.add(op);
						}
					}
				});
			});
		}
);



//验证
function checkBname(){
	var bname = $("#bname").val();
	if(""==bname){
		alert("书名不能为空！");
		return false;
	}
	return true;
}
function checkImage_w(){
	var image_w = $("#image_w").val();
	if(""==image_w){
		alert("小图不能为空！");
		return false;
	}
	return true;
}
function checkImage_b(){
	var image_w = $("#image_b").val();
	if(""==image_b){
		alert("大图不能为空！");
		return false;
	}
	return true;
}
function checkPrice(){
	var reg = /^\d{1,5}(\.\d{1,2})?$/;
	var price = $("#price").val();
	if(!reg.test(price)){
		alert("价格格式错误！");
		return false;
	}
	return true;
}
function checkDiscount(){
	var reg = /^\d{1}(\.\d{1,2})?$/;
	var discount = $("#discount").val();
	if(!reg.test(discount)){
		alert("折扣格式错误！");
		return false;
	}
	return true;
}
function checkAuthor(){
	var author = $("#author").val();
	if(""==author){
		alert("作者不能为空！");
		return false;
	}
	return true;
}
function checkPress(){
	var press = $("#press").val();
	if(""==press){
		alert("出版社不能为空！");
		return false;
	}
	return true;
}
function checkPublishtime(){
	var publishtime = $("#publishtime").val();
	if(""==publishtime){
		alert("出版时间不能为空！");
		return false;
	}
	return true;
}
function checkEdition(){
	var edition = $("#edition").val();
	var reg = /^[0-9]{1,}$/;
	if(""==edition){
		alert("版次不能为空！");
		return false;
	}
	else if(!reg.test(edition)){
		alert("版次格式错误！");
		return false;
	}
	return true;
}
function checkPagenum(){
	var pagenum = $("#pagenum").val();
	var reg = /^[0-9]{1,}$/;
	if(""==pagenum){
		alert("页数不能为空！");
		return false;
	}
	else if(!reg.test(pagenum)){
		alert("页数格式错误！");
		return false;
	}
	return true;
	
}
function checkWordnum(){
	var wordnum = $("#wordnum").val();
	var reg = /^[0-9]{1,}$/;
	if(""==wordnum){
		alert("字数不能为空");
		return false;
	}
	else if(!reg.test(wordnum)){
		alert("字数格式错误！");
		return false;
	}
	return true;
}
function checkPrinttime(){
	var printtime = $("#printtime").val();
	if(""==printtime){
		alert("印刷时间不能为空");
		return false;
	}
	return true;
}
function checkBooksize(){
	var booksize = $("#booksize").val();
	var reg = /^[0-9]{1,}$/;
	if(""==booksize){
		alert("开本不能为空");
		return false;
	}
	else if(!reg.test(booksize)){
		alert("开本格式错误！");
		return false;
	}
	return true;
}
function checkPaper(){
	var paper = $("paper").val();
	if(""==paper){
		alert("纸张不能为空！");
		return false;
	}
	return true;
}
function checkTime(){
	var printtime = $("#printtime").val();//印刷时间
	var publishtime = $("#publishtime").val();//出版时间
	if(printtime >publishtime  ){
		alert("印刷时间不能晚于出版时间");
		return false;
	}
	return true;
}
//error
function checkDime(){
	var publishtime = $("#publishtime").val();//出版时间
	var date = new Date();//当前时间
	if(publishtime >date){
		alert("出版时间不能晚于当前时间");
		return false;
	}
	return true;
}

function check(){
	if(checkBname()&&checkPrice()&&checkDiscount()&&checkAuthor()&&checkPress()
			&&checkPublishtime()&&checkEdition()&&checkPagenum()
			&&checkWordnum()&&checkPrinttime()&&checkBooksize()
			&&checkPaper()&&checkTime()&&checkDime())
	{
		return true;
	}
	return false;
}
