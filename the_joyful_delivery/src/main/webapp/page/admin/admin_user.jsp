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
	<style type="text/css">
		body {
			background-color: #EEEEEE !important;
		}
	</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/layout/admin_header.jsp" />
		<%-- [Contents] ######################################################### --%>
		<form action="">
			<div class="ad_search">
				<div style="position: relative;">
					<input type="text" name="where_txt">
					<button class="ad_search_icon"><img src="<%=root%>/static/img/search.png" alt="돋보기 이미지"/></button>
				</div>
				<div class="line"></div>
				<ul>     
					<li><input name="where" id="userNo"   value="userNo"   type="radio"/><label for="userNo">회원번호</label></li>
					<li><input name="where" id="userName" value="userName" type="radio"/><label for="userName">이름</label></li>
					<li><input name="where" id="userId"   value="userId"   type="radio"/><label for="userId">아이디</label></li>
					<li><input name="where" id="userEma"  value="userEma"  type="radio"/><label for="userEma">이메일</label></li>
					<li><input name="where" id="userPho"  value="userPho"  type="radio"/><label for="userPho">전화번호</label></li>
					<li><input name="where" id="userAdd"  value="userAdd"  type="radio"/><label for="userAdd">주소</label></li>
					<li><input name="where" id="userBir"  value="userBir"  type="radio"/><label for="userBir">생년월일</label></li>
				</ul>
			</div>		
		</form>
		<div class="user_table">
			<table border="1">
				<thead>
					<tr>
						<th>회원번호</th>
						<th>이름</th>
						<th>아이디</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>주소</th>
						<th>생년월일</th>
						<th>예약건수</th>
						<th>탈퇴여부</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>김조은</td>
						<td>joeun123</td>
						<td>joeun123@naver.com</td>
						<td>010-1234-5678</td>
						<td>인천광역시 부평구 어디동 123-21 301호</td>
						<td>920202</td>
						<td>3</td>
						<td>N</td>
					</tr>
					<tr>
						<td>1</td>
						<td>김조은</td>
						<td>joeun123</td>
						<td>joeun123@naver.com</td>
						<td>010-1234-5678</td>
						<td>인천광역시 부평구 어디동 123-21 301호</td>
						<td>920202</td>
						<td>3</td>
						<td>N</td>
					</tr>
					<tr>
						<td>1</td>
						<td>김조은</td>
						<td>joeun123</td>
						<td>joeun123@naver.com</td>
						<td>010-1234-5678</td>
						<td>인천광역시 부평구 어디동 123-21 301호</td>
						<td>920202</td>
						<td>3</td>
						<td>N</td>
					</tr>
					<tr>
						<td>1</td>
						<td>김조은</td>
						<td>joeun123</td>
						<td>joeun123@naver.com</td>
						<td>010-1234-5678</td>
						<td>인천광역시 부평구 어디동 123-21 301호</td>
						<td>920202</td>
						<td>3</td>
						<td>N</td>
					</tr>
					<tr>
						<td>1</td>
						<td>김조은</td>
						<td>joeun123</td>
						<td>joeun123@naver.com</td>
						<td>010-1234-5678</td>
						<td>인천광역시 부평구 어디동 123-21 301호</td>
						<td>920202</td>
						<td>3</td>
						<td>N</td>
					</tr>
					<tr>
						<td>1</td>
						<td>김조은</td>
						<td>joeun123</td>
						<td>joeun123@naver.com</td>
						<td>010-1234-5678</td>
						<td>인천광역시 부평구 어디동 123-21 301호</td>
						<td>920202</td>
						<td>3</td>
						<td>N</td>
					</tr>
					<tr>
						<td>1</td>
						<td>김조은</td>
						<td>joeun123</td>
						<td>joeun123@naver.com</td>
						<td>010-1234-5678</td>
						<td>인천광역시 부평구 어디동 123-21 301호</td>
						<td>920202</td>
						<td>3</td>
						<td>N</td>
					</tr>
					<tr>
						<td>1</td>
						<td>김조은</td>
						<td>joeun123</td>
						<td>joeun123@naver.com</td>
						<td>010-1234-5678</td>
						<td>인천광역시 부평구 어디동 123-21 301호</td>
						<td>920202</td>
						<td>3</td>
						<td>N</td>
					</tr>
				</tbody>
			</table>
		</div>
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/script.jsp" />
	</div>
</body>
</html>