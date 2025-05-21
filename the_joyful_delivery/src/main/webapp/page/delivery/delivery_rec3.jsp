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
			<h3>받는 분</h3>
			<div class="sm_container il">
				<form id="form" action="" method="post">
					<ul class="input_list">
						<li>
						 	<label for="r_name">이름</label>
					  	 	<input class="check_trim" id="r_name" name="r_name" type="text" title="받는분의 이름을 입력해주세요." placeholder="이름">
						</li>
						<li>
						 	<label for="r_number">휴대폰 번호</label>
					  	 	<input id="r_number" name="r_number" type="text" title="받는분의 번호를 입력해주세요." placeholder="하이픈 '-' 없이 입력해주세요." maxlength="11">
						</li>
						<li>
						 	<label for="r_address">주소</label>
						 	<input id="r_address" name="r_address" type="text" placeholder="기본주소" title="주소를 입력해주세요.">
						 	<label for="r_address"> </label>
						 	<input id="r_address2" name="r_address2" type="text" placeholder="상세주소" title="상세주소를 입력해주세요.">
						</li>
						<li>
						 	<label for="r_number">요청사항</label>
					  	 	<input id="r_number" name="r_req" type="text" title="요청사항을 입력해주세요." placeholder="배송 요청사항" maxlength="11">
						</li>
						<li>
						 	<label for="pre_pos">지불방법</label>
						 	<select id="pre_pos" name="pre_pos">
								<option disabled selected>지불 방법 선택</option>
								<option value="선불">선불</option>
								<option value="후불">후불</option>
							</select>
						</li>
					</ul>
					<button id="prev_btn" type="button" onclick="history.back()">이전</button>
					<button id="next_btn3" type="submit">예약</button>
				</form>
			</div> <!-- sm_container -->
		</div> <!-- container -->
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/footer.jsp" />
	</div> <!-- wrapper -->
	<jsp:include page="/layout/script.jsp" />
</body>
</html>