<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>书城首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/main.css'/>">
  </head>
  
  <body>
<table class="table" align="center">
	<tr class="trTop">
		<td colspan="2" class="tdTop">
			<iframe frameborder="0" src="${pageContext.request.contextPath }/main/top.action" name="top"></iframe>
		</td>
	</tr>
	<tr>
		<td class="tdLeft" rowspan="2">
			<iframe frameborder="0" src="${pageContext.request.contextPath }/main/left.action" name="left"></iframe>
		</td>
		<td class="tdSearch" style="border-bottom-width: 0px;">
			<iframe frameborder="0" src="${pageContext.request.contextPath }/main/search.action" name="search"></iframe>
		</td>
	</tr>
	<tr>
		<td style="border-top-width: 0px;" class="tdBody">
			<iframe frameborder="0" src="${pageContext.request.contextPath }/main/body.action" name="body"></iframe>
		</td>
	</tr>
</table>
  </body>
</html>
