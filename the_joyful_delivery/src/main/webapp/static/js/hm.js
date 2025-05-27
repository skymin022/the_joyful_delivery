/**
 *  로그인
 * 	회원가입
 *  로그인 후 목록 확인
 */
// 현재 페이지의 파일명 구하기
const currentPage = window.location.pathname;

if (currentPage.includes("sign_up.jsp") || currentPage.includes("login_list_update.jsp")) {
    const Userform = {

        // 회원가입 유효성 검사
        validateSignUpForm: function () {
            const id = document.getElementById("id");
            const password = document.getElementById("password");
            const passwordCheck = document.getElementById("passwordcheck");
            const phone = document.getElementById("p_number");
            const code = document.getElementById("check_number");
            const name = document.getElementById("name");
            const email1 = document.getElementById("email1");
            const email2 = document.getElementById("email2");
            const address = document.getElementById("address");
            const birth = document.getElementById("birth");

            // 정규식
            const idRegex = /^[가-힣a-zA-Z0-9]+$/;
            const pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;
            const phoneRegex = /^\d{11}$/;
            const nameRegex = /^[가-힣a-zA-Z]+$/;
            const emailRegex = /^[a-zA-Z0-9._%+-]+$/;
            const birthRegex = /^\d{8}$/;

            const fields = [
                { el: id, name: "아이디" },
                { el: password, name: "비밀번호" },
                { el: passwordCheck, name: "비밀번호 확인" },
                { el: phone, name: "연락처" },
                { el: code, name: "인증번호" },
                { el: name, name: "이름" },
                { el: email1, name: "이메일 아이디" },
                { el: email2, name: "이메일 도메인" },
                { el: address, name: "주소" },
                { el: birth, name: "생년월일" }
            ];

            for (let field of fields) {
                if (!field.el.value.trim()) {
                    alert(`${field.name}를 입력해주세요.`);
                    field.el.focus();
                    return false;
                }
            }

            if (!idRegex.test(id.value)) {
                alert("아이디는 한글, 영어, 숫자만 입력 가능합니다.");
                id.focus();
                return false;
            }

            if (!window.sign_up || !window.sign_up.idChecked) {
                alert("아이디 중복 확인을 해주세요.");
                id.focus();
                return false;
            }

            if (!pwRegex.test(password.value)) {
                alert("비밀번호는 특수문자, 영문, 숫자를 포함해 8자 이상이어야 합니다.");
                password.focus();
                return false;
            }

            if (password.value !== passwordCheck.value) {
                alert("비밀번호가 일치하지 않습니다.");
                passwordCheck.focus();
                return false;
            }

            if (!phoneRegex.test(phone.value)) {
                alert("연락처는 숫자만 포함하여 11자리를 입력해주세요.");
                phone.focus();
                return false;
            }

            if (!nameRegex.test(name.value)) {
                alert("이름은 한글 또는 영어만 입력 가능합니다.");
                name.focus();
                return false;
            }

            if (!emailRegex.test(email1.value) || !emailRegex.test(email2.value)) {
                alert("이메일은 영문, 숫자, 일부 특수문자(., _, %, +, -)만 입력 가능합니다.");
                email1.focus();
                return false;
            }

            if (!birthRegex.test(birth.value)) {
                alert("생년월일은 숫자 8자리로 입력해주세요. (예: 19990101)");
                birth.focus();
                return false;
            }

            return true;
        },

		// 회원정보 수정 유효성 검사
		validateUpdateForm: function () {
		    const password = document.getElementById("password");
		    const passwordCheck = document.getElementById("passwordcheck");
		    const phone = document.getElementById("p_number");
		    const email1 = document.getElementById("email1");
		    const email2 = document.getElementById("email2");
		    const address = document.getElementById("address");

		    const pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;
		    const phoneRegex = /^\d{11}$/;
		    const emailRegex = /^[a-zA-Z0-9._%+-]+$/;

		    const fields = [
		        { el: password, name: "비밀번호" },
		        { el: passwordCheck, name: "비밀번호 확인" },
		        { el: phone, name: "연락처" },
		        { el: email1, name: "이메일 아이디" },
		        { el: email2, name: "이메일 도메인" },
		        { el: address, name: "주소" }
		    ];

		    for (let field of fields) {
		        if (!field.el.value.trim()) {
		            alert(`${field.name}를 입력해주세요.`);
		            field.el.focus();
		            return false;
		        }
		    }

		    if (!pwRegex.test(password.value)) {
		        alert("비밀번호는 특수문자, 영문, 숫자를 포함해 8자 이상이어야 합니다.");
		        password.focus();
		        return false;
		    }

		    if (password.value !== passwordCheck.value) {
		        alert("비밀번호가 일치하지 않습니다.");
		        passwordCheck.focus();
		        return false;
		    }

		    if (!phoneRegex.test(phone.value)) {
		        alert("연락처는 숫자만 포함하여 11자리를 입력해주세요.");
		        phone.focus();
		        return false;
		    }

		    if (!emailRegex.test(email1.value) || !emailRegex.test(email2.value)) {
		        alert("이메일은 영문, 숫자, 일부 특수문자(., _, %, +, -)만 입력 가능합니다.");
		        email1.focus();
		        return false;
		    }

		    return true;
		}


    };
}


	



// 로그아웃 확인창
function confirmLogout() {
    if (confirm("로그아웃 하시겠습니까?")) {
        location.href = "/the_joyful_delivery/users/logout";
    }
}

document.addEventListener("DOMContentLoaded", function () {
	
	


	// 로그인 페이지
    const id_input = document.getElementById("id");
    const password_input = document.getElementById("password");
    const remember_id = document.getElementById("rememberId");
    const autologin = document.getElementById("autologin");

    // 쿠키 를 가져옴(특정 쿠키)
    const getCookie = (name) => {
        const value = document.cookie.match('(^|;)\\s*' + name + '\\s*=\\s*([^;]+)');
        return value ? value.pop() : '';
    };

    const save_id = getCookie("save_id");
    if (save_id) {
        id_input.value = save_id;
        remember_id.checked = true;
    }
    if (getCookie("autologin") === "true") {
        autologin.checked = true;
    }
    const l_form = document.getElementById("form");
    if (l_form) {
        l_form.addEventListener("submit", function (e) {
            e.preventDefault();

            if (id_input.value === "") {
                alert("아이디를 입력해주세요");
                id_input.focus();
                return;
            }
            if (id_input.value.length < 5 || id_input.value.length > 20) {
                alert('아이디는 5~20자 이내로 입력 가능합니다.');
                id_input.select();
                return false;
            }
            if (password_input.value === "") {
                alert("비밀번호를 입력해주세요");
                password_input.focus();
                return;
            }
            if (password_input.value.length < 6) {
                alert("비밀번호는 6자 이상으로 입력해야 합니다.");
                password_input.focus();
                return false;
            }
			// ckeckbox - 아이디 저장, 자동로그인(쿠키 활용)
            if (remember_id.checked) {
                document.cookie = `save_id=${id_input.value}; path=/`;
            } else {
                document.cookie = `save_id=; path=/; max-age=0`;
            }
            if (autologin.checked) {
                document.cookie = `autologin=true; path=/`;
            } else {
                document.cookie = `autologin=; path=/; max-age=0`;
            }
            l_form.submit();
        });
    }

	// 아이디 중복 클릭 시 
	const btnCheckId = document.getElementById("btnCheckId");
	if (btnCheckId) {
	    btnCheckId.addEventListener("click", checkDuplicateId);
	}
	// 아이디 중복 검사 
	// 선언적 함수 정의
	function checkDuplicateId() {
	    const userId = document.getElementById("id").value.trim();
	    const idRegex = /^[가-힣a-zA-Z0-9]+$/;
	    const messageElement = document.getElementById("idCheckMessage");

	    if (userId === "") {
	        alert("아이디를 입력해주세요.");
	        return;
	    }
	    if (!idRegex.test(userId)) {
	        alert("아이디는 한글, 영문, 숫자만 입력 가능합니다.");
	        return;
	    }

	    fetch(`${root}/users/checkId?id=${encodeURIComponent(userId)}`)
	        .then(response => response.json())
	        .then(data => {
	            if (data.exists) {
	                messageElement.style.color = "red";
	                messageElement.textContent = "이미 사용 중인 아이디입니다.";
	                sign_up.idChecked = false;
	            } else {
	                messageElement.style.color = "green";
	                messageElement.textContent = "사용 가능한 아이디입니다.";
	                sign_up.idChecked = true;
	            }
	        })
	        .catch(error => {
	            messageElement.style.color = "red";
	            messageElement.textContent = "오류 발생: " + error.message;
	            sign_up.idChecked = false;
	        });
	}


    // 회원가입 페이지 --------------------------------------------------------------------------------------------
    
	// 폼 제출전 자바스크립트 유효성 검사를 실행, 폼 전송 여부 결정 
	// 페이지 경로가 '/signup'인 경우에만 실행
	if (window.location.pathname === '/signup') {
	    const signUpForm = document.forms["sign_up"];
	    if (signUpForm) {
	        signUpForm.onsubmit = function () {
	            return Userform.validateSignUpForm();
	        };
	    } else {
	        console.log('sign_up 폼을 찾을 수 없습니다.');
	    }
	}

	// 비밀번호 확인 - 일치 여부 판단
	const password = document.getElementById("password");
	const passwordCheck = document.getElementById("passwordcheck");
	const pwCheckMessage = document.getElementById("pwCheckMessage");

	if (password && passwordCheck && pwCheckMessage) {
	    function checkPasswordMatch() {
	        if (!password.value || !passwordCheck.value) {
	            pwCheckMessage.textContent = "";
	            pwCheckMessage.className = "check-message";
	            return;
	        }

	        if (password.value === passwordCheck.value) {
	            pwCheckMessage.textContent = "✔";
	            pwCheckMessage.className = "check-message success";
	        } else {
	            pwCheckMessage.textContent = "❌";
	            pwCheckMessage.className = "check-message error";
	        }
	    }

	    password.addEventListener("input", checkPasswordMatch);
	    passwordCheck.addEventListener("input", checkPasswordMatch);
	}


		// 인증번호 확인
		const inputPhone = document.getElementById("p_number");
		const btnPhone = document.getElementById("btnPhone");
		const inputCerti = document.getElementById("check_number");

		if (inputPhone && btnPhone && inputCerti) {
		    let certiCheck = false;
		    let certiNum = null;

		    // 초기 버튼 상태 비활성화
		    btnPhone.disabled = inputPhone.value.length < 10;

		    // 연락처 입력 10자리 이상일 때 버튼 활성화
		    inputPhone.addEventListener("keyup", function () {
		        btnPhone.disabled = this.value.length < 10;
		    });

		    // 인증번호 발급
		    btnPhone.addEventListener("click", function () {
		        if (btnPhone.disabled) return; // 버튼 비활성 시 동작하지 않도록 안전장치

		        certiNum = Math.floor(100000 + Math.random() * 900000); // 6자리 숫자
		        alert("임시 인증번호: " + certiNum);
		        inputCerti.classList.add("on");

		        // 기존 이벤트 제거 후 다시 등록 (중복 방지)
		        inputCerti.removeEventListener("change", checkCerti);
		        inputCerti.addEventListener("change", checkCerti);
		    });

		    // 인증번호 확인 함수
		    function checkCerti() {
		        if (inputCerti.value == certiNum) {
		            alert("인증되었습니다.");
		            certiCheck = true;
		        } else {
		            alert("인증번호가 다릅니다.");
		            certiCheck = false;
		        }
		        console.log("인증 여부:", certiCheck);
		    }

		    // 인증번호 입력 시 포커스되면 값 초기화
		    inputCerti.addEventListener("focus", function () {
		        this.value = "";
		    });
		}



    // 로그인 후 목록 확인 ----------------------------------------------------------------------------------
	
	// 마이페이지 ----------------------------------------------------------------
	// 탭 클릭 이벤트
	document.querySelectorAll('.tab').forEach(tab => {
	    tab.addEventListener('click', function() {
	        document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
	        this.classList.add('active');

	        if (this.classList.contains('part2')) {
	            // 회원정보수정 탭 클릭 시 이동
	            window.location.href = '/the_joyful_delivery/page/login/login_list_update.jsp';
	        } else {
	            // 배송상태 탭은 기존 동작 유지
	            document.querySelector('.table-and-detail').className = 'table-and-detail part1';
	        }
	    });
	});


	// 행 클릭 이벤트
	document.querySelectorAll('.row-box').forEach(row => {
	    row.addEventListener('click', function() {
	        const idx = this.querySelector('input[name="idx"]').value;
	        const card = this.querySelector('input[name="pCard"]').value;
	        const amount = this.querySelector('input[name="pAmount"]').value;
	        const date = this.querySelector('input[name="pDate"]').value;

	        document.getElementById('payment-idx').value = idx;
	        document.getElementById('payment-card').value = card;
	        document.getElementById('payment-amount').value = amount;
	        document.getElementById('payment-date').value = date;
	    });
	});

	// 최초에 첫 행을 상세정보에 출력
	const firstRow = document.querySelector('.row-box');
	if (firstRow) {
	    const idx = firstRow.querySelector('input[name="idx"]').value;
	    const card = firstRow.querySelector('input[name="pCard"]').value;
	    const amount = firstRow.querySelector('input[name="pAmount"]').value;
	    const date = firstRow.querySelector('input[name="pDate"]').value;

	    document.getElementById('payment-idx').value = idx;
	    document.getElementById('payment-card').value = card;
	    document.getElementById('payment-amount').value = amount;
	    document.getElementById('payment-date').value = date;
	}





		  
		  
		  
	});
