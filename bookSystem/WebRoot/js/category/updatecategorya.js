function checkCname(){
	var cname = $("#cname").val();
	if(""==cname){
		//alert("�������Ʋ���Ϊ�գ�");
		return false;
	}
	return true;
}

function checkDes(){
	var des = $("#des").val();
	if(""==des){
		//alert("��������Ϊ�գ�");
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