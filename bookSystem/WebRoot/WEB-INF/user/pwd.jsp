<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>pwd.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/css.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/user/pwd.css'/>">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script src="<c:url value='/js/common.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jsps/js/user/pwd.js'/>"></script>
	<script type="text/javascript">
	function hyz()
	{
		$("#vCode").attr("src","/bookSystem/Verify?a="+new Date().getTime());
	}

function checkPwd() {
	var value = $("#loginpass").val();
	if ("" == value) {
		$("#pwdDiv")
				.html(
						"<font color='red' size='2'>*密码不能为空</font>");
		return false;
	} else {
		$("#pwdDiv").html("");
		return true;
	}
}

function checkPwd1() {
	var value = $("#newpass").val();
	if ("" == value) {
		$("#pwdDiv1")
				.html(
						"<font color='red' size='2'>*密码不能为空</font>");
		return false;
	} else {
		$("#pwdDiv1").html("");
		return true;
	}
}




function checkrePwd(){
     var value = $("#newpass").val();
     var value1 =$("#reloginpass").val();
     if(value != value1){
     $("#repwdDiv").
                 html("<font color='red' size='2'>*密码不一致</font>");
         return false;
     }else{
       $("#repwdDiv").html("");
		return true;
     }
     
}


function checkVcode() {
	var value = $("#verifyCode").val();
	if (value.length != 4) {
		$("#codDiv")
				.html(
						"<font color='red' size='2'>*验证码不规范</font>");
		return false;
	}
	$("#codDiv").html("");
	return true;
}
  function checkForm() {

	if (checkPwd()&checkVcode()) {
		return true;
	}
	return false;
}



$(
		    //判断输入的用户名是否合法
			function()
			{
				//判断密码是否为空 
				$("#loginpass").blur(function()
				{
					checkPwd();
				});
				$("#verifyCode").blur(function()
				{
					checkVcode();
				});
				$("#reloginpass").blur(function()
				{
					checkrePwd();
				});
				$("#newpass").blur(function()
				{
					checkPwd1();
				});
			 }
		);
		
	function checkall(){
	if(checkPwd()&&checkVcode()&&checkrePwd()&&checkPwd1()){
	
	return true;
	}
	return false;
	}
	</script>
	
  </head>
  
  <body>
    <div class="div0">
    	<span>修改密码</span>
    </div>

	<div class="div1">
		<form action="${pageContext.request.contextPath }/user/changepwd.action" method="post" onsubmit="return checkall()">
			<input type="hidden" name="method" value=""/>
		<table>
			<tr>
				<td><label class="error">${msg }</label></td>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td align="right">原密码:</td>
				<td><input class="input" type="password" name="loginpass" id="loginpass" value=""/></td>
				<td><label id="pwdDiv" class="error" >${loginerror}</label></td>
			</tr>
			<tr>
				<td align="right">新密码:</td>
				<td><input class="input" type="password" name="newpass" id="newpass" value=""/></td>
				<td><label id="pwdDiv1" class="error"></label></td>
			</tr>
			<tr>
				<td align="right">确认密码:</td>
				<td><input class="input" type="password" name="reloginpass" id="reloginpass" value=""/></td>
				<td><label id="repwdDiv" class="error">${pwdyizhierror}</label></td>
			</tr>
			<tr>
				<td align="right"></td>
				<td>
				  <img id="vCode" src="${pageContext.request.contextPath}/Verify" border="1"/>
		    	  <a href="javascript:hyz();">看不清，换一张</a>
				</td>
			</tr>
			<tr>
				<td align="right">验证码:</td>
				<td>
				  <input class="input" type="text" name="verifyCode" id="verifyCode" value=""/>
				</td>
				<td><font color="red">${vcodeerror1}</font></td>
			</tr>
			<tr>
				<td align="right"></td>
				<td><input id="submit" type="submit" value="修改密码"/></td>
			</tr>
		</table>
		</form>
	</div>
  </body>
</html>
