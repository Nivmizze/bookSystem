<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updatecategorya.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="jquery/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="js/category/updatecategorya.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function goback()
		{
			location.href = "${pageContext.request.contextPath }/category/category.action";
		}
	</script>
  </head>
  
  <body style="background-color: #FFD1A4;">
    <h1>修改一级分类</h1>
	<form action="${pageContext.request.contextPath }/category/updatecategorya.action" method="post" onsubmit="return check()">
		分类ID:<input type="text" name="cid" value="${updatecategorya.cid }" readonly="readonly"/><br/><br/>
		分类名称:<input id="cname" type="text" name="cname" value="${updatecategorya.cname }"/><br/><br/>
		分类描述:<textarea id="des" rows="5" cols="50" name="des">${updatecategorya.des }</textarea><br/><br/>
		<input type="submit" value="修改一级分类"/>
		<input type="button" value="返回" onclick="goback()"/>
	</form>
  </body>
</html>
