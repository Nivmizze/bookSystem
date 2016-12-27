<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'order5.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <script type="text/javascript">
  function pay(oid){
  location.href="${pageContext.request.contextPath }/order/gopay.action?oid="+oid;
  }
  function cancel(oid){
  alert(oid);
  location.href="${pageContext.request.contextPath }/order/cancel.action?oid="+oid;
  }
  </script>
  </head>
  
  <body>
  <div style="border: 3px solid #EEE5DE;width: 90%;height: 100%;margin-left: 5%;">
  <div style="left: 11%;position: absolute;">
  <font size="4">收货人信息：</font><br/>
  ${orderad}
  <hr width="900px"/>
  <font size="3">商品清单：</font>
  <table style="border:solid 3px #EEE5DE;" width="900px" height="80% " cellspacing="1" cellpadding="0">
  <tr bgcolor="lightgray" align="center">
  <td colspan="2">商品名称</td>
  <td>单价</td>
  <td>数量</td>
  <td>小计</td>
  </tr>
  <c:forEach var="i" items="${orderitems}">
  <tr align="center"><!--
  <td><img src="/images/${i.image_b }" width="100px" height="100px"/>${i.bname }</td>
  -->
  <td><img src="book_img/${i.image_b }" width="100px" height="100px"/></td>
  <td>${i.bname }</td>
  <td>${i.currPrice }</td>
  <td>${i.quantity }</td>
  <td>${i.subtotal }</td>
  </tr>
  </c:forEach>
  </table>
  <div style="margin-left:80%;">
  合计金额：${total }
  <br/>
  <!--<input type="button" style="background-color: green;color: white;width: 150px;height: 40px;border: 0" value="立即支付" onclick="pay('${status}')"/><br/><br/>
  <input type="button" style="background-color: gray;color: white;width: 150px;height: 40px;border: 0" value="取消订单" onclick="cancel('${statu}')"/>
  --></div>
  </div>
  </div>
  </body>
</html>
