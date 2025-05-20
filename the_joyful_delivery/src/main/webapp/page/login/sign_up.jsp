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
											<input class="box" type="text" name="id" id="id" placeholder="아이디를 입력해주세요">
											<button type="button" class="btn2" onclick="checkDuplicateId()">확인</button>
										</li>

										<li>
											<span class="tname">비밀번호</span>
											<input class="box" type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요">
										</li>
										<li>
											<span class="tname">비밀번호<br>확인</span>
											<input class="box" type="password" name="passwordcheck" id="passwordcheck" placeholder="한번 더 비밀번호를 입력해주세요">
										</li>
										<li>
											<span class="tname">연락처</span>
											<input class="box phone" type="text" name="phone_number1" id="phone_number1" placeholder="예: 01012345678">
										</li>
										<li>
											<span class="tname">인증번호</span>
											<input class="box" type="text" name="check_number" id="check_number" placeholder="인증번호를 입력해주세요">
										</li>
										<li>
											<span class="tname">이름</span>
											<input class="box" type="text" name="name" id="name" placeholder="이름을 입력해주세요">
										</li>
										<li>
											<span class="tname">이메일</span>
											<input class="box email" type="text" name="email1" id="email1" placeholder="이메일 아이디">
											<span>@</span>
											<input class="box email" type="text" name="email2" id="email2" placeholder="도메인 (예: gmail.com)">
										</li>
										<li>
											<span class="tname">주소</span>
											<input class="box" type="text" name="address" id="address" placeholder="주소를 입력해주세요">
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
</body>
</html>