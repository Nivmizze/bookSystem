function checkCname(){
	var cname = $("#cname").val();
	if(""==cname){
		//alert("分类名称不可为空！");
		return false;
	}
	return true;
}

function checkPid(){
	var pid = $("#pid").val();
	if(""==pid){
		//alert("一级分类不可为空！");
		return false;
	}
	return true;
}

function checkDes(){
	var des = $("#des").val();
	if(""==des){
		//alert("描述不可为空！");
		return false;
	}
	return true;
}

function check(){
	if(checkCname()&&checkPid()&&checkDes()){
		return true;
	}
	return false;
}