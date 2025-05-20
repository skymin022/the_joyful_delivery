/**
 * 아이디 유효성 검사 
 */

// 회원가입 정규 표현식으로 유효성 검사
	function checkForm() {
		
		// 아이디 패턴 : 영문자, 한글 시작
		let regExpId = /^[a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]+$/
		
		// 이름 패턴 : 한글
		let regExpName = /^[가-힣]{2,}$/
		
		// 이메일 패턴 [숫자,영문자]@[숫자,영문자].~~.[영문자2~3자리]
		let regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i      
		
		let id = form.id.value
		let name = form.name.value
		let email = form.email.value
		
		// test() : 부합O-true, 부합X-false
		if( !regExpId.test(id) ) {
			alert('아이디를 형식에 맞게 입력해주세요')
			return false
		}
		
		if( !regExpName.test(name) ) {
			alert('이름 형식에 맞게 입력해주세요')
			return false
		}
		if( !regExpEmail.test(email) ) {
			alert('이메일 형식에 맞게 입력해주세요')
			return false
		}
		
		