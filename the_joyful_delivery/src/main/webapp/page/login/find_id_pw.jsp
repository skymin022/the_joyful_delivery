<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String findMode = (String) request.getAttribute("findMode");
    String findResult = (String) request.getAttribute("findResult");
%>
<!DOCTYPE html>
<html>
<head>
	<title>project💻 - ALOHA CLASS🌴</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<style>
        .find-container { max-width: 400px; margin: 40px auto; background: #fff; border-radius: 18px; box-shadow: 0 4px 24px rgba(0,0,0,0.07); padding: 32px 28px 18px 28px; }
        .find-title { text-align: center; font-size: 1.6em; font-weight: 600; margin-bottom: 22px; color: #222; }
        .find-form { margin-bottom: 24px; }
        .find-form label { display: block; margin: 8px 0 2px 0; }
        .find-form input { width: 100%; padding: 8px 6px; margin-bottom: 10px; border: 1px solid #ccc; border-radius: 6px; }
        .find-form button { width: 100%; background: #ffd36f; color: #222; border: none; border-radius: 8px; font-size: 1.1em; font-weight: 600; padding: 10px 0; margin-top: 5px; cursor: pointer; transition: background 0.2s; }
        .find-form button:hover { background: #ffbc1f; }
        .find-result { background: #f9f9f9; border-radius: 8px; padding: 18px; margin-top: 10px; text-align: center; font-size: 1.1em; color: #333; }
        .find-back { display: block; width: 100%; margin-top: 18px; text-align: center; color: #333; text-decoration: underline; margin-bottom: 50px;}
    </style>
<body>
	<jsp:include page="/layout/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	<main>
	
<div class="find-container">
		        <!-- 결과 출력 -->
        <%
            if (findResult != null) {
        %>
            <div class="find-result">
                <%= findResult %>
            </div>
            <a href="<%= root %>/page/login/login.jsp" class="find-back">로그인으로 돌아가기</a>
        <%
            }
        %>


        <div class="find-title">아이디/비밀번호 찾기</div>
        <!-- 아이디 찾기 폼 -->
        <form class="find-form" id="findIdForm" action="<%= root %>/users/find" method="post" autocomplete="off">
            <input type="hidden" name="mode" value="id">
            <label for="findId_username">이름</label>
            <input type="text" id="findId_username" name="username" placeholder="이름" required>
            <label for="findId_email">이메일</label>
            <input type="email" id="findId_email" name="email" placeholder="이메일" required>
            <button type="submit">아이디 찾기</button>
        </form>
        <!-- 비밀번호 찾기 폼 -->
        <form class="find-form" id="findPwForm" action="<%= root %>/users/find" method="post" autocomplete="off">
            <input type="hidden" name="mode" value="pw">
            <label for="findPw_id">아이디</label>
            <input type="text" id="findPw_id" name="id" placeholder="아이디" required>
            <label for="findPw_username">이름</label>
            <input type="text" id="findPw_username" name="username" placeholder="이름" required>
            <label for="findPw_email">이메일</label>
            <input type="email" id="findPw_email" name="email" placeholder="이메일" required>
            <button type="submit">비밀번호 찾기</button>
        </form>


    </div>

 
   
	
	
	</main>
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
	<script>
	document.addEventListener('DOMContentLoaded', function() {
	    document.getElementById('findIdForm').onsubmit = function(e) {
	        const username = document.getElementById('findId_username').value.trim();
	        const email = document.getElementById('findId_email').value.trim();
	        if (!username || !email) {
	            alert('이름과 이메일을 입력하세요.');
	            e.preventDefault();
	            return false;
	        }
	    };
	    document.getElementById('findPwForm').onsubmit = function(e) {
	        const id = document.getElementById('findPw_id').value.trim();
	        const username = document.getElementById('findPw_username').value.trim();
	        const email = document.getElementById('findPw_email').value.trim();
	        if (!id || !username || !email) {
	            alert('아이디, 이름, 이메일을 모두 입력하세요.');
	            e.preventDefault();
	            return false;
	        }
	    };
	});

	</script>
</body>
</html>