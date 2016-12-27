<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'order2.jsp' starting page</title>
    
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
  </script>

  </head>
  
  <body>
  <center>
  <div style="width: 70%;height: 60%;background-color: #EEE5DE;border: 3px solid #EEE5DE; ">
  <div style="width: 100%;height: 5%;"><h3 align="center">订单已生成</h3></div>
  <div style="width: 100%;height: 90%;background-color: white;">
  <br/><br/>
  <div><img src="images/duihao.jpg" width="200px" height="200px" align="left"/></div>
  <br/>
  <div style="width:70%;height: 100%; ">
  <font size="4">订单编号</font> <br/>
  ${orderid }
   <br/><font size="4">合计金额</font> <br/>
  ${total }
   <br/><font size="4">收货地址</font> <br/>
  ${address}
  <br/>
  ITbookstore感谢您的支持，祝您购物愉快！
  <input type="button" value="支付" style="background-color: orange;" onclick="pay('${orderid }')"/>
  </div>
  </div>
  </div>
  </center>
  </body>
</html>
