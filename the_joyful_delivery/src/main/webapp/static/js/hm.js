/**
 * 
 */
document.addEventListener("DOMContentLoaded", function() { 
	// 로그인 시 
	const form = document.getElementById("form")
	const id_input = document.getElementById("id")
	const password_input = document.getElementById("password")
	const remember_id = document.getElementById("rememberId")
	const autologin = document.getElementById("autologin")	
	
	// 아이디 저장, 자동 로그인 checkbox 
	// 페이지 로드 시 쿠키 값 적용
	const getCookie = (name) => { 
		const value = document.cookie.match('(^|;)\\s*' + name + '\\s*=\\s*([^;]+)') // 유효성 검사 
		return value ? value.pop() : ''
	}
	
	// 아이디 기억 쿠키가 있으면 입력창에 입력
	const save_id = getCookie("save_id")
	if(save_id) { 
		id_input.value = save_id
		remember_id.checked = true
	}
	
	// 자동 로그인 쿠키가 있으면 자동으로 체크
	if(getCookie("autologin") === "true") { 
		autologin.checked = true
	}
	
	form.addEventListener("submit", function(e) { 
		e.preventDefault() // 폼 제출 중단 
		
		// 아이디 공란 체크
		if(id_input.value === "") {
			alert("아이디를 입력해주세요")
			id_input.focus()
			return
		}
		
		// 비밀번호 공란 체크
		if(password_input.value === "") {
			alert("비밀번호를 입력해주세요");
			password_input.focus();
			return
		}
		
		// 로그인 성공 시 
		// 아이디 저장 
		if ( remember_id.checked ) { 
			document.cookie = `save_id=${id_input.value}; path=/`
		} else { 
			document.cookie = `save_id=; path=/; max-age=0`
		}
		// 자동 로그인
		if ( autologin.checked) { 
			document.cookie = `autologin=true; path=/`
		} else { 
			document.cookie = `autologin=; path=/; max-age=0`
		}
		
		// 서버 제출 
		form.submit() 
	})
})