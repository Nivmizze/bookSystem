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
    
    <title>My JSP 'addbook.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="./js/laydate/laydate.js"></script>
	<script type="text/javascript" src="jquery/jquery-1.5.1.js"></script>
	<script type="text/javascript" src="js/book/addbook.js"></script>
	
	<style type="text/css">
		.adddiv{
			background-image: url("/bookSystem/images/hong_2_btn.jpg");
			font-size: 25;
			color:white;
		}
	</style>
  </head>
  
  <body>
	<form action="${pageContext.request.contextPath }/book/addbook.action" method="post" onsubmit="return check()">
	<div style="margin-left: 5%;">
		书名:&nbsp;&nbsp;<input id="bname" onblur="checkBname()" type="text" name="bname" value="" style="width: 300px;"/><br/><br/>
		大图:&nbsp;&nbsp;<input id="image_w" type="file" name="image_w" value="选择文件"/> <br/><br/>
		小图:&nbsp;&nbsp;<input id="image_b"  type="file" name="image_b" value="选择文件"/> <br/><br/>
		当前价:<input id="currprice" type="text" name="currPrice" value="" style="width: 50px;"/><br/><br/>
		定价:&nbsp;&nbsp;<input id="price" onblur="checkPrice()" type="text" name="price" value="" style="width: 50px;"/>
		折扣:<input id="discount" type="text" onblur="checkDiscount()" name="discount" value="" style="width: 50px;"/>折
		<hr/>
		作者:&nbsp;&nbsp;&nbsp;&nbsp;<input id="author" onblur="checkAuthor()" type="text" name="author" value="" style="width: 100px;"/><br/><br/>
		出版社:&nbsp;&nbsp;<input id="press" onblur="checkPress()" type="text" name="press" value="" style="width: 100px;"/><br/><br/>
		出版时间:<input id="publishtime"  type="text" name="publishtime" value="" class="laydate-icon" onclick="laydate()" style="width: 100px;"/><br/><br/>
		版次:&nbsp;&nbsp;&nbsp;&nbsp;<input id="edition" onblur="checkEdition()" type="text" name="edition" value="" style="width: 100px;"/>
		页数:<input id="pagenum" onblur="checkPagenum()" type="text" name="pageNum" value="" style="width: 100px;"/>
		字数:<input id="wordnum" onblur="checkWordnum()" type="text" name="wordNum" value="" style="width: 100px;"/><br/><br/>
		印刷时间:<input id="printtime"  type="text" name="printtime" value="" class="laydate-icon" onclick="laydate()" style="width: 100px;"/>
		开本:<input id="booksize" onblur="checkBooksize()" type="text" name="booksize" value="" style="width: 100px;"/>
		纸张:<input id="paper" onblur="checkPaper()" type="text" name="paper" value="" style="width: 100px;"/><br/><br/>
		一级分类：<select id="father">
					<option value="">==请选择一级分类==</option>
					<c:forEach var="ca" items="${categorys}">
						<c:if test="${ca.pid == null}">
							<option value="${ca.cid }">${ca.cname }</option>
						</c:if>
					</c:forEach>
				</select>
		二级分类：<select id="son" name="cid">
	    				<option>==选择2级分类==</option>
	    			</select><br/><br/>
				<input id="add" class="adddiv" type="submit" value="新书上架"/>
	</div>
	</form>
	
  </body>
</html>
