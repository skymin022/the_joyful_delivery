<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ page import="DTO.User" %>  <%-- loginUser 객체 가져오기 --%>

<%
    User loginUser = (User) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
	<title>project💻 - ALOHA CLASS🌴</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
    <link rel="stylesheet" type="text/css" href="<%= root %>/static/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%= root %>/static/css/login_list_update.css">
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/layout/header.jsp" />
		<%-- [Contents] ######################################################### --%>
		<main>

<form id="updateForm" method="post" action="login_update">
    <!-- 비밀번호 -->
    <div>
        <label>비밀번호</label>
        <input type="password" id="oldPwd" name="oldPwd" placeholder="기존 비밀번호" disabled>
        <input type="password" id="newPwd" name="newPwd" placeholder="새 비밀번호" style="display:none;">
        <input type="password" id="chkPwd" name="chkPwd" placeholder="비밀번호 확인" style="display:none;">
        <span id="pwdCheckIcon"></span>
        <button type="button" id="pwdEditBtn">수정</button>
        <button type="button" id="pwdCheckBtn" style="display:none;">확인</button>
    </div>
    <!-- 연락처 -->
    <div>
        <label>연락처</label>
        <input type="text" id="phone" name="phone" value="${user.phone}" disabled>
        <button type="button" id="phoneEditBtn">수정</button>
        <input type="text" id="phoneAuth" placeholder="인증번호 입력" style="display:none;">
        <button type="button" id="phoneAuthBtn" style="display:none;">확인</button>
        <span id="phoneAuthMsg"></span>
    </div>
    <!-- 이메일 -->
    <div>
        <label>이메일</label>
        <input type="text" id="email" name="email" value="${user.email}" disabled>
        <button type="button" id="emailEditBtn">수정</button>
        <input type="text" id="emailAuth" placeholder="인증번호 입력" style="display:none;">
        <button type="button" id="emailAuthBtn" style="display:none;">확인</button>
        <span id="emailAuthMsg"></span>
    </div>
    <!-- 주소 -->
    <div>
        <label>주소</label>
        <input type="text" id="address" name="address" value="${user.address}" disabled>
        <button type="button" id="addressEditBtn">수정</button>
    </div>
    <button type="submit" id="updateBtn">수정 완료</button>
</form>

		</main>
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/footer.jsp" />
		<jsp:include page="/layout/script.jsp" />
	</div>
	    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	function searchAddress() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 사용자가 선택한 주소를 address input에 입력
	            document.getElementById("address").value = data.address;
	        }
	    }).open();
	}
	</script>
</body>
</html>