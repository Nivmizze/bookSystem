<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'accurateselect.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	
</script>
</head>

<body>
	<center>
	<form action="${pageContext.request.contextPath}/book/allbookcount.action" method="post">
	   <table>
			<tr>
				<td>书名:</td>
				<td><input type="text" name="bname"/></td>
			</tr>
			<tr>
				<td>作者:</td>
				<td><input type="text" name="author"/></td>
			</tr>
			<tr>
				<td>出版社</td>
				<td><input type="text" name="press"/></td>
			</tr>
			<tr>
			   <td></td>
			   <td>
			     <input type="submit"  value="搜索" style="width: 75px"/>
			     <input type="reset" value="重新填写" style="width: 75px"/>
			   </td>
			
			</tr>
		</table>
	</form>
		
	</center>
</body>
</html>
