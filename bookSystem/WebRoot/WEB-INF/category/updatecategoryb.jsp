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
    
    <title>My JSP 'updatecategoryb.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="jquery/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="js/category/updatecategoryb.js"></script>
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
    <h1>修改二级分类</h1>
	<form action="${pageContext.request.contextPath }/category/updatecategoryb.action" method="post" onsubmit="return check()">
		分类ID:<input type="text" name="cid" value="${updatecategoryb.cid }" readonly="readonly"/><br/><br/>
		分类名称:<input id="cname" type="text" name="cname" value="${updatecategoryb.cname }"/><br /> <br /> 
		一级分类：<select name="pid">
					<option value="${cp.cid }">${cp.cname }</option>
					<c:forEach var="c" items="${categorys }">
						<c:if test="${c.pid==null }">
							<option value="${c.cid}">${c.cname }</option>
						</c:if>
					</c:forEach>
				</select><br /> <br /> 
		分类描述:<textarea id="des" rows="5" cols="50" name="des">${updatecategoryb.des }</textarea><br /> <br /> 
		<input type="submit" value="修改二级分类" /> 
		<input type="button" value="返回" onclick="goback()" />
	</form>
  </body>
</html>
