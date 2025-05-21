/**
 *  로그인
 * 	회원가입
 *  로그인 후 목록 확인
 */
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
            if (id_input.value.length < 6 || id_input.value.length > 20) {
                alert('아이디는 6~20자 이내로 입력 가능합니다.');
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

    // window 전역 변수
    // sign_up 페이지에서만 사용가능하도록 제한
    window.sign_up = window.sign_up || {};

    // 아이디 중복 확인용 변수
    sign_up.idChecked = false;

    // 아이디 중복 확인
    sign_up.checkDuplicateId = function () {
        const userId = document.getElementById("id").value.trim();
        const idRegex = /^[가-힣a-zA-Z0-9]+$/;

        if (userId === "") {
            alert("아이디를 입력해주세요.");
            document.getElementById("id").focus();
            return;
        }
        if (!idRegex.test(userId)) {
            alert("아이디는 한글, 영문, 숫자만 입력 가능합니다.");
            document.getElementById("id").focus();
            return;
        }
		// fetch : 네트워크 요청  - 수정 필요
        fetch("<%=root%>/checkId?id=" + encodeURIComponent(userId))
            .then(res => res.json())
            .then(data => {
                if (data.exists) {
                    alert("이미 존재하는 아이디입니다.");
                    sign_up.idChecked = false;
                } else {
                    alert("사용 가능한 아이디입니다.");
                    sign_up.idChecked = true;
                }
            })
            .catch(err => {
                console.error("에러:", err);
                alert("서버 오류가 발생했습니다.");
                sign_up.idChecked = false;
            });
    };
    // sign_up : 전역 페이지 변수
    // 회원가입 페이지 --------------------------------------------------------------------------------------------
    sign_up.validateSignUpForm = function () {
        const id = document.getElementById("id");
        const password = document.getElementById("password");
        const passwordCheck = document.getElementById("passwordcheck");
        const phone = document.getElementById("phone_number1");
        const code = document.getElementById("check_number");
        const name = document.getElementById("name");
        const email1 = document.getElementById("email1");
        const email2 = document.getElementById("email2");
        const address = document.getElementById("address");
        const birth = document.getElementById("birth");

		// 유효성 검사
        const idRegex = /^[가-힣a-zA-Z0-9]+$/;
        const pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;
        const phoneRegex = /^\d{11}$/;
        const nameRegex = /^[가-힣a-zA-Z]+$/;
        const emailRegex = /^[a-zA-Z0-9]+$/;
        const birthRegex = /^\d{8}$/;

		// 각 변수들을 배열에 넣고 이름 표시
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

		// 공란인 경우 경고창 띄우기
        for (let field of fields) {
            if (!field.el.value.trim()) {
                alert(`${field.name}를 입력해주세요.`);
                field.el.focus();
                return false;
            }
        }
		// test 함수로 true / false 반환
        if (!idRegex.test(id.value)) {
            alert("아이디는 한글, 영어, 숫자만 입력 가능합니다.");
            id.focus();
            return false;
        }
        if (!sign_up.idChecked) {
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
            alert("이메일은 영어와 숫자만 입력 가능합니다.");
            email1.focus();
            return false;
        }
        if (!birthRegex.test(birth.value)) {
            alert("생년월일은 숫자 8자리로 입력해주세요. (예: 19990101)");
            birth.focus();
            return false;
        }
        return true;
    };

	// 비밀번호 확인 - 일치 여부 판단
		const password = document.getElementById("password");
		const passwordCheck = document.getElementById("passwordcheck");
		const pwCheckMessage = document.getElementById("pwCheckMessage");

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



	// 인증번호 받기 버튼 활성화 조건
		const inputPhone = document.getElementById("s_number")
		if(inputPhone) {
			inputPhone.addEventListener("keyup", function() {
				if(this.value.length >= 10) {
					btnPhone.classList.add("on")
				} else {
					btnPhone.classList.remove("on")
				}
			});
		}

		// 휴대폰 인증번호 받기
		if(btnPhone) {
			btnPhone.addEventListener("click", function() {
				let certiNum = Math.floor(Math.random() *900000)
				alert("임시 인증번호 : " + certiNum)
				inputCerti.classList.add("on")

				inputCerti.addEventListener("change", function() {
					if(this.value == certiNum) {
						alert("인증되었습니다.")
						certiCheck = true
					} else {
						alert("인증번호가 다릅니다.")
					}
					console.log(certiCheck)
				});
			});
		}

		// 인증번호 input focus 시 값 초기화
		if(inputCerti) {
			inputCerti.addEventListener("focus", function() {
				this.value = ""
			});
		}


        // 로그인 후 목록 확인 ----------------------------------------------------------------------------------
    document.querySelectorAll('.tap .tab').forEach(tab => {
        tab.addEventListener('click', function () {     // 클릭 시
        document.querySelectorAll('.tap .tab').forEach(t => t.classList.remove('active')); // active 부여, 다른 하나 active 제거
        this.classList.add('active');
        });
    });

});
