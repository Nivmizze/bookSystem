<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath =
        request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'describlebook.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" type="text/css" href="css/searchbook/showone.css">
		<script type="text/javascript" src="jquery/jquery-1.5.1.js"></script>
		<script type="text/javascript">
		
		function checkBooknum(){
		var num=document.getElementById("buynum").value;
		var reg = /^[1-9][0-9]{0,2}$/;
		if(!reg.test(num)){
			alert("书籍数量请输入1--3位整数");
			document.getElementById("buynum").value=1;
			return false;
		}else{
			return true;
		}
	   }
		$(function(){
			$("#gobuy").css("background", "skyblue");
			$("#gobuy").mouseover(function(){
			$("#gobuy").css("background", "lightblue");
			});
			$("#gobuy").mouseout(function(){
			  $("#gobuy").css("background","skyblue");
			});
			$("#immediateley").css("background", "skyblue");
			$("#immediateley").mouseover(function(){
			  $("#immediateley").css("background", "lightblue");
			});
			$("#immediateley").mouseout(function(){
				$("#immediateley").css("background","skyblue");
			});
		});
		function checklogin(){
		if(${empty sessionScope.loginuser}){
	    if(confirm("还未登录")){
	    top.location.href="${pageContext.request.contextPath}/user/welcome.action";
	    }
		return false;
		}
		return true;
		}
			/*	//添加书籍到购物车
            $(function(){
               $("#gobuy").click(function()
				{
					
						alert("aaaaa");
						if(${empty sessionScope.loginuser})//没有登陆
						{
							if(confirm("您还未登录,请先登录"))
							{
								top.location.href="${pageContext.request.contextPath}/userlogin/showuserlogin.action#tologin'"
							}	
						}else{
						//已经登陆,可以添加到购物车
							var xhr = new XMLHttpRequest();
							xhr.open("post","${pageContext.request.contextPath}/car/addCartitem.action",true);
							xhr.onreadystatechange=function(){
								if(xhr.readyState==4 && xhr.status==200)
								{
									var data = xhr.responseText;
									alert(data);
								}
							}
							xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=UTF-8");
							xhr.send("bid="+${bookbybid.bid}+"&quantity="+num+"&uid="+${sessionScope.user.uid});
							
						}
					
				});
	        });*/
	  /*  //直接购买
	    function goumai()
	    {
	    	if(checkBooknum()){
					
					//alert(${bookbybid.currPrice});
					//alert("aaaaaaaaa");
					if(${empty sessionScope.loginuser})//没有登陆
					{
						if(confirm("您还未登录,请先登录"))
						{
							top.location.href="${pageContext.request.contextPath}/userlogin/showuserlogin.action#tologin'"
						}	
					}else{//已经登陆,可以添加到购物车
						
						location.href="${pageContext.request.contextPath}/order/desctoaddOrder.action?bid=${bookbybid.bid}&bum="+num;
					}
				}
	    }*/
	</script>

	</head>

	<body>
		<!-- 题目标题 -->
  <form action="${pageContext.request.contextPath}/car/addCartitem.action?bid=${bookbybid.bid}&uid=${loginuser.uid}" onsubmit="return checklogin()" method="post">
		<div class="bookname" style="margin-left: 16%;">
			<h1>
				${bookbybid.bname}
			</h1>
		</div>
		<!--  左侧书本大图 -->
		<div class="picleft">
			<img class="showonepic" src="book_img/${bookbybid.image_w }">
		</div>
		<div class="showoneinfo">
			<div class="bookinfo">
				书籍编号:
				<span id="bookmeasge" name="bid">${bookbybid.bid} </span>
			</div>
			<div class="bookinfo">
				当前价:
				<span class="currprice" name="currPrice"> ￥${bookbybid.currPrice}</span>
			</div>
			<div class="bookinfo">
				定价:
				<span class="paseprice">${bookbybid.price}</span>&nbsp;&nbsp;&nbsp;折扣:
				<span class="discount">${bookbybid.discount}折</span>
			</div>
			<br/>
			<table>
				<tr>
					<td colspan="3">
						<font color="white">1111</font> 作者:${bookbybid.author}
					</td>
				</tr>
				<tr>
					<td>
						<font color="white">1111</font>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<font color="white">1111</font>出版社:
						<font color="blue">${bookbybid.press}</font>
					</td>
				</tr>
				<tr>
					<td>
						<font color="white">1111</font>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<font color="white">1111</font> 出版时间:${bookbybid.publishtime}
					</td>
				</tr>
				<tr>
					<td>
						<font color="white">1111</font>
					</td>
				</tr>
				<tr>
					<td>
						<font color="white">1111</font> 版次:${bookbybid.edition}
					</td>
					<td>
						<font color="white">1111</font> 页数:${bookbybid.pageNum}
					</td>
					<td>
						<font color="white">1111</font> 字数${bookbybid.wordNum}
					</td>
				</tr>
				<tr>
					<td>
						<font color="white">1111</font>
					</td>
				</tr>
				<tr>
					<td>
						<font color="white">1111</font> 印刷时间:${bookbybid.printtime }
					</td>
					<td>
						<font color="white">11111</font>开本:${bookbybid.booksize}
					</td>
					<td>
						<font color="white">1111</font>纸张:${bookbybid.paper}
					</td>
				</tr>
				<tr>
					<td>
						<font color="white">1111</font>
					</td>
				</tr>
			</table>
		</div>
		<c:choose>
			<c:when test="${0 == bookbybid.bstatus }">
		<div class="joincar">
			<div class="buymany">
				我要购买:
				<input type="text" name="quantity" style="width: 50px" id="buynum" value="1" onblur="checkBooknum()"/>
				本
				<input type="submit" id="gobuy" class="buyaa" value="加入购物车" />
			</div>
		</div>
		</c:when>
			<c:otherwise>
				<h2>书已下架</h2>
			</c:otherwise>
		</c:choose>
    </form>
	</body>
</html>
