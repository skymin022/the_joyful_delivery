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

			<div class="wrapper">
			        <div class="container">
			            <div class="main-content">
			                <div class="tap">
			                    <span class="tab part1" id="deliveryTab">배송 상태</span>
    							<span class="tab part2 active">회원정보 수정</span>
			                </div>
			
			                <div class="update-container">
								<form action="<%= root %>/users/update" id="updateForm" method="post" name="update_form" onsubmit="return Userform.validateUpdateForm();">
								    <input type="hidden" name="idx" value="${loginUser.idx}" />
								    <div class="form-row">
								        <label>아이디</label>
								        <input type="text" name="id" id="id" value="${loginUser.id}" readonly />
								    </div>
								    <div class="form-row">
								        <label>이름</label>
								        <input type="text" name="name" id="name" value="${loginUser.username}" readonly />
								    </div>
								    <div class="form-row">
								        <label>생년월일</label>
								        <input type="text" name="birth" id="birth" value="${loginUser.birth}" readonly />
								    </div>
								
								    <!-- 비밀번호 변경 -->
								    <fieldset class="group-box">
								        <legend>비밀번호 변경</legend>
								        <div class="form-row">
								            <label>새 비밀번호</label>
								            <input type="password" name="password" id="password" />
								        </div>
								        <div class="form-row">
								            <label>비밀번호 확인</label>
								            <input type="password" name="passwordcheck" id="passwordcheck" />
								            <span id="pwCheckMessage" class="check-message"></span>
								        </div>
								        <div>
								        
								        </div>
								    </fieldset>
								
								    <!-- 연락처 변경 -->
								    <fieldset class="group-box">
								        <legend>연락처</legend>
								        <div class="form-row">
								            <label>전화번호</label>
								            <input type="text" name="p_number" id="p_number" value="${loginUser.PNumber}" />
								            <button type="button" id="btnPhone">확인</button>
								        </div>
								        <div class="form-row">
								            <label>인증번호</label>
								            <input type="text" id="check_number" placeholder="인증번호 입력" />
								        </div>
								    </fieldset>
								
								    <!-- 이메일 변경 -->
									<%
									    String email = loginUser.getEmail(); // 예: pass001@gmail.com
									    String email1 = "";
									    String email2 = "";
									    if(email != null && email.contains("@")) {
									        String[] parts = email.split("@");
									        email1 = parts[0];
									        email2 = parts[1];
									    }
									%>
									
									<fieldset class="group-box">
									    <legend>이메일</legend>
									    <div class="form-row">
									        <label>이메일</label>
									        <input type="text" name="email1" id="email1" placeholder="이메일 아이디" value="<%= email1 %>" />
									        <span>@</span>
									        <input type="text" name="email2" id="email2" placeholder="gmail.com" list="emailDomains" value="<%= email2 %>" />
									        <datalist id="emailDomains">
									            <option value="gmail.com" />
									            <option value="naver.com" />
									        </datalist>
									    </div>
									</fieldset>

								
								    <!-- 주소 변경 -->
								    <fieldset class="group-box">
								        <legend>주소</legend>
								        <div class="form-row">
								            <label>주소</label>
								            <input type="text" name="address" id="address" value="${loginUser.address}" readonly />
								            <button type="button" id="btnAddress" onclick="searchAddress()">주소찾기</button>
								        </div>
							            <div class="form-row">
									        <label for="address_detail">상세 주소</label>
									        <input type="text" name="address_detail" id="address_detail" placeholder="상세 주소를 입력하세요" value="${user.addressDetail}" />
									    </div>
								    </fieldset>
								
								    <div class="submit-box">
								        <button type="submit" class="btn-update">수정완료</button>
								    </div>
								</form>

			                </div>
			
			            </div>
			        </div>
			    </div>

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
	document.getElementById("deliveryTab").addEventListener("click", function() {
	    window.location.href = "http://localhost:8080/the_joyful_delivery/users/mypage-jsp";
	});
	
	
	</script>
</body>
</html>