<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	<link rel="stylesheet" type="text/css" href="css/searchbook/showallbook.css">
	<!--<script type="text/javascript" src="jquery/jquery-1.5.1.js"></script>
	--><script type="text/javascript">
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
	 function uptop() {
	 
		window.location.href="${pageContext.request.contextPath}/searchbook/showbookbycid.action?pageNum="+'${curPage-1}'+"&cid="+'${cid}';
	}
	//下一页跳转
	 function upnext() {
	 
		window.location.href="${pageContext.request.contextPath}/searchbook/showbookbycid.action?pageNum="+'${curPage+1}'+"&cid="+'${cid}';
	}
     //确定按钮跳转页面
     function goPage() {
     var page = document.getElementById("page").value;
     window.location.href ="${pageContext.request.contextPath}/searchbook/showbookbycid.action?pageNum="+page+"&cid="+'${cid}';
		
	}
	
	</script>

  </head>
  
  <body>
  	<div class="show" style="width: 100%;height: 100%;margin-bottom: 240px;">
  		<!-- 展示书本信息的div -->
  		<c:choose>
  		<c:when test="${not empty bookbycid}">
  		<c:forEach var="bk" items="${bookbycid}">
         <div class="showbooks">
         <img  src="book_img/${bk.image_w}" class="bookimg" onclick ="accuratebook('${bk.bid}')">
         <div class="nowprice">￥${bk.currPrice}</div>
         <div class= "paseprice">￥${bk.price}</div>
         <div class= "discourt">(${bk.discount}折)</div><br/>
         <br/>
         <table>
            <tr>
            	<td>书名:
            		<c:choose>
            			<c:when test="${fn:length(bk.bname) gt 8}">
            				${fn:substring(bk.bname,0,10)}...
            			</c:when>
            			<c:otherwise>
            				${bk.bname}
            			</c:otherwise>
            		</c:choose>	
            	</td>
            </tr>
            <tr>
                <td>作者:${bk.author}</td>
            </tr>
            <tr>
            <td>出版社:${bk.press }</td>
            </tr>
            <tr>
            <td>出版时间:${bk.publishtime}</td>
            </tr>
         </table>
          <%--   <div class="bookname">书名:${bk.bname}</div>
         <div class="editor">出版社:${bk.press }</div>
         <div class="pushtime" style="margin-right:100px;" >出版时间:${bk.publishtime}</div> --%>
	         </div>
	        </c:forEach>
	       </c:when>
	      <c:otherwise>
	      <center><h1>亲！一本书都没有哦！</h1></center>
	     </c:otherwise>
	    </c:choose>
  	</div>
       
      
      
      
   <div class = "henxian">
       <hr style="display: block;height: 1px;background-color:lightblue;width: 100%;"/>
       <p>    
	    <button onclick="goPage()">确定</button>
	    <span>页</span>
	    <input id ="page" type="text" name="page"/>
	   	<span>共${maxPage }页&nbsp;到</span>
	   	<button onclick="upnext()">下一页</button>
	   	<span>${curPage }</span>
	   	<button onclick="uptop()">上一页</button>
       </p>
      <!-- 分页查询的div -->
    </div>
      
  </body>
</html>
