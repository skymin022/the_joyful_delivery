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
    <link rel="stylesheet" type="text/css" href="<%= root %>/static/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%= root %>/static/css/sign_up.css">
</head>
<body>
    <div class="wrapper">
        <jsp:include page="/layout/header.jsp" />
        <%-- [Contents] ######################################################### --%>
        <main>
			<div class="container">
				<form action="<%=root %>/page/login" onsubmit="return validateSignUpForm()" name="sign_up" method="post">
					<div class="login-box">
						<div class="sign-up-box">
							<div class="left-box">
								<div class="sign-up">sign-up</div>
									<h2>welcome, customer</h2>
									<h3>Enter your personal details and start <br> FAST delivery Service with us</h3>
									<input type="submit" class="btn1" value="회원가입" />
								</div>
							    <div class="right-box">
									<ul>
										<li>
											<span class="tname">아이디</span>
											<input class="box1" type="text" name="id" id="id" placeholder="아이디를 입력해주세요">
											<button type="button" class="btn2" onclick="checkDuplicateId()">확인</button>
										</li>

										<li>
											<span class="tname">비밀번호</span>
											<input class="box" type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요">
										</li>
										<li>
											<span class="tname">비밀번호<br>확인</span>
											<span id="pwCheckMessage" class="check-message"></span>
											<input class="box" type="password" name ="passwordcheck" id="passwordcheck" placeholder="한번 더 비밀번호를 입력해주세요">
										</li>
										<li>
											<span class="tname">연락처</span>
											<input class="box1" type="text" id="s_number" name="phone_number1" placeholder="01012345678" />
											<button type="button" id="btnPhone" class="btn2">확인</button>
										</li>
										<li>
											<span class="tname">인증번호</span>
											<input class="box" type="text" id="check_number" placeholder="인증번호 입력" />
										</li>
										<li>
											<span class="tname">이름</span>
											<input class="box" type="text" name="name" id="name" placeholder="이름을 입력해주세요">
										</li>
										<li>
											<span class="tname">이메일</span>
											<input class="box email" type="text" name="email1" id="email1" placeholder="이메일 아이디">
											<span>@</span>
											<input class="box email" type="text" name="email2" id="email2" placeholder="gmail.com" list="emailDomains">
											<datalist id="emailDomains">
												<option value="gmail.com">
												<option value="naver.com">
											</datalist>
										</li>
										<li>
											<span class="tname">주소</span>
											<input class="box1" type="text" name="address" id="address" placeholder="주소를 입력해주세요" readonly>
											<button type="button" id="btnPhone" class="btn2" onclick="searchAddress()">주소찾기</button>
										</li>
										<li>
											<span class="tname">생년월일</span>
											<input class="box" type="text" name="birth" id="birth" placeholder="예: 19990101">
										</li>
									</ul>
								</div>
							</div>
						</div>
					</form>
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
	</script>
</body>
</html>