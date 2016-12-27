<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

		<title>我的购物车</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" type="text/css" href="css/car/car.css">

	</head>
	<script type="text/javascript" src="jquery/jquery-1.5.1.js"></script>
	<script type="text/javascript" src="js/car/car.js"></script>
	<script type="text/javascript">
		function submitCar()
		{
			var chooses = document.getElementsByName("choose");
			var id=0;
			for(var i=0; i<chooses.length;i++)
			{
				var choose = chooses[i];
				if(choose.checked)
				{
					 id=id+","+choose.value;
				}
				
			}
			if(id==0){
			alert("至少选择一个")
			}
			else{
			location.href="${pageContext.request.contextPath}/order/toaddOrder.action?ids="+id;
	            }
		}
	</script>
	<body>
	
	
			<!-- 
				判断当前用户的购物车是否有物品,
				如果购物车中没有商品跳转另一个页面 -->
		<c:choose>
			<c:when test="${not empty carList }">
			<!-- 遍历显示购物车中的信息 -->
				<div id="container">
				<div id="title">
	
					<table id="ct">
						<tr>
							<td id="ct1">
	
								<input name="chooseall" type="checkbox" id="all">
								<label id="text">全选</label>
							</td>
							<td id="ct2">
								商品名称
							</td>
							<td id="ct3">
								单价
							</td>
							<td id="ct4">
								数量
							</td>
							<td id="ct5">
								小计
							</td>
							<td id="ct6">
								操作
							</td>
	
						</tr>
					</table>
				</div>
			<!-- 遍历购物车的集合 -->
			<c:forEach var="cbk" items="${carList }">
				<table id="tab">
					<tr>
						<td background="EDEDED" id="td" align="center">
							<div id="orders">
								<table id="ot">
									<tr id="">
										<td id="ot1">
											<input id="choose${cbk.cartItemId}" onclick="chooseBook('${cbk.cartItemId}')" name="choose" type="checkbox" class="checkbox" value="${cbk.cartItemId}">
										</td>
										<td>
											<div class="divimg"><img class="book_img" src="book_img/${cbk.book.image_b}"/></div>
											
										</td>
										<!-- 书名 -->
										<td id="ot2">
											${cbk.book.bname }
										</td>
										<!-- 书打折后的价格 -->
										<td id="ot3">
											
												<span id="price${cbk.cartItemId}" style="color: red;">${cbk.book.currPrice }</span>
											
										</td>
										<!-- 购物车中的书的数量 -->
										<td id="ot4">
											<!-- 这里边的num的class可以根据订单的某个属性赋值 -->
											<input type="button" class="sub" onclick="subQuantity('${cbk.cartItemId}')" value="-" />
											<input type="text" name="num" id = "${cbk.cartItemId}" class="num" value="${cbk.quantity }" readonly="readonly"/>
											<input type="button" class="add" onclick="addQuantity('${cbk.cartItemId}')" value="+" />
										</td>
										<!-- 小计 -->
										<td id="ot5">
											<font color="red">￥
												<span class="account" id="account${cbk.cartItemId}"><fmt:formatNumber type="number" value="${cbk.book.currPrice * cbk.quantity}" pattern="0.00" maxFractionDigits="2"></fmt:formatNumber> </span>
											</font>
										</td>
										<!-- 删除一条购物车记录 -->
										<td id="ot6">
											<a href="javascript:deleteOneBook('${cbk.cartItemId}');">删除</a>
										</td>
									</tr>
								</table>
							</div>
							<div id="temp">
							</div>
						</td>
					</tr>
	
				</table>
			</c:forEach>
	
				<table id="tab">
					<tr>
						<td background="EDEDED" id="td" align="center">
							<div id="bottom">
								<table>
									<tr>
										<td id="jt1">
											<a href="javascript:deleteBatch();">批量删除</a>
										</td>
										<!-- 总计 -->
										<td id="jt2">
											<span class="summary">总计：</span><font color="red">￥
											<span id = "totalacc"> 0.00 </span></font><br />
												<hr color="EDEDED"/> 
										</td>
									</tr>
									<tr>
										<td colspan="2" id="jt3">
											<input type="button" id="subm" onclick="submitCar()">
	
										</td>
									</tr>
								</table>
							</div>
							<div id="bt"></div>
						</td>
					</tr>
				</table>
	
			</div>
			</c:when>
			<c:otherwise>
				<jsp:include page="noneCar.jsp"></jsp:include>
		
			</c:otherwise>
		</c:choose>
				
	</body>
</html>
