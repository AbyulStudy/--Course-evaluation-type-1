function valueChecked(){
	if(document.form.custname.value.length === 0){
		alert("이름을 작성해주세요.")
		document.form.custname.focus();
		return false;
	}
	if(document.form.gender.value.length === 0){
		alert("성별을 선택해주세요.")
		document.form.gender.focus();
		return false;
	}
	if(document.form.phone.value.length === 0){
		alert("회원번호를 작성해주세요.")
		document.form.phone.focus();
		return false;
	}
	if(document.form.address.value.length === 0){
		alert("주소을 작성해주세요.")
		document.form.address.focus();
		return false;
	}
	if(document.form.joindate.value.length === 0){
		alert("가입일자를 작성해주세요.")
		document.form.joindate.focus();
		return false;
	}
	if(document.form.grade.value.length === 0){
		alert("등급을 선택해주세요.")
		document.form.grade.focus();
		return false;
	}
	if(document.form.city.value.length === 0){
		alert("도시코드를 작성해주세요.")
		document.form.city.focus();
		return false;
	}
	success();
	document.form.submit();
	return true;	
}

function success(){
	alert("등록이 완료되었습니다.")
}

function modify(){
	alert("수정이 완료되었습니다.")
	document.form.submit();
}

function saleryLocation(){
	location='salery.jsp';
}
function listLocation(){
	location='list.jsp';
}