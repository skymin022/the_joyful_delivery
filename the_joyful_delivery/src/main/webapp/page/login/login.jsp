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
	<link rel="stylesheet" type="text/css" href="<%= root %>/static/css/login.css">
</head>
<body>
    <div class="wrapper">
        <jsp:include page="/layout/header.jsp" />
        <%-- [Contents] ######################################################### --%>
        <main>
			<div class="container">
				<form id="form" action="login" method="post">
		            <div class="login-box">
		                <div class="left-box">
		                    <div class="sign-up">sign-in</div>
		                    <div class="image-set">
		                        <img src="<%= root %>/static/img/ico_social_instagram_1.png" alt="">
		                        <img src="<%= root %>/static/img/icons8_google_48.png" alt="">
		                        <img src="<%= root %>/static/img/ico_social_kakaotalk_1.png" alt="">
		                    </div>
		                    <div class="sm-content">or use your account</div>
		                    <div class="id-box">
		                        <span>아이디</span>
		                        <input type="text" name="id" id="id" placeholder="아이디를 입력해주세요">
		                    </div>
		                    <div class="password-box">
		                        <span>비밀번호</span>
		                        <input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요">
		                    </div>
		                    <div class="checkbox">
		                        <input type="checkbox" name="rememberId" id="rememberId">
		                        <label for="rememberId">아이디 저장</label> 
		                        <input type="checkbox" name="autologin" id="autologin">
		                        <label for="autologin">자동 로그인</label>
		                    </div>
		                    <div>
		                        <button type="submit" class="btn" id="login_btn" >로그인</button>
		                    </div>
		                </div>
		                <div class="right-box">
		                    <h2>wellcome, customer</h2>
		                    <h3>Enter your personal details and start <br> FAST delivery Service with us</h3>
		                    <a href="<%= root %>/page/login//sign_up.jsp" class="btn" >회원가입</a>
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