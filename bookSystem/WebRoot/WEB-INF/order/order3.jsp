<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'order3.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <script type="text/javascript" src="jquery/jquery-1.5.1.js"></script>
  <style type="text/css">
 a{
  text-decoration: none;
 }
  </style>
  <script type="text/javascript">
  function goPage()
  {
    var reg=/^[0-9]{1,4}$/;
	var page = document.getElementById("go").value;
	if(!reg.test(page))
	{
    var page='${curPage}';
    location.href="${pageContext.request.contextPath }/order/showMyOrders.action?page="+page+"&uid=${uid}";
	}else{
	location.href="${pageContext.request.contextPath }/order/showMyOrders.action?page="+page+"&uid=${uid}";
    }
  }
  function get(oid){
  location.href="${pageContext.request.contextPath }/order/complete.action?oid="+oid;
  }
  </script>
  </head>
  
  <body>
  <center>
  <c:choose>
			<c:when test="${not empty loginuser }">
  <table width="95%" height="4%" border="0" cellpadding="0" cellspacing="0">
  <tr style="background: url('images/confirm-2.jpg');" align="center">
  <td>商品信息</td>
  <td>金额</td>
  <td>订单状态</td>
  <td>操作</td>
  </tr>
  <tr>
  <td><br/></td>
  </tr>
  <c:forEach var="o" items="${myorders}">
  <tr style="background-color: #EEE5DE;">
  <td colspan="2">订单编号：${o.oid }</td>
  <td colspan="2">下单时间：${o.ordertime }</td>
  </tr>
  
  <tr align="center" valign="middle">
  <td align="left">
  <c:forEach var="i" items="${items}">
  <c:if test="${o.oid==i.oid}"><!--
  <img src="/images/${i.image_b }" width="100px" height="100px"/>
  -->
  <a href="${pageContext.request.contextPath }/searchbook/showbookbybid.action?bid=${i.bid}"><img src="book_img/${i.image_b }" width="100px" height="100px"/></a>
  </c:if>
  </c:forEach>
  </td>
  <td>${o.total }</td>
  
  <c:if test="${o.status==0}">
  <td>未付款</td>
  <td>
  <div class="look"><a href="${pageContext.request.contextPath }/orderitem/orderinfo.action?oid=${o.oid}">查看</a></div>
  <div class="pay"><a href="${pageContext.request.contextPath }/order/gopay.action?oid=${o.oid}">支付</a></div>
  <div class="cancel"><a href="${pageContext.request.contextPath }/order/cancel.action?oid=${o.oid}">取消</a></div>
  </td>
  </c:if>
  
  <c:if test="${o.status==1}">
  <td>已付款</td>
  <td>
  <div class="look"><a href="${pageContext.request.contextPath }/orderitem/orderinfo.action?oid=${o.oid}">查看</a></div>
  <div class="cancel"><a href="${pageContext.request.contextPath }/order/cancel.action?oid=${o.oid}">取消</a></div> 
  </td>
  </c:if>
  
  <c:if test="${o.status==2}">
  <td>已发货</td>
  <td>
  <div class="look"><a href="${pageContext.request.contextPath }/orderitem/orderinfo.action?oid=${o.oid}">查看</a></div>
  <div class="get"><a href="javascript:get('${o.oid}')">确认收货</a></div>
  </td>
  </c:if>
  
   <c:if test="${o.status==3}">
  <td>交易成功</td>
  <td>
  <div class="look"><a href="${pageContext.request.contextPath }/orderitem/orderinfo.action?oid=${o.oid}">查看</a></div>
  </td>
  </c:if>
  
   <c:if test="${o.status==4}">
  <td>已取消</td>
  <td>
  <div class="look"><a href="${pageContext.request.contextPath }/orderitem/orderinfo.action?oid=${o.oid}">查看</a></div>
  </td>
  </c:if>
  </tr>
  
  </c:forEach>
  </table>
  <c:if test="${null != sessionScope.loginuser }">
 			 <div>
    			<a href="${pageContext.request.contextPath }/order/showMyOrders.action?page=1&uid=${uid}">首页</a>
    		    <a href="${pageContext.request.contextPath }/order/showMyOrders.action?page=${curPage-1}&uid=${uid}">上一页</a>
    			${curPage }/${maxPage }
    			<a href="${pageContext.request.contextPath }/order/showMyOrders.action?page=${curPage+1}&uid=${uid}">下一页</a>
    			<a href="${pageContext.request.contextPath }/order/showMyOrders.action?page=${maxPage}&uid=${uid}">尾页</a>
    			<input type="text" id="go"/>
    			<input type="button" value="跳转" onclick="goPage()"/>
    		</div>
  </c:if>
  
  </c:when>
			<c:otherwise>
			    还未登录
				<a href="${pageContext.request.contextPath }/user/welcome.action" target="_parent">去登陆</a>
			</c:otherwise>
		</c:choose>
   </center>
  </body>
</html>
