<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/user/login.css'/>">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script src="<c:url value='/js/common.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jsps/js/user/login.js'/>"></script>
	<script type="text/javascript">
	function hyz()
	{
		$("#vCode").attr("src","/bookSystem/Verify?a="+new Date().getTime());
	}
	function checkUser() {
	var reg = /^[0-9A-Za-z]{1,}$/;
	var value = $("#loginname").val();
	if (!reg.test(value)) {
		$("#userDiv")
				.html(
						"<font color='red' size='2'>*用户名不能为空，且不包含非法字符</font>");
		return false;
	} else {
		$("#userDiv").html("");
		return true;
	}
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

	if (checkPwd() & checkUser()&checkVcode()) {
		return true;
	}
	return false;
}

$(
		    //判断输入的用户名是否合法
			function()
			{
				$("#loginname").blur(function()
				{
					checkUser();
				}
				);
				//判断密码是否为空 
				$("#loginpass").blur(function()
				{
					checkPwd();
				});
				$("#verifyCode").blur(function()
				{
					checkVcode();
				});
			 }
		);
	</script>
  </head>
  
  <body>
	<div class="main">
	  <div>
	    <div class="imageDiv"><img class="img" src="<c:url value='/images/zj.png'/>"/></div>
        <div class="login1">
	      <div class="login2">
            <div class="loginTopDiv">
              <span class="loginTop">网博会员登录</span>
              <span>
                <a href="<c:url value='/jsps/user/regist.jsp'/>" class="registBtn"></a>
              </span>
            </div>
            <div>
              <form target="_top" action="${pageContext.request.contextPath }/user/userlogin.action" method="post" id="loginForm" onsubmit="return checkForm()">
                <input type="hidden" name="method" value="" />
                  <table>
                    <tr>
                      <td width="50">用户名</td>
                      <td><input class="input" type="text" name="loginname" id="loginname"/></td>
                    </tr>
                    <tr>
                      <td height="20">&nbsp;</td>
                      <td><div id="userDiv"></div></td>
                    </tr>
                    <tr>
                      <td>密　码</td>
                      <td><input class="input" type="password" name="loginpass" id="loginpass"/></td>
                    </tr>
                    <tr>
                      <td height="20">&nbsp;</td>
                      <td><div id="pwdDiv"></div></td>
                    </tr>
                    <tr>
                      <td>验证码</td>
                      <td>
                        <input class="input yzm" type="text" name="verifyCode" id="verifyCode" value=""/>
                        <img id="vCode" src="${pageContext.request.contextPath}/Verify"/>
                      </td>
                      <td><a id="verifyCode" href="javascript:hyz();">换张图</a></td>
                    </tr>
                    <tr>
                      <td height="20px">&nbsp;</td>
                      <td><div id="codDiv"></div></td>
                    </tr>
                     <tr>
                      <td height="20">&nbsp;</td>
                      <td><font color="red">${vcodeerror}</font></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td align="left">
                        <input type="image" id="submit" src="<c:url value='/images/login1.jpg'/>" class="loginBtn"/>
                      </td>
                      <td>
                      <a href="${pageContext.request.contextPath }/user/goregist.action">没有帐号？直接注册</a><br/>
                      <a href="${pageContext.request.contextPath }/main/ifram.action">直接访问</a>
                      </td>
                    </tr>																				
                 </table>
              </form>
            </div>
          </div>
        </div>
      </div>
	</div>
  </body>
</html>
	