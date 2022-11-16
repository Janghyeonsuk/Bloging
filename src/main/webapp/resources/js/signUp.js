function CheckSignUp() {

	var userID = document.getElementByID("userID");
	var userPassword = document.getElementByID("userPassword");
	
	// 상품아아디 체크
	if (!check(/[a-Z][0-9]{4,11}$/, userID,
		"[아이디] 영문과 숫자를 조합하여 5~12자까지 입력하세요."))
		return false;
	// 상품명 체크
	if (userPassword.value.length < 6 || userPassword.value.length > 12) {
		alert("[비밀번호]\n최소 6자에서 최대 12자까지 입력하세요");
		userPassword.select();
		userPassword.focus();
		return false;
	}
	
	function check(regExp, e, msg) {

		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	
	document.signUpForm.submit();
	
}