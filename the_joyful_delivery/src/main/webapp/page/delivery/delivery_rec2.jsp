<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>project💻 - ALOHA CLASS🌴</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/layout/header.jsp" />
		<%-- [Contents] ######################################################### --%>
		<div class="container">
			<h2 class="title">택배접수</h2>
			<h3>보내는 분</h3>
			<div class="sm_container il">
				<form id="form" action="">
					<ul class="input_list">
						<li>
						 	<label for="s_name">이름</label>
					  	 	<input class="check_trim" id="s_name" name="s_name" type="text" title="보내는분의 이름을 입력해주세요." placeholder="이름">
						</li>
						<li>
						 	<label for="s_number">휴대폰 번호</label>
					  	 	<input id="s_number" name="s_number" type="text" title="보내는분의 번호를 입력해주세요." placeholder="하이픈 '-' 없이 입력해주세요." maxlength="11">
					  	 	<button class="btn_ph" type="button">인증번호 받기</button>
					  	 	<input id="certi_num" type="text" title="인증번호를 입력해주세요." placeholder="인증번호 입력">
						</li>
						<li>
						 	<label for="s_address">주소</label>
						 	<input id="s_address" name="s_address" type="text" placeholder="기본주소">
						 	<label for="s_address"> </label>
						 	<input id="s_address2" name="s_address2" type="text" placeholder="상세주소">
						</li>
					</ul>
					<button id="prev_btn" type="button" onclick="history.back()">이전</button>
					<button id="next_btn2" type="submit">다음</button>
				</form>
			</div> <!-- sm_container -->
		</div> <!-- container -->
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/footer.jsp" />
	</div> <!-- wrapper -->
	<jsp:include page="/layout/script.jsp" />
</body>
</html>