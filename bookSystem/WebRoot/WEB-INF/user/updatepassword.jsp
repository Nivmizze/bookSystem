<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>updatepassword.jsp</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="css/updatepassword/updatepassword.css">
<script type="text/javascript" src="jquery/jquery-1.5.1.js"></script>


<script type="text/javascript">
	//立即修改的样式
	$(function() {
		$("#updatepassword").css("background", "shkyblue");
		$("#updatepassword").mouseover(function() {
			$("#updatepassword").css("background", "cyan");
		});
		$("#updatepassword").mouseout(function() {
			$("#updatepassword").css("background", "skyblue");
		});
		
		//返回前一页的样式
		$("#return").css("background", "skyblue");
		$("#return").mouseover(function() {
			$("#return").css("background", "cyan");
		});
		$("#return").mouseout(function() {
			$("#return").css("background", "skyblue");
		});
	});
	
	//返回前一页
	function onreturn() {
		history.go(-1);
	}
	//换一张验证码
	function hyz() {
		$("#imagCode").attr("src",
				"${pageContext.request.contextPath}/Verify?a=" + new Date().getTime());
	}
	
	//比较原密码和登录密码是否一致
	function checkpwd(){
	  var password = document.getElementById("password").value;
	  var passwordError = document.getElementById("passwordError");
	  if(password =="")
	 {
	   $("#pwdError1").css('color','red').text("密码不能为空！");
		   return false;
	 }else{
	    var flag=false;
		$.ajax({
		  type:"post",
		  url:"${pageContext.request.contextPath}/user/ypwd.action",
		  async:false,//异步
		  data:"pp="+password,
		  dataType:"text",
		  success:function(a){
		    if(a==2)
		{
		  passwordError.innerHTML = "<font color = 'red'>原密码不正确</font>";
		}
		else
		{
		    passwordError.innerHTML = "<font color = 'green'>原密码正确</font>";
		    flag=true;
		}
		}
		});
		return flag;
	 }
	}
	
 //比较新密码和确认密码是否相同
	function checkword() {
		var pwd1 = document.getElementById("newpassword").value;
		var pwd2 = document.getElementById("repassword").value;
		if(pwd1 == "" || pwd2 == "")
		{
		   $("#pwdError1").css('color','red').text("亲！密码不能为空！!");
		   return false;
		}
		else
		{
		if (pwd1 != pwd2) 
		{
			$("#pwdError1").css('color','red').text("两次密码不一致!");
			return false;
			
		} 
		else {
			$("#pwdError1").css('color','green').text("两次密码一致!");
			return true;
		}
		}
	} 
	 function updatePassword() {
	  var value1 = document.getElementById("newpassword").value;
	  var value2 = document.getElementById("repassword").value;
	  if(value1 == value2)
	  {
	    var password = document.getElementById("password").value;
	    var newpassword = document.getElementById("newpassword").value;
	    top.location.href = "${pageContext.request.contextPath}/user/surepassword.action?password="+password+"&loginpass="+newpassword;
	  }
		
	} 
	//在点击修改的时候先比较
	function checkForm() {
		if(checkword()&checkvcode()&checkpwd())
		{
		   updatePassword();
		}
		else
		{
		   
		}
	}
	//验证码比较
	function checkvcode() {
		var verycode = document.getElementById("verycode").value;
		var verycodeError = document.getElementById("verycodeError");
		var flag=false;
		$.ajax({
		  type:"post",
		  url:"${pageContext.request.contextPath}/user/ajaxvcode.action",
		  async:false,
		  data:"vv="+verycode,
		  dataType:"text",
		  success:function(a){
		    if(a==2)
		{
		  verycodeError.innerHTML = "<font color = 'red'>验证码不正确</font>";
		}
		else
		{
		    verycodeError.innerHTML = "<font color = 'green'>验证码正确</font>";
		    flag=true;
		}
		}
		});
		return flag;
	}
</script>
</head>

<body>
	<center>
		<div class="updatepassword">
			<br><br><br>
				<table class="findpassword" style="width: 180px">
					
					<tr>
						<td>原密码:</td>
						<td><input type="password" name="password" id="password" onblur="checkpwd()"></td>
					</tr>
					<tr>
						<td><font color="#AEEEEE">111111</font></td>
						<td><label id ="passwordError" class= "error" ></label><td>
					</tr>
					<tr>
						<td>新密码:</td>
						<td><input id="newpassword" type="password"
							name="newpassword" class="input"></td>

					</tr>
					<tr>
						<td><font color="#AEEEEE">111111</font></td>
					</tr>
					<tr>
						<td>确认密码;</td>
						<td><input id="repassword" class="input" type="password"
							name="repassword" onblur="checkword()"></td>
					</tr>
					<tr>
							<td><font color="#AEEEEE">11111111111</font></td>
						<td >
							<span id="pwdError1" ></span></td>
					</tr>
					<!-- 验证码 -->
					<tr>
						<td colspan="2" align="center"><img id="imagCode"
							src="${pageContext.request.contextPath}/Verify"
							style="width: 70px;HEIGHT:25px;margin-left: 10PX;" />&nbsp;&nbsp;&nbsp;
							<a href="javascript:hyz();">换张图</a></td>
					</tr>
					<tr>
						<td><font color="#AEEEEE">111111</font></td>
					</tr>
					<tr>
						<td>验证码:</td>
						<td><input type="text" onblur="checkvcode()"  style=" width: 100px; height: 30px;" id="verycode"
							name="verycode"></td>
					</tr>
					<tr>
						<td><font color="#AEEEEE">111111</font></td>
						<td> <label id ="verycodeError" class= "error" ></label></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button id="updatepassword" class="updatepass"
								style="background: #aaa;font-size: 23px;padding:10px 15px;color:#fff;border:none;
	      outline:none;border-radius:2px;"
								id="sub" onclick="checkForm()">立即修改</button>
							<button id="return" class="return"
								style="background: #aaa;font-size: 23px;padding:10px 15px;color:#fff;border:none;
	      outline:none;border-radius:2px;"
								onclick="onreturn()">返回</button>
						</td>
					</tr>
					
					
				</table>
				<font color="red" size=
				"5">${sessionScope.pwdError }</font>
				<c:remove var="pwdError" scope="session" />
			
		</div>
	</center>
</body>

</html>
