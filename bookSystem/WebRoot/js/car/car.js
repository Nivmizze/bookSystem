$(function() {

	//下单按钮样式
	$("#subm").css("background", "url(images/icon.png) 0px -36px");
	$("#subm").mouseover(function() {
		$("#subm").css("background", "url(images/icon.png) 0px -75px");
	});
	$("#subm").mouseout(function() {
		$("#subm").css("background", "url(images/icon.png) 0px -36px");
	});

	//全选
	$("#all").click(function() {

		var ck = $(".checkbox");
		
		var all=document.getElementById("all");
		
		if (all.checked) 
		{

			$("#text").text("全不选");
			for ( var i = 0; i < ck.length; i++) {
				var c = ck[i];
				c.checked = true;
			}
			var accounts = $(".account");
			//初始总金额
			var total = 0.00;
			$.each(accounts,function(index,item){
				total = total+parseFloat($(this).text());
			});
			$("#totalacc").text(total.toFixed(2));
		} else {

			$("#text").text("全选");
			for ( var i = 0; i < ck.length; i++) {
				var c = ck[i];
				c.checked = false;
			}
			$("#totalacc").text("0.00");
		}
	});
}

);
var xhr;

function subQuantity(cartItemId) {
	var quantity = $("#" + cartItemId).val();
	if (parseInt(quantity) <= 1) {
		alert("不能再少了");
	} else {
		xhr = new XMLHttpRequest();
		xhr.open("post", "car/modifyQuantity.action", true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var value = xhr.responseText;
				$("#" + cartItemId).val(value);

				var price = $("#price" + cartItemId).text();
				price=parseFloat(price);
				$("#account" + cartItemId).text(
						(parseInt(value) * price).toFixed(2));
				//更改总计
				var sumprice = $("#totalacc").text();
				sumprice=parseFloat(sumprice);
				if(document.getElementById("choose"+cartItemId).checked)
				{
					
					sumprice=sumprice-price;
					$("#totalacc").text(sumprice.toFixed(2));
				}
			}
		};
		//发送之前设置头	
		xhr.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		xhr.send("cartItemId=" + cartItemId + "&quantity=" + quantity);
	}
}
function addQuantity(cartItemId) {
	var quantity = $("#" + cartItemId).val();

	xhr = new XMLHttpRequest();
	xhr.open("post", "car/addmodifyQuantity.action", true);
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			//从数据库穿回来的数量
			var value = xhr.responseText;
			//更改页面数量
			$("#" + cartItemId).val(value);
			//打折后的价格(当前单价)
			var price = $("#price" + cartItemId).text();
			price = parseFloat(price);
			//小计
			$("#account" + cartItemId).text(
					(parseInt(value) * price).toFixed(2));
			//如果被选中,要更改总计
			var sumprice = $("#totalacc").text();
			sumprice=parseFloat(sumprice);
			if(document.getElementById("choose"+cartItemId).checked)
			{
				sumprice=sumprice+price;
				$("#totalacc").text(sumprice.toFixed(2));
			}
		}
	};
	//发送之前设置头	
	xhr.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded;charset=UTF-8");
	xhr.send("cartItemId=" + cartItemId + "&quantity=" + quantity);

}
//删除购物车中的一本书
function deleteOneBook(cartItemId) {
	if (confirm("确定删除吗?")) {
		location.href = "car/deleteOneBook.action?cartItemId=" + cartItemId;
	}
}
//批量删除
function deleteBatch() {
	var arr = new Array();
	var idsEles = document.getElementsByName("choose");
	for ( var i = 0; i < idsEles.length; i++) {
		var idsEle = idsEles[i];
		if (idsEle.checked) {
			arr.push(idsEle.value);
		}
	}
	if (arr.length == 0) {
		alert("请至少选择一本要删除的书");
	} else {
		if(confirm("确认删除吗?")){
			
			var carids=0;
			for(var i = 0;i<arr.length;i++)
			{
				carids=carids+","+arr[i];
			}
			//alert(carids);
			location.href = "car/deleteBatch.action?carids="+carids;
		}
	}
}
function chooseBook(cartItemId)
{
	//alert(cartitemid);
	var arr = new Array();
	var idsEles = document.getElementsByName("choose");
	for ( var i = 0; i < idsEles.length; i++) {
		var idsEle = idsEles[i];
		if (idsEle.checked) {
			arr.push(idsEle.value);
			
		}
	}
	if (arr.length == idsEles.length) {
		//当全部选中时,全选按钮变成选中的状态
		document.getElementById("all").checked=true;
		$("#text").text("全不选");
	}else{
		document.getElementById("all").checked=false;
		$("#text").text("全选");
	}
	//如果当前是选中的
	//var vl = $("#account"+cartitemid).text();
	//var ch = $("#choose"+cartitemid).attr("checked")
	/*alert(ch);
	if(ch){
		alert("checked==true");
	}*/
	var cur = $("#totalacc").text();
	var text = $("#account"+cartItemId).text();
	if($("#choose"+cartItemId).attr("checked"))
	{
		$("#totalacc").text((parseFloat(cur)+parseFloat(text)).toFixed(2));
	}else{
		
		$("#totalacc").text((parseFloat(cur)-parseFloat(text)).toFixed(2));
	}
	
}
