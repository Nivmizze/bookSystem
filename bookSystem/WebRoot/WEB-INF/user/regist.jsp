<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>注册页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/user/regist.css'/>">

	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jsps/js/user/regist.js'/>"></script>
	<script type="text/javascript">
	function hyz()
	{
		$("#vCode").attr("src","/bookSystem/Verify?a="+new Date().getTime());
	}
	function checkname() {
    var loginname =  document.getElementById("loginname").value;
    var usernamesignupError = document.getElementById("loginnameError1");
    var flag = false;
    $.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/user/ajaxusername.action",
		async : false,
		data : "loginname=" + loginname,
		dataType : "text",
		success : function(a) {
			if (a == 2) {
				usernamesignupError.innerHTML = "<font color = 'red'>用户名已经存在</font>";
			} else {
				usernamesignupError.innerHTML = "<font color = 'lightblue'>用户名可注册</font>";
				flag = true;
			}
		}
	});
	return flag;
} 
	</script>
  </head>
  
  <body>
<div id="divMain">
  <div id="divTitle">
    <span id="spanTitle">新用户注册</span>
  </div>
  <div id="divBody">
    <form action="${pageContext.request.contextPath }/user/userregist.action" method="post" id="registForm">
	<input type="hidden" name="method" value="regist"/>  
    <table id="tableForm">
     <tr>
        <td class="tdText">会员号：</td>
        <td class="tdInput">
          <input class="inputClass" type="text" name="uid" id="uid" value="${uid}" readonly style="background-color: lightblue;text-align: center;font-size: 20;"/>
        </td>
        <td class="tdError">
          <label class="errorClass" id="loginuidError"></label>
        </td>
      </tr>
      <tr>
        <td class="tdText">用户名：</td>
        <td class="tdInput">
          <input class="inputClass" type="text" name="loginname" id="loginname" onblur="checkname()"/>
        </td>
        <td class="tdError">
          <label class="errorClass" id="loginnameError">${errors.loginname }</label>
          <label class="errorClass1" id="loginnameError1"></label>
        </td>
      </tr>
      <tr>
        <td class="tdText">登录密码：</td>
        <td>
          <input class="inputClass" type="password" name="loginpass" id="loginpass""/>
        </td>
        <td>
          <label class="errorClass" id="loginpassError">${errors.loginpass }</label>
        </td>
      </tr>
      <tr>
        <td class="tdText">确认密码：</td>
        <td>
          <input class="inputClass" type="password" name="reloginpass" id="reloginpass" "/>
        </td>
        <td>
          <label class="errorClass" id="reloginpassError">${errors.reloginpass}</label>
        </td>
      </tr>
      <tr>
        <td class="tdText">Email：</td>
        <td>
          <input class="inputClass" type="text" name="email" id="email" "/>
        </td>
        <td>
          <label class="errorClass" id="emailError">${errors.email}</label>
        </td>
      </tr>
      <tr>
        <td class="tdText">验证码：</td>
        <td>
          <input class="inputClass" type="text" name="verifyCode" id="verifyCode" "/>
        </td>
        <td>
          <label class="errorClass" id="verifyCodeError">${errors.verifyCode}</label>
        </td>
      </tr><!--
      <tr>
        <td class="tdText">成功：</td>
        <td>
          <input class="inputClass" type="text" name="verifyCode" id="verifyCode" value="${form.verifyCode }"/>
        </td>
        <td>
          <label class="errorClass" id="verifyCodeError">${errors.verifyCode}</label>
        </td>
      </tr>
      --><tr>
        <td></td>
        <td>
          <div id="divVerifyCode"><img id="vCode" src="${pageContext.request.contextPath}/Verify"/></div>
        </td>
        <td>
          <label><a href="javascript:hyz()">换一张</a></label>
        </td>
      </tr>
      <tr>
        <td></td>
        <td>
          <input type="image" src="<c:url value='/images/regist1.jpg'/>" id="submitBtn"/>
        </td>
        <td>
          <label></label>
        </td>
      </tr>
    </table>
</form>    
  </div>
</div>
  </body>
</html>
