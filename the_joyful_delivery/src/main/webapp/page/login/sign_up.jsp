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
				<form action="<%=root %>/page/login" onsubmit="return checkForm()" name="sign_up" method="post">
		            <div class="login-box">
		                <div class="sign-up-box">
		                    <div class="left-box">
		                        <div class="sign-up">sign-up</div>
		                        <div class="id-box box">
		                            <span>아이디</span>
		                            <input type="text" name="id" id="id" maxlength="20" placeholder="아이디를 입력해주세요" required>
		                            <button type="submit" onclick="clickIdCheck()" class="btn2">확인</button>
		                        </div>
		                        <div class="password-box box">
		                            <span>비밀번호</span>
		                            <input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요" required>
		                        </div>
		                        <div class="password-box passwordcheck box">
		                            <span>비밀번호 확인</span>
		                            <input type="password" name="passwordcheck" id="passwordcheck" placeholder="한번 더 비밀번호를 입력해주세요" required>
		                        </div>
		                        <div class="name box">
		                            <span>이름</span>
		                            <input type="text" name="name" id="name" placeholder="이름를 입력해주세요" required>
		                        </div>
		                        <div class="email box">
		                            <span>이메일</span>
		                            <div class="email-box">
		                                <input type="email" name="email" id="email">@<input type="email" name="email" id="email" required>
		                            </div>
		                        </div>
		                        <div class="address box">
		                            <span>주소</span>
		                            <input type="text" name="address" id="address" placeholder="주소를 입력해주세요" required>
		                        </div>
		                        <div class="birth box">
		                            <span>생년월일</span>
		                            <input type="text" name="birth" id="birth" placeholder="생년월일을 입력해주세요" required>
		                        </div>
		                    </div>
		                    <div class="right-box">
		                        <h2>wellcome, customer</h2>
		                        <h3>Enter your personal details and start <br> FAST delivery Service with us</h3>
		                        <input type="button" class="btn1" value="회원가입" onclick="checkUser()" />
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