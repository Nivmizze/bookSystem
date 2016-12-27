<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>生成订单</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/order/order.css">
	<link href="css/order/city.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="jquery/jquery-1.5.1.js"></script>
	
	<script type="text/javascript" src="js/order/jquery.min.js"></script>
	<script type="text/javascript" src="js/order/city.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var sum = 0;
			var xiaojis = $(".xiaoji");
			$.each(xiaojis,function(index,item){
				var account = $(item).text();
				sum=sum+parseFloat(account);
			})
			
			$("#zongji").text(sum.toFixed(2));
			
			$("#body5").focus(function(){
				
				document.getElementById("body5").value="";
			});
		})
		
		function placeABC()
		{
			var total = document.getElementById("total").innerHTML;
			var addre = document.getElementById("body5").value;
			if(""==addre)
			{
			    alert("请输入正确的地址");
				document.getElementById("err").innerHTML="请输入正确的地址";
			}else{
				location.href="${pageContext.request.contextPath }/order/addorder.action?total="+total+"&address="+addre+"&uid="+"${loginuser.uid}";
			}
		}
	</script>

  </head>
  
  <body>
    <div class="body">
    	<br/>
    	<h2 class="body1">生成订单</h2>
    	<br/>
    	<div class="body2">
		    		<table width="100%" border="3" cellspacing="0" bordercolor="lightgray">
		    			<tr>
		    				<th>图书名称</th>
		    				<th>单价</th>
		    				<th>数量</th>
		    				<th>小计</th>
		    			</tr>
		    			<c:if test="${not empty CartItemVos}">
		    				<c:forEach var="cartitem" items="${CartItemVos}">
			    				<tr>
			    					<td><img src="book_img/${cartitem.image_b}" width="66" height="66"/>${cartitem.bname }</td>
			    					<td>${cartitem.currPrice }</td>
			    					<td>${cartitem.quantity }</td>
			    					<td class="xiaoji" id="total">${cartitem.currPrice * cartitem.quantity }</td>
			    				</tr>
		    				</c:forEach>
		    			</c:if>
		    		</table>
    	</div>
    	<div class="body3" style="font-size:20px;">
    		总计￥：<span id="zongji" style="color: red;"></span>
    	</div><br/><br/>
    	<h2 class="body1">收货地址</h2>
    	<br/>
    	<div class="body4">
    		<%--<input id="body5" type="text" name="address"/>
    	--%>
   			<div id="content-wrap">     
            <div id="content-left" class="demo">

                <form action="" name="form1">
                        <div class="infolist">
                            <lable>所在地区：</lable>
                            <div class="liststyle">
                                <span>
                                	<input id="body5" type="text" name="address" value=""/>
                                </span>
                                <span id="err"></span>
                            </div>
                        </div>
                    </form> 
            </div>
            <div id="content-right"></div>
        </div>
    	</div>
    	<div class="body6">
    		<a href="javascript:placeABC();"><div class="body7" style="background-color: orange">提交订单</div></a>
    	</div>
    </div>
  </body>
</html>
