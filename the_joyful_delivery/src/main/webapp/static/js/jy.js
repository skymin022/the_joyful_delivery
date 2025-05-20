/**
 * 
 */
document.addEventListener("DOMContentLoaded", function() {
	document.querySelector(".search_icon").addEventListener("click", () => {
		const input = document.querySelector(".input_sear")
		if (isNaN(input.value) || input.value.trim() === "") {
			alert("운송장번호(숫자)를 입력해주세요.")
		} else {
			// TODO: 다음 페이지로 넘어가게
			location.href = "/the_joyful_delivery/page/delivery/delivery_status.jsp"
		}
		
	})
})