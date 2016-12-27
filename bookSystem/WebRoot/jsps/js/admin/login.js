function checkadminname(){
	var adminname = document.getElementById("adminname").value;
	var adminnamediv = document.getElementById("adminnamediv");
	var reg = /^[A-Za-z0-9]{2,12}$/;
	if(adminname == ""){
		adminnamediv.innerHTML = "<font color='red'>帐号不可为空</font>";
		return false;
	}
	else if(!reg.test(adminname)){
		adminnamediv.innerHTML = "<font color='red'>帐号必须为6-12位字母或数字</font>";
		return false;
	}
	adminnamediv.innerHTML = "<font color='blue'>帐号符合规范</font>";
	return true;
}


function checkadminpwd(){
	var adminpwd = document.getElementById("adminpwd").value;
	var adminpwddiv = document.getElementById("adminpwddiv");
	var reg = /^[A-Za-z0-9]{2,12}$/;
	
	if(adminpwd == ""){
		adminpwddiv.innerHTML = "<font color='red'>密码不可为空</font>";
		return false;
	}
	
	else if(!reg.test(adminpwd)){
		adminpwddiv.innerHTML = "<font color='red'>密码必须为6-12位字母或数字</font>";
		return false;
	}
	
	adminpwddiv.innerHTML = "<font color='blue'>密码符合规范</font>";
	return true;
}

function clearname(){
	var adminnamediv = document.getElementById("adminnamediv");
	adminnamediv.innerHTML = "";
}

function clearpwd(){
	var adminpwddiv = document.getElementById("adminpwddiv");
	adminpwddiv.innerHTML = "";
}

function checkform(){
	if(checkadminname()&checkadminpwd()){
		return true;
	}
	return false;
}