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
    
    <title>My JSP 'car1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" type="text/css" href="css/car/car.css">
    <script type="text/javascript" src="js/jquery-1.5.1.js"></script>
  </head>
  
  <body>
  	
  		<c:if test="${null eq sessionScope.loginuser }"> 
  			<div>您还没有登陆!</div>
  			 <div class="gologin"><a href="${pageContext.request.contextPath }/user/welcome.action" target="_parent">去登陆</a></div>
  		</c:if>
  	
    <div id="divmain">
    <center><img src="images/icon_empty.png" align="middle"/><font size="5" color="lightgray" style="margin-left: 23px;">您的购物车中暂时没有商品</font></center>
    </div>
   
  </body>
</html>
