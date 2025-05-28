<%@ include file="/layout/jstl.jsp"%>
<%@ include file="/layout/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>project💻 - ALOHA CLASS🌴</title>
<jsp:include page="/layout/meta.jsp" />
<jsp:include page="/layout/link.jsp" />
<style type="text/css">
body {
	background-color: #fff;
}

.update_modal {
	padding: 20px;
	display: flex;
	flex-direction: column;
	position: relative;
	height: 320px;
}

.update_modal button {
	width: 49%;
	height: 30px;
	border: none;
	border-radius: 5px;
	background-color: var(--sub-color2);
	color: #fff;
}

.update_modal button+button {
	background-color: var(--place-hol);
}

.update_modal ul div+div {
	margin-top: 5px;
}
.update_modal ul input[type="text"] {
	padding-left: 10px;
}

.update_modal .btn_area2 {
	display: block;
	margin-top: auto;
	margin-bottom: 10px;
	text-align: center;
}

.update_modal div {
	display: flex;
	justify-content: space-between;
}
</style>
</head>
<body>
	<%-- [Contents] ######################################################### --%>
	<form id="fetForm" action="<%=root%>/admin/user/update" method="post">
		<div class="update_modal">
			<ul>
				<li><h1 style="margin: auto auto;">정보수정 완료</h1></li>
			</ul>
			<div class="btn_area2">
				<button type="submit" onclick="cancleModal(event)">수정</button>
				<button type="button" id="cancle_modal">취소</button>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		window.addEventListener('message', event => {
		  const data = event.data;
		  const listContainer = document.querySelector(".update_modal ul")
		  listContainer.innerHTML = '';
		  data.forEach(item => {
			const li = document.createElement("li")
			li.innerHTML = 
				'<div><span>유저 번호 : </span>' + 
				'<input name="idx" type="text" value="' + item.idx + '"/></div>' +
				'<div><span>이름 : </span>' + 
				'<input name="username" type="text" value="' + item.username + '"/></div>' +
				'<div><span>아이디 : </span>' + 
				'<input name="id" type="text" value="' + item.id + '"/></div>' +
				'<div><span>이메일 : </span>' + 
				'<input name="email" type="text" value="' + item.email + '"/></div>' +
				'<div><span>전화번호 : </span>' + 
				'<input name="p_number" type="text" value="' + item.pNumber + '"/></div>' +
				'<div><span>주소 : </span>' + 
				'<input name="address" type="text" value="' + item.address + '"/></div>' +
				'<div><span>생년월일 : </span>' + 
				'<input name="birth" type="text" value="' + item.birth + '"/></div>'
		    listContainer.appendChild(li);
		  });
		});
	</script>
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/layout/script.jsp" />
</body>
</html>