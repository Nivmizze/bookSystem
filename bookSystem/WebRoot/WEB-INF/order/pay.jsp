<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'order6.jsp' starting page</title>
    
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
  location.href="${pageContext.request.contextPath }/order/pay.action?oid="+oid;
  }
  </script>
  </head>
  
  <body>
  <center>
   <table style="border:solid 3px #EEE5DE;" width="85%" height="90% " cellspacing="0">
   <tr>
   <td><input type="radio" name="bank" checked/><img src="bank_img/abc.bmp"/></td>
   <td><input type="radio" name="bank"/><img src="bank_img/bc.bmp"/></td>
   <td><input type="radio" name="bank"/><img src="bank_img/bcc.bmp"/></td>
   <td><input type="radio" name="bank"/><img src="bank_img/beijingnongshang.bmp"/></td>
   </tr>
   <tr>
   <td><input type="radio" name="bank"/><img src="bank_img/bh.bmp"/></td>
   <td><input type="radio" name="bank"/><img src="bank_img/bj.bmp"/></td>
   <td><input type="radio" name="bank"/><img src="bank_img/ccb.bmp"/></td>
   <td><input type="radio" name="bank"/><img src="bank_img/cib.bmp"/></td>
   </tr>
   <tr>
   <td><input type="radio" name="bank"/><img src="bank_img/cmb.bmp"/></td>
   <td><input type="radio" name="bank"/><img src="bank_img/cmbc.bmp"/></td>
   <td><input type="radio" name="bank"/><img src="bank_img/dy.bmp"/></td>
   <td><input type="radio" name="bank"/><img src="bank_img/gf.bmp"/></td>
   </tr>
   <tr>
   <td><input type="radio" name="bank"/><img src="bank_img/guangda.bmp"/></td>
   <td><input type="radio" name="bank"/><img src="bank_img/hx.bmp"/></td>
   <td><input type="radio" name="bank"/><img src="bank_img/icbc.bmp"/></td>
   <td><input type="radio" name="bank"/><img src="bank_img/nanjing.bmp"/></td>
   </tr>
   <tr>
   <td><input type="radio" name="bank"/><img src="bank_img/ningbo.bmp"/></td>
   <td><input type="radio" name="bank"/><img src="bank_img/pingan.bmp"/></td>
   <td><input type="radio" name="bank"/><img src="bank_img/post.bmp"/></td>
   <td><input type="radio" name="bank"/><img src="bank_img/sfz.bmp"/></td>
   </tr>
   <tr>
   <td><input type="radio" name="bank"/><img src="bank_img/sh.bmp"/></td>
   <td><input type="radio" name="bank"/><img src="bank_img/shpd.bmp"/></td>
   <td><input type="radio" name="bank"/><img src="bank_img/zheshang.bmp"/></td>
   <td><input type="radio" name="bank"/><img src="bank_img/zx.bmp"/></td>
   </tr>
   <tr>
   <td colspan="4" align="left"><input type="button" value="下一步" style="background-color: orange;width: 130px;height: 40px;" onclick="pay('${status}')"/></td>
   </tr>
   </table>
   </center>
  </body>
</html>
