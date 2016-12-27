<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'left.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/mainframe/left.css'/>">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery/jquery-1.5.1.js"></script>
<script type="text/javascript">
	$(function() {
		$(".divLeft .divFirst:eq(0)").show();
		$(".divLeft div.divFirst").mouseover(
				function() {
					$(this).addClass("current").next("div.divSecond")
							.slideDown(350).siblings("div.divSecond").slideUp(
									"middle");
					$(this).siblings().removeClass("current");
				});
	});
	
	function findBookByCid(cid)
	{
		location.href="${pageContext.request.contextPath }/book/showbookbycid.action?cid="+cid;
	}
</script>

</head>
<body>
	<!-- 左侧导航栏可动态添加 -->
	<div class="divLeft">
		<div class="divTitle">网博网上书城</div>
		<!-- 此处写foreach -->
		<c:forEach var="ca" items="${categorys}">
			<c:if test="${ca.pid == null}">
				<div title="${ca.des }" class="divFirst" onmouseover="style.backgroundColor=' #15B69A'" onmouseout="style.backgroundColor='#15B69A'">${ca.cname }</div>
				<div class="divSecond">
					<c:forEach var="cb" items="${categorys}">
						<c:if test="${ca.cid == cb.pid}">
							<div title="${cb.des}" class="divThird" onmouseover="style.backgroundColor='#15B69A'" onmouseout="style.backgroundColor='#15B69A'" ><a target="adbody" href="${pageContext.request.contextPath }/book/showbookbycid.action?cid=${cb.cid }">${cb.cname}</a></div>

						</c:if>
					</c:forEach>
				</div>
			</c:if>
		</c:forEach>
	</div>



	<!-- <div  class="divSecond">
       此处再次遍历
         <div class="divThird"  onmouseover="style.backgroundColor='lightblue'" onmouseout="style.backgroundColor='skyblue'">123123</div>
       </div> -->


</body>
</html>
