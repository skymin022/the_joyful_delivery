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
			<h2 class="title">배송조회</h2>
			<form id="form" action="<%=root%>">
				<div class="input_area">
					<input class="input_sear d" name="delivery_no" type="number" placeholder="운송장번호" title="운송장번호를 입력해주세요.">
					<button class="search_icon"><img src="<%=root%>/static/img/search.png" alt="돋보기 이미지"/></button>
				</div>
				<p>※ 비회원으로 이용하실 시 최근 배송내역 목록은 조회되지 않습니다.</p>
			</form>
			<div class="sm_container">
				<div class="img_area">
					<img alt="택배 이미지" src="<%=root%>/static/img/delivery.png">
				</div>
				<p>로그인 시 더욱 간편하게 여러 운송장을 조회할 수 있습니다.</p>
				<div class="btn_area">
					<a href="<%=root%>/page/login/login.jsp">로그인</a>
				</div>
			</div>
		</div>
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/footer.jsp" />
	</div>
	<jsp:include page="/layout/script.jsp" />
</body>
</html>