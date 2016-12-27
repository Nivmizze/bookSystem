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
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/admain.css'/>">
  </head>
  
  <body>
<table class="table" align="center">
	<tr class="trTop">
		<td colspan="2" class="tdTop">
			<iframe frameborder="0" src="${pageContext.request.contextPath }/main/adtop.action" name="adtop"></iframe>
		</td>
	</tr>
	<tr>
		<td class="tdLeft" rowspan="4">
			<iframe frameborder="0" src="${pageContext.request.contextPath }/main/adLeft.action" name="adleft"></iframe>
		</td>
	</tr>
	<tr>
		<td style="border-top-width: 0px;" class="tdBody" rowspan="3">
			<iframe frameborder="0" src="${pageContext.request.contextPath }/main/adbody.action" name="adbody"></iframe>
		</td>
	</tr>
</table>
  </body>
</html>
