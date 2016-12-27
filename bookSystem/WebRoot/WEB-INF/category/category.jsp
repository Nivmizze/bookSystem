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
    
    <title>My JSP 'category.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/cagetory/cagetory.css">
	<script type="text/javascript" src="jquery/jquery-1.8.3.js"></script>
	<script type="text/javascript">
		window.onload = function(){
			var defaila = '${sessionScope.defaila}';
			if(defaila!="")
			{
				alert(defaila);
			}
			
			
			var defailb = '${sessionScope.defailb}';
			if(defailb!="")
			{
				alert(defailb);
			}
		}
			
	</script>
  </head>
  
  <body style="background-color: #FFD1A4;">
	<center>
	<c:remove var="defaila" scope="session"/>
	<c:remove var="defailb" scope="session"/>
		<h1>分类列表</h1>
		<br/>
		<a href="${pageContext.request.contextPath }/category/showaddcategorya.action">添加一级分类</a>
		<table class="tb" border="1" cellpadding="0" cellspacing="0">
			<tr class="th">
				<th>分类名称</th>
				<th>描述</th>
				<th>操作</th>
			</tr>
			<c:forEach var="ca" items="${categorys}">
				<c:if test="${ca.pid == null}">
					<tr class="tra">
						<td>${ca.cname }</td>
						<td>${ca.des }</td>
						<td>
							<a href="${pageContext.request.contextPath }/category/showaddcategoryb.action">增加二级分类</a>
							<a href="${pageContext.request.contextPath }/category/showcategorybycida.action?cid=${ca.cid }">修改</a> 
							<a href="${pageContext.request.contextPath }/category/deletecategory.action?cid=${ca.cid }">删除</a>
						</td>
					</tr>
					
						<c:forEach var="cb" items="${categorys}">
							<c:if test="${ca.cid == cb.pid}">
							<tr class="trb">
								<td>${cb.cname }</td>
								<td>${cb.des }</td>
								<td>
									<a href="${pageContext.request.contextPath }/category/showcategorybycidb.action?cid=${cb.cid }">修改</a> 
									<a href="${pageContext.request.contextPath }/category/deletecategory.action?cid=${cb.cid }">删除</a>
								</td>
							</tr>
							</c:if>
						</c:forEach>
				</c:if>
			</c:forEach>
		</table>
	</center>
  </body>
</html>
