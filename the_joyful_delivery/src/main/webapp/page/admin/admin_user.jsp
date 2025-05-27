<%@page import="DTO.User"%>
<%@page import="java.util.List"%>
<%@ include file="/layout/jstl.jsp"%>
<%@ include file="/layout/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String where = "";
	if(request.getParameter("where") != null) {
		where = request.getParameter("where");
	}
%>
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
		<header>
			<div class="admin_header">
				<a href="<%=root%>/index"><img
					src="<%=root%>/static/img/logo.png" width="380" height="153"></a>
				<nav>
					<ul>
						<li class="on"><a href="<%=root%>/admin/user">회원관리</a></li>
						<li><a href="<%=root%>/admin/delivery">택배관리</a></li>
						<li><a href="<%=root%>/admin/inquiry">문의</a></li>
						<li><a href="<%=root%>/admin/driver">기사관리</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<%-- [Contents] ######################################################### --%>
		
		<form action="<%=root%>/admin/user">
			<div class="ad_search">
				<ul>
					<li><input name="where" id="userNo" value="idx" type="radio" /><label
						for="userNo" <%=where.equals("idx") ? "checked" : ""%>>회원번호</label></li>
					<li><input name="where" id="userName" value="username"
						type="radio" <%=where.equals("username") ? "checked" : ""%>/><label for="userName">이름</label></li>
					<li><input name="where" id="userId" value="ID" type="radio" /><label
						for="userId">아이디</label></li>
					<li><input name="where" id="userEma" value="email"
						type="radio" <%=where.equals("email") ? "checked" : ""%>/><label for="userEma">이메일</label></li>
					<li><input name="where" id="userPho" value="p_number"
						type="radio" <%=where.equals("p_number") ? "checked" : ""%>/><label for="userPho">전화번호</label></li>
					<li><input name="where" id="userAdd" value="address"
						type="radio" <%=where.equals("address") ? "checked" : ""%>/><label for="userAdd">주소</label></li>
					<li><input name="where" id="userBir" value="birth"
						type="radio" <%=where.equals("birth") ? "checked" : ""%>/><label for="userBir">생년월일</label></li>
				</ul>
				<div class="line"></div>
				<div>
					<input type="text" name="where_txt" value="<%=request.getParameter("where_txt") != null ? request.getParameter("where_txt") : "" %>"/>
					<button class="ad_search_icon">
						<img src="<%=root%>/static/img/search.png" alt="돋보기 이미지" />
					</button>
				</div>
			</div>
		</form>
		<div class="adm_table">
			<table class="admin_table">
				<thead class="adm_th_wrap">
					<tr class="adm_th_tr">
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
				<tbody class="adm_tbody">
					<c:forEach var="user" items="${users}">
						<tr class="adm_tbody_tr" onclick="receiveFromFetch(${user.idx})">
							<td>${user.idx}</td>
							<td>${user.username}</td>
							<td>${user.id}</td>
							<td>${user.email}</td>
							<td>${user.PNumber}</td>
							<td>${user.address}</td>
							<td>${user.birth}</td>
							<td>3</td>
							<td>${user.withdrawal ? "Y" : "N"}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="adm_bottom_page">
				<ul>
					<span>TODO: 페이징처리</span>
					<li><a href="#"><img src="<%=root%>/static/img/lleft.png"
							alt="" /></a></li>
					<li><a href="#"><img src="<%=root%>/static/img/left.png"
							alt="" /></a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#"><img src="<%=root%>/static/img/right.png"
							alt="" /></a></li>
					<li><a href="#"><img src="<%=root%>/static/img/rright.png"
							alt="" /></a></li>
				</ul>
			</div>
		</div>
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/script.jsp" />
	</div>
	<button onclick="receiveFromFetch()">12312</button>
	<iframe scrolling="no" src="<%=root%>/page/admin/update_form.jsp" class=""></iframe>
	<!-- 비동기로 모달에 전달할 데이터 가져오기 -->
	<script type="text/javascript">
		function receiveFromFetch(idx) {
			fetch('/the_joyful_delivery/admin/user/modal?idx='+idx)
				.then(res => res.json())
				.then(data => {
					const iframe = document.querySelector("iframe")
					iframe.contentWindow.postMessage(data, "*")
					iframe.style.display = 'block';
					console.log(data)
			});
		}
	</script>
</body>
</html>