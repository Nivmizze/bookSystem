<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'order1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <center>
  <form action="${pageContext.request.contextPath }/order2.action" method="post">
  <table border="1" width="80%" height="60%" bgcolor="#EEE5DE" bordercolor="#EEE5DE">
  <tr align="left">
  <th colspan="4">生成订单</th>
  </tr>
  <tr bgcolor="white" align="center">
  <td>图书名称</td>
  <td>单价</td>
  <td>数量</td>
  <td>小计</td>
  </tr>
  <tr bgcolor="white">
  <td valign="middle"><a href="" style="text-decoration: none;"><img src="book_img/9186890-1_w.jpg" width="100px" height="100px"><font style="top: 20%;position: absolute;">sufdijhsdfkjlfSDlkjdfsjlkasffSDJoi</font></a></td>
  <td align="center">q</td>
  <td align="center">w</td>
  <td align="center">q</td>
  </tr>
  <tr bgcolor="white" align="right">
  <th colspan="3">总计：</th>
  <th></th>
  </tr>
  <tr align="left">
  <th colspan="4">收货地址</th>
  </tr>
  <tr align="left" bgcolor="white">
  <td colspan="4"><input type="text" name="" style="width: 60%;height:60%; border-color: lightblue;"/></td>
  </tr>
  <tr align="right" bgcolor="white">
  <td colspan="4"><input type="submit" value="提交订单" style="background-color: orange;width: 200px;height:40px;font-size: 15; "/></td>
  </tr>
  </table>
  </form>
  </center>
  </body>
</html>
