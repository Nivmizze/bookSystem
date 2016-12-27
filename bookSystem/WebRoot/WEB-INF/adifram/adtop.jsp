<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>top</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
	body {
		background: #15B69A;
		margin: 0px;
		color: #ffffff;
	}
	a {
		text-transform:none;
		text-decoration:none;
		color: #ffffff;
		font-weight: 900;
	} 
	a:hover {
		text-decoration:underline;
	}
  </style>
 <script type="text/javascript">
 function back(){
 if(confirm("是否退出？")){
 top.location.href="${pageContext.request.contextPath }/user/welcome.action";
 }
 }
 </script>
  </head>
  
  <body>
<h1 style="text-align: center;">网博书城管理系统</h1>
<div style="font-size: 10pt; line-height: 10px;">

		      <font size="3" color="blue">管理员：${adname }</font>&nbsp;&nbsp;|&nbsp;&nbsp;
		  <a href="${pageContext.request.contextPath }/category/category.action" target="adbody">分类管理</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		  <a href="${pageContext.request.contextPath }/book/book.action" target="adbody">图书管理</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		  <a href="${pageContext.request.contextPath }/order/showadOrders.action" target="adbody">订单管理</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		  <!--<a href="javascript:back();" target="_parent">退出</a>	-->
		  <a href="${pageContext.request.contextPath }/admin/login.action" target="_parent">退出</a>
</div>
  </body>
</html>
