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
  <style type="text/css">
 a{
  text-decoration: none;
 }
  </style>
  <script type="text/javascript">
  function goPage()
  {
	var page = document.getElementById("go").value;
	location.href="${pageContext.request.contextPath }/order/showadOrders.action?page="+page;
  }
   function fahuo(oid){
  location.href="${pageContext.request.contextPath }/order/fahuo.action?oid="+oid;
  }
  </script>
  </head>
  
  <body>
  <center>
  <table width="80%" height="4%" border="0" cellpadding="0" cellspacing="0">
  <tr>
  <td colspan="2">
  <a href="${pageContext.request.contextPath }/order/showadOrders.action?statu=0">未付款&nbsp;</a>|
  <a href="${pageContext.request.contextPath }/order/showadOrders.action?statu=1">已付款&nbsp;</a>|
  <a href="${pageContext.request.contextPath }/order/showadOrders.action?statu=2">已发货&nbsp;</a>|
  <a href="${pageContext.request.contextPath }/order/showadOrders.action?statu=3">交易成功&nbsp;</a>|
  <a href="${pageContext.request.contextPath }/order/showadOrders.action?statu=4">已取消&nbsp;</a>
  </td>
  <td></td>
  <td></td>
  </tr>
  <tr>
  <td><br/></td>
  </tr>
  <tr style="background: url('images/confirm-2.jpg');" align="center">
  <td>商品信息</td>
  <td>金额</td>
  <td>订单状态</td>
  <td>操作</td>
  </tr>
  <tr>
  <td><br/></td>
  </tr>
  <c:forEach var="o" items="${admyorders}">
  <tr style="background-color: #EEE5DE;">
  <td colspan="4">订单编号：${o.oid }&nbsp;&nbsp;下单时间：${o.ordertime }</td>
  </tr>
  <tr align="center" valign="middle">
  <td align="left">
     <c:forEach var="i" items="${aditems}">
         <c:if test="${o.oid==i.oid}">
         <a href="${pageContext.request.contextPath }/book/showbookbybid.action?bid=${i.bid}">
         <img src="book_img/${i.image_b }" width="100px" height="100px"/>
         </a>
       </c:if>
      </c:forEach> 
  </td>
  <td>${o.total }</td>
  <td>
  
  <c:if test="${o.status == 0}">
     未付款
  </c:if>
  <c:if test="${o.status == 1}">
     已付款
  </c:if>
  <c:if test="${o.status == 2}">
     已发货
  </c:if>
  <c:if test="${o.status == 3}">
     交易成功
  </c:if>
  <c:if test="${o.status == 4}">
     已取消
     </c:if>
  
  
  </td>
  <td>
  <c:if test="${o.status == 0}">
  <div id="look"><a href="${pageContext.request.contextPath }/orderitem/adorderinfo.action?oid=${o.oid}">查看</a></div>
  <div id="cancel"><a href="${pageContext.request.contextPath }/order/adcancel.action?oid=${o.oid}">取消</a></div> 
  </c:if>
  <c:if test="${o.status == 1}">
  <div id="look"><a href="${pageContext.request.contextPath }/orderitem/adorderinfo.action?oid=${o.oid}">查看</a></div>
  <a href="javascript:fahuo('${o.oid}');">立即发货</a>
  <!--<input type="button" value="立即发货" onclick="fahuo('${statu}')"/><br/><br/>
  --></c:if>
    <c:if test="${o.status == 2}">
    <div id="look"><a href="${pageContext.request.contextPath }/orderitem/adorderinfo.action?oid=${o.oid}">查看</a></div>
    </c:if>
    <c:if test="${o.status == 3}">
    <div id="look"><a href="${pageContext.request.contextPath }/orderitem/adorderinfo.action?oid=${o.oid}">查看</a></div>
    </c:if>
    <c:if test="${o.status == 4}">
    <div id="look"><a href="${pageContext.request.contextPath }/orderitem/adorderinfo.action?oid=${o.oid}">查看</a></div>
    </c:if>
    
  </td>
  </tr>
  </c:forEach>
  
  
  </table>
            <div>
    			<a href="${pageContext.request.contextPath }/order/showadOrders.action?page=1">首页</a>
    		    <a href="${pageContext.request.contextPath }/order/showadOrders.action?page=${adcurPage-1}">上一页</a>
    			${adcurPage }/${admaxPage }
    			<a href="${pageContext.request.contextPath }/order/showadOrders.action?page=${adcurPage+1}">下一页</a>
    			<a href="${pageContext.request.contextPath }/order/showadOrders.action?page=${admaxPage}">尾页</a>
    			<input type="text" id="go"/>
    			<input type="button" value="跳转" onclick="goPage()"/>
    		</div>
  
  
   </center>
  </body>
</html>
