function checkCname(){
	var cname = $("#cname").val();
	if(""==cname){
		//alert("分类名称不可为空！");
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
	if(checkCname()&&checkDes()){
		return true;
	}
	return false;
}