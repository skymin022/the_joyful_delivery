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
			                    <span class="tab part1">배송 상태</span>
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
								        	<input type="password" id="oldPwd" name="oldPwd" placeholder="기존 비밀번호" disabled>
								        	<button type="button" id="pwdCheckBtn" style="display:none;">확인</button>
								        </div>
								        <div class="form-row">
								            <label>새 비밀번호</label>
								             <input type="password" id="password" name="password" placeholder="새 비밀번호" style="display:none;">
								        </div>
								        <div class="form-row">
								            <label>비밀번호 확인</label>
								            <input type="password" id="passwordcheck" name="passwordcheck" placeholder="비밀번호 확인" style="display:none;">
								            <span id="pwCheckMessage" class="check-message"></span>
								        </div>
										<div>
								            <button type="button" id="pwdEditBtn">수정</button>
										</div>
								    </fieldset>
								
								    <!-- 연락처 변경 -->
								    <fieldset class="group-box">
								        <legend>연락처</legend>
								        <div class="form-row">
								            <label>전화번호</label>
								            <input type="text" name="p_number" id="p_number" value="${loginUser.PNumber}" style="display:none;" />
								            <button type="button" id="btnPhone">확인</button>
						                    <button type="button" id="phoneAuthBtn" style="display:none;">확인</button>
      											<span id="phoneAuthMsg"></span>
								        </div>
								        <div class="form-row">
								            <label>인증번호</label>
								            <input type="text" id="check_number" placeholder="인증번호 입력" />
								        </div>
								        <div class="form-row">
        							        <button type="button" id="p_numberEditBtn">수정</button>
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
									        <input type="text" name="email1" id="email1" placeholder="이메일 아이디" value="<%= email1 %>" disabled/>
									        <span>@</span>
									        <input type="text" name="email2" id="email2" placeholder="gmail.com" list="emailDomains" value="<%= email2 %>" disabled/>
									        <datalist id="emailDomains">
									            <option value="gmail.com" />
									            <option value="naver.com" />
									        </datalist>
									        <button type="button" id="emailAuthBtn" style="display:none;">확인</button>
        									<span id="emailAuthMsg"></span>
									    </div>
									    <div class="form-row">
        									<button type="button" id="emailEditBtn">수정</button>
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
									    <div class="form-row">
									        <button type="button" id="addressEditBtn">수정</button>
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
	
	// 비밀번호 수정 버튼 클릭
	document.getElementById('pwdEditBtn').onclick = function() {
	    document.getElementById('oldPwd').disabled = false;
	    document.getElementById('pwdCheckBtn').style.display = '';
	    document.getElementById('oldPwd').focus();
	};

	// 기존 비밀번호 확인
	document.getElementById('pwdCheckBtn').onclick = function() {
	    const oldPwd = document.getElementById('oldPwd').value;
	    fetch('pwd_check', {
	        method: 'POST',
	        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
	        body: 'oldPwd=' + encodeURIComponent(oldPwd)
	    }).then(res => res.json())
	      .then(data => {
	        if(data.match) {
	            document.getElementById('newPwd').style.display = '';
	            document.getElementById('chkPwd').style.display = '';
	            document.getElementById('pwdCheckBtn').style.display = 'none';
	            document.getElementById('oldPwd').disabled = true;
	        } else {
	            alert('기존 비밀번호가 일치하지 않습니다.');
	        }
	    });
	};

	// 새 비밀번호/확인 입력 시 일치 여부 체크
	['newPwd','chkPwd'].forEach(id => {
	    document.getElementById(id).oninput = function() {
	        const newPwd = document.getElementById('newPwd').value;
	        const chkPwd = document.getElementById('chkPwd').value;
	        const icon = document.getElementById('pwdCheckIcon');
	        if(newPwd && chkPwd) {
	            if(newPwd === chkPwd) {
	                icon.textContent = '✔️';
	                icon.style.color = 'green';
	            } else {
	                icon.textContent = '❌';
	                icon.style.color = 'red';
	            }
	        } else {
	            icon.textContent = '';
	        }
	    }
	});

	// 연락처 수정 버튼
	document.getElementById('phoneEditBtn').onclick = function() {
	    document.getElementById('phone').disabled = false;
	    document.getElementById('phoneAuth').style.display = '';
	    document.getElementById('phoneAuthBtn').style.display = '';
	    // 임의 인증번호 생성 및 표시
	    window.phoneCode = Math.floor(1000 + Math.random()*9000) + '';
	    alert('인증번호: ' + window.phoneCode);
	};
	document.getElementById('phoneAuthBtn').onclick = function() {
	    if(document.getElementById('phoneAuth').value === window.phoneCode) {
	        document.getElementById('phoneAuthMsg').textContent = '인증되었습니다';
	        document.getElementById('phoneAuthMsg').style.color = 'green';
	    } else {
	        document.getElementById('phoneAuthMsg').textContent = '인증번호가 다릅니다';
	        document.getElementById('phoneAuthMsg').style.color = 'red';
	    }
	};

	// 이메일 수정 버튼
	document.getElementById('emailEditBtn').onclick = function() {
	    document.getElementById('email').disabled = false;
	    document.getElementById('emailAuth').style.display = '';
	    document.getElementById('emailAuthBtn').style.display = '';
	    window.emailCode = Math.floor(1000 + Math.random()*9000) + '';
	    alert('이메일 인증번호: ' + window.emailCode);
	};
	document.getElementById('emailAuthBtn').onclick = function() {
	    if(document.getElementById('emailAuth').value === window.emailCode) {
	        document.getElementById('emailAuthMsg').textContent = '인증되었습니다';
	        document.getElementById('emailAuthMsg').style.color = 'green';
	    } else {
	        document.getElementById('emailAuthMsg').textContent = '인증번호가 다릅니다';
	        document.getElementById('emailAuthMsg').style.color = 'red';
	    }
	};

	// 주소 수정 버튼
	document.getElementById('addressEditBtn').onclick = function() {
	    document.getElementById('address').disabled = false;
	};

	// 수정 완료 버튼
	document.getElementById('updateForm').onsubmit = function(e) {
	    let changed = false;
	    if(document.getElementById('newPwd').style.display === '' && document.getElementById('pwdCheckIcon').textContent === '✔️') changed = true;
	    if(document.getElementById('phone').disabled === false && document.getElementById('phoneAuthMsg').textContent === '인증되었습니다') changed = true;
	    if(document.getElementById('email').disabled === false && document.getElementById('emailAuthMsg').textContent === '인증되었습니다') changed = true;
	    if(document.getElementById('address').disabled === false) changed = true;
	    if(!changed) {
	        alert('어떠한 내용도 수정되지 않았습니다');
	        e.preventDefault();
	    }
	};

	
	
	
	</script>
	
</body>
</html>