/**
 * 
 */
document.addEventListener("DOMContentLoaded", function() {
	
	// 운송장 번호 유효성 검사
	const icon = document.querySelector(".search_icon")
	if(icon) {
		icon.addEventListener("click", () => {
			const input = document.querySelector(".input_sear")
			if (isNaN(input.value) || input.value.trim() === "") {
				alert("운송장번호(숫자)를 입력해주세요.")
			} else {
				location.href = "/the_joyful_delivery/page/delivery/delivery_status.jsp"
			}
		});
	}
	
	// 물품가액 유효성 검사
	const btns = document.querySelectorAll(".values button")
	const input_val = document.getElementById("value")
	if(btns && input_val) {
		btns.forEach(e => {
			e.addEventListener("click", () => {
				let result = Number(value.value) + Number(e.innerText.replace("만원", ""))
				if(result > 99) {
					alert("물품 가액은 99만원을 초과할 수 없습니다.")
					return false;
				}  
				input_val.value = result;
			})
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
	
	// 다음으로 버튼 이벤트 막기
	const nextBtn = document.getElementById("next_btn")
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
	})
})