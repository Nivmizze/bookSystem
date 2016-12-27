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
    
    <title>编辑图书</title>
    
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
	<script type="text/javascript" src="js/book/editbook.js"></script>
	<link rel="stylesheet" type="text/css" href="css/book/editbook.css">
  </head>
  <script type="text/javascript">
  	function deleteBook(bid){
		location.href = "${pageContext.request.contextPath }/book/deletebook.action?bid="+bid;
	}
	function cdstatus(bid){
		location.href = "${pageContext.request.contextPath }/book/cbstatus.action?bid="+bid;
	}
  </script>
  <body>
	<input type="checkbox" id="checkbox" />编辑或删除<br/><br/>
	
	<div id="center" style="display: block;">
		<font size="4"><b>${bookbybid.bname }</b></font><br/><br/>
		<div class="imgdiv" style="float: left;">
			<img src="book_img/${bookbybid.image_b }" align="top"/>
		</div>
		<div class="textdiv" style="float: left;width: 50%;">
			商品编号:${bookbybid.bid }<br/><br/>
			
			当前价:${bookbybid.currPrice }<br/><br/>
			
			
			定价:${bookbybid.price }
			折扣:${bookbybid.discount }折
			作者:${bookbybid.author }<br/><br/>
			出版社:${bookbybid.press }<br/><br/>
			出版时间:${bookbybid.publishtime }<br/><br/>
			版次:${bookbybid.edition }
			页数:${bookbybid.pageNum }
			字数:${bookbybid.wordNum }<br/><br/>
			印刷时间:${bookbybid.printtime }
			开本:${bookbybid.booksize }
			纸 张:${bookbybid.paper }<br/><br/>	
		</div>
	</div>
	
	
	
	
	<div style="display: none;" id="right">
		<form id="myform" action="${pageContext.request.contextPath }/book/updatebook.action" method="post" onsubmit="return check();">
		<div class="imgdiv" style="float: left;">
			<img src="book_img/${bookbybid.image_w }"  align="top"/>
		</div>
		<div class="textdiv" style="float: left;width: 50%;">
			商品编号:<input type="text" name="bid" value="${bookbybid.bid }" style="width: 300px;" readonly="readonly"/><br/><br/>
			书名:&nbsp;&nbsp;<input id="bname" onblur="checkBname()" type="text" name="bname" value="${bookbybid.bname }" style="width: 300px;"/><br/><br/>
			当前价:<input id="currprice" type="text" name="currPrice" value="${bookbybid.currPrice }" style="width: 50px;" readonly="readonly"/><br/><br/>
			定价:&nbsp;&nbsp;<input id="price" onblur="checkPrice()" type="text" name="price" value="${bookbybid.price }" style="width: 50px;"/>
			折扣:&nbsp;&nbsp;<input id="discount" onblur="checkDiscount()" type="text" name="discount" value="${bookbybid.discount }" style="width: 50px;"/>折
			作者:&nbsp;&nbsp;<input id="author" onblur="checkAuthor()" type="text" name="author" value="${bookbybid.author }" style="width: 100px;"/><br/><br/>
			出版社:&nbsp;&nbsp;<input id="press" onblur="checkPress()" type="text" name="press" value="${bookbybid.press }" style="width: 100px;"/><br/><br/>
			出版时间:<input id="publishtime"  type="text" name="publishtime" value="${bookbybid.publishtime }" class="laydate-icon" onclick="laydate()" style="width: 100px;"/><br/><br/>
			版次:&nbsp;&nbsp;&nbsp;&nbsp;<input id="edition" onblur="checkEdition()" type="text" name="edition" value="${bookbybid.edition }" style="width: 100px;"/>
			页数:<input id="pagenum" onblur="checkPagenum()" type="text" name="pageNum" value="${bookbybid.pageNum }" style="width: 100px;"/>
			字数:<input id="wordnum" onblur="checkWordnum()" type="text" name="wordNum" value="${bookbybid.wordNum }" style="width: 100px;"/><br/><br/>
			印刷时间:<input id="printtime"  type="text" name="printtime" value="${bookbybid.printtime }" class="laydate-icon" onclick="laydate()" style="width: 100px;"/>
			开本:<input id="booksize" onblur="checkBooksize()" type="text" name="booksize" value="${bookbybid.booksize }" style="width: 100px;"/>
			纸 张:<input id="paper" onblur="checkPaper()" type="text" name="paper" value="${bookbybid.paper }" style="width: 100px;"/><br/><br/>
			一级分类：<select id="father">
						<option>${bca }</option>
						<c:forEach var="ca" items="${categorys}">
							<c:if test="${ca.pid == null}">
								<option value="${ca.cid }">${ca.cname }</option>
							</c:if>
						</c:forEach>
					</select>
			二级分类：<select id="son" name="cid">
	    					<option value="${bookbybid.cid }">${bcb }</option>
	    			</select><br/><br/>
			<input id="update" class="updatediv" type="submit" value="&nbsp;编&nbsp;&nbsp;&nbsp;辑&nbsp;"/>
			<input id="detele" class="deletediv" type="button" value="&nbsp;删&nbsp;&nbsp;&nbsp;除&nbsp;" onclick="deleteBook('${bookbybid.bid }')"/>
			<input id="detele" class="deletediv" type="button" value="&nbsp;下&nbsp;&nbsp;&nbsp;架&nbsp;" onclick="cdstatus('${bookbybid.bid}')"/>		
		
		</div>
  		</form>
	</div>
  </body>
</html>
