<%@page import="java.util.List"%>
<%@page import="DTO.User"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 유저 목록 가져오기 --%>
<%List<User> list = (List)request.getAttribute("users"); %>
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
				<a href="<%= root %>/index.jsp"><img src="<%= root %>/static/img/logo.png" width="380" height="153" ></a>
				<nav>
					<ul>
						<li class="on"><a href="<%=root%>/admin/user">회원관리</a></li>
						<li><a href="<%=root%>/admin/delivery">택배관리</a></li>
						<li><a href="<%=root%>/page/admin/admin_inq.jsp">문의</a></li>
						<li><a href="<%=root%>/page/admin/admin_driver.jsp">기사관리</a></li>
					</ul>
				</nav>
			</div>
		</header>
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
					<% for(User user : list) { %>
					<tr class="adm_tbody_tr">
						<td><%=user.getIdx() %></td>
						<td><%=user.getUsername() %></td>
						<td><%=user.getId() %></td>
						<td><%=user.getEmail() %></td>
						<td><%=user.getPNumber() %></td>
						<td><%=user.getAddress() %></td>
						<td><%=user.getBirth()%></td>
						<td>3</td>
						<% String YorN = user.isWithdrawal() ? "Y" : "N";%>
						<td><%=YorN %></td>
					</tr>
					<%}%>
				</tbody>
			</table>
		</div>
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/script.jsp" />
	</div>
</body>
</html>