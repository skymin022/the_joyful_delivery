/**
 *  로그인
 * 	회원가입
 */
document.addEventListener("DOMContentLoaded", function () {
    const id_input = document.getElementById("id");
    const password_input = document.getElementById("password");
    const remember_id = document.getElementById("rememberId");
    const autologin = document.getElementById("autologin");

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

    // 아이디 중복 확인용 전역 변수
    window.idChecked = false;

    // 아이디 중복 확인
    window.checkDuplicateId = function () {
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
		// fetch : 네트워크 요청 
        fetch("<%=root%>/checkId?id=" + encodeURIComponent(userId))
            .then(res => res.json())
            .then(data => {
                if (data.exists) {
                    alert("이미 존재하는 아이디입니다.");
                    window.idChecked = false;
                } else {
                    alert("사용 가능한 아이디입니다.");
                    window.idChecked = true;
                }
            })
            .catch(err => {
                console.error("에러:", err);
                alert("서버 오류가 발생했습니다.");
                window.idChecked = false;
            });
    };

    // 유효성 검사
    window.validateSignUpForm = function () {
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

        const idRegex = /^[가-힣a-zA-Z0-9]+$/;
        const pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;
        const phoneRegex = /^\d{11}$/;
        const nameRegex = /^[가-힣a-zA-Z]+$/;
        const emailRegex = /^[a-zA-Z0-9]+$/;
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

        if (!window.idChecked) {
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
});
