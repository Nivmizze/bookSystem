<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showall.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/book/bookbycid.css">
	<style type="text/css">
		.bookdiv{
			border:1px solid black;
			width: 200px;
			height: 300px;
			float: left;
			margin-left: 30px;
		}
	</style>
	<script type="text/javascript" src="jquery/jquery-1.5.1.js"></script>
	<script type="text/javascript">
      //触摸图片换色
	$(function(){
	  $(".showbooks").css("background", "ivory");
	  $(".showbooks").mouseover(function(){
	     $(".showbooks").css("background", "#BFEFFF");
	  });
	   $(".showbooks").mouseout(function(){
	     $(".showbooks").css("background", "ivory");
	  });
	});
	//点击图片查看图书的详情
	function accuratebook(bid){
	  window.location.href="${pageContext.request.contextPath}/searchbook/showbookbybid.action?bid="+bid;
	
	};
	//上一页跳转
	 function goLast() {
		location.href="${pageContext.request.contextPath}/book/allbookcount.action?page="+'${curPage-1}'+"&bname="+'${bname}'+"&author="+'${author}'+"&press="+'${press}';
	}
	 function goNext() {
	 
		location.href="${pageContext.request.contextPath}/book/allbookcount.action?page="+'${curPage+1}'+"&bname="+'${bname}'+"&author="+'${author}'+"&press="+'${press}';
	}
	
	function goPage() {
		var page = document.getElementById("page").value;
		location.href = "${pageContext.request.contextPath}/book/allbookcount.action?page="+page+"&bname="+'${bname}'+"&author="+'${author}'+"&press="+'${press}';
	}
	
	function findBookByBid(bid)
	{
		location.href = "${pageContext.request.contextPath }/book/showbookbybid.action?bid="+bid;
	}
	</script>

  </head>
  
  <body>
  	<div>
  		<c:forEach var="b" items="${booklist }">
			<div class="bookdiv" onclick="findBookByBid('${b.bid}')">
				<div style="margin-left: 0px;margin-top: 20px;">
					<img src="book_img/${b.image_w }"/>
				</div>
				<div style="margin-left: 10px;">
					<div>
						<b><font color="red">￥${b.currPrice }</font></b> ￥${b.price } 
						<b><font color="red">(${b.discount }折)</font></b>
					</div>
					<div><u>
							<c:choose>
		            			<c:when test="${fn:length(b.bname) gt 8}">
		            				${fn:substring(b.bname,0,10)}...
		            			</c:when>
		            			<c:otherwise>
		            				${b.bname}
		            			</c:otherwise>
		            		</c:choose>	
            		</u></div>
					<div><b><u style="color: #00FFFF;">${b.author }</u></b></div>
					<div>出版社:<b><u style="color: #00FFFF;">${b.press }</u></b></div>
				</div>
			</div>
		</c:forEach>
  	</div>
  	
  	<div class = "henxian">
       <hr style="display: block;height: 1px;background-color:lightblue;width: 100%;"/>
       <p>    
	    <button onclick="goPage()">确定</button>
	    <span>页</span>
	    <input id="page" type="text" name="page" size="4"/>
	   	<span>共${maxPage }页&nbsp;到</span>
	   	<button onclick="goNext()">下一页</button> 
	   	<span>${curPage}</span>
	   	<button onclick="goLast()">上一页</button>
       </p>
      <!-- 分页查询的div -->
    </div>
      
  </body>
</html>
