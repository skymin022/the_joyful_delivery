/**
 *
 */
document.addEventListener("DOMContentLoaded", function() {

	// 운송장 번호 유효성 검사
	const icon = document.querySelector(".search_icon")
	if(icon) {
		icon.addEventListener("click", (e) => {
			e.preventDefault()	
			const input = document.querySelector(".input_sear.d")
			if(input) {
				if (isNaN(input.value) || input.value.trim() === "") {
					alert("운송장번호(숫자)를 입력해주세요.")
					return false;
				} else {
					document.getElementById("form").submit()
				}
			}
		});
	}

	// 물품가액 유효성 검사
	const btns = document.querySelectorAll(".values button")
	const input_val = document.getElementById("value")
	if(btns && input_val) {

		// 버튼으로 99만원 못 넘기게
		btns.forEach(e => {
			e.addEventListener("click", () => {
				let result = Number(value.value) + Number(e.innerText.replace("만원", ""))
				if(result > 99) {
					alert("물품 가액은 99만원을 초과할 수 없습니다.")
					return false;
				}
				input_val.value = result;
			});
		});

		// 키보드로 99만원 못 넘기게
		let prevValue = ''
		input_val.addEventListener("keyup", function() {
			this.value = this.value.replace(/\s+/g, '') // 공백 방지
			if(this.value > 99) {
				alert("물품 가액은 99만원을 초과할 수 없습니다.")
				this.value = prevValue
			} else {
				prevValue = this.value
			}
		})
	}

	// 물품가액 버튼 on/off
	const select = document.getElementById("keyword")
	if(select) {
		select.addEventListener("change", function() {
			if(this.value !== "품목 선택") {
				btns.forEach(e => {
					e.classList.add("on")
				})
			}
		});
	}

	// delivery_rec1 다음 버튼 검사
	const nextBtn = document.getElementById("next_btn")
	if(nextBtn) {
		nextBtn.addEventListener("click", function(e) {
			e.preventDefault()
			if(select.value === "품목 선택") {
				alert("품목을 선택해주세요.")
				select.focus()
				return false;
			}
			if(input_val.value === "") {
				alert("물품가액을 입력해주세요.")
				input_val.focus()
				return false;
			}
			if(document.getElementById("reserv").value === "") {
				alert("예약명을 입력해주세요.")
				document.getElementById("reserv").focus()
				return false;
			}
			document.getElementById("form").submit()
		});
	}

	// delivery_rec2 다음 버튼 검사
	const nextBtn2 = document.getElementById("next_btn2")
	if(nextBtn2) {
		nextBtn2.addEventListener("click", function(e) {
			e.preventDefault()
			if(document.getElementById("s_name").value === '') {
				alert("이름을 입력해주세요.")
				document.getElementById("s_name").focus()
				return;
			}
			if(!certiCheck) {
				alert("휴대폰번호 인증을 진행해주세요.")
				document.getElementById("s_phone").focus()
				return false;
			}
			if(document.getElementById("s_address").value === '') {
				alert("주소를 입력해주세요.")
				document.getElementById("s_address").focus()
				return false;
			}
			if(document.getElementById("s_address2").value === '') {
				alert("상세주소를 입력해주세요.")
				document.getElementById("s_address2").focus()
				return false;
			}
			document.getElementById("form").submit()
		});
	}

	// delivery_rec3 다음 버튼 검사
		const nextBtn3 = document.getElementById("next_btn3")
		if(nextBtn3) {
			nextBtn3.addEventListener("click", function(e) {
				e.preventDefault()
				if(document.getElementById("r_name").value === '') {
					alert("이름을 입력해주세요.")
					document.getElementById("r_name").focus()
					return;
				}
				if(document.getElementById("r_number").value === '') {
					alert("휴대폰번호를 입력해주세요.")
					document.getElementById("r_number").focus()
					return false;
				}
				if(document.getElementById("r_address").value === '') {
					alert("주소를 입력해주세요.")
					document.getElementById("r_address").focus()
					return false;
				}
				if(document.getElementById("r_address2").value === '') {
					alert("상세주소를 입력해주세요.")
					document.getElementById("r_address2").focus()
					return false;
				}
				if(document.getElementById("pre_pos").value === '지불 방법 선택') {
					alert("지불방법을 선택해주세요.")
					document.getElementById("pre_pos").focus()
					return false;
				}
				document.getElementById("form").submit()
			});
		}

	const btnPhone = document.querySelector(".input_list .btn_ph")
	const inputCerti = document.getElementById("certi_num")
	let certiCheck = false

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

	// 이름에서 공백 제거
	const checkTrim = document.querySelector(".check_trim")
	if(checkTrim) {
		checkTrim.addEventListener("keyup", function() {
			this.value = this.value.replace(/[^a-zA-Z가-힣]+/g, '');
		})
	}
}) 

$(function() {
	/* customer_sc 드랍다운 */
	$('.dropdown').on('click', function() {
		$(this).toggleClass('on')
		if($(this).hasClass('on')) {
			$(this).closest('li').next('li.answer').stop().slideDown()
		} else {
			$(this).closest('li').next('li.answer').stop().slideUp()
		}
	})
})