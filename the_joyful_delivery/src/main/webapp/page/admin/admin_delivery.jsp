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
		<header>
			<div class="admin_header">
				<a href="<%= root %>/index.jsp"><img src="<%= root %>/static/img/logo.png" width="380" height="153" ></a>
				<nav>
					<ul>
						<li><a href="<%=root%>/page/admin/admin_user.jsp">회원관리</a></li>
						<li class="on"><a href="<%=root%>/page/admin/admin_delivery.jsp">택배관리</a></li>
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
					<li><input name="where" id="delNo"     value="delNo"     type="radio"/><label for="delNo">송장번호</label></li>
					<li><input name="where" id="userNo"    value="userNo"    type="radio"/><label for="userNo">회원번호</label></li>
					<li><input name="where" id="createdAt" value="createdAt" type="radio"/><label for="createdAt">송장발행일</label></li>
					<li><input name="where" id="currLoc"   value="currLoc"   type="radio"/><label for="currLoc">현재위치</label></li>
					<li><input name="where" id="status"    value="status"    type="radio"/><label for="status">배송상태</label></li>
				</ul>
			</div>		
		</form>
		<div class="adm_table">
			<table class="admin_table">
				<thead class="adm_th_wrap">
					<tr class="adm_th_tr">
						<th>송장번호</th>
						<th>회원번호</th>
						<th>담당기사</th>
						<th>송장발행일</th>
						<th>현재위치</th>
						<th>물품가액</th>
						<th>선불착불</th>
						<th>배송상태</th>
					</tr>
				</thead>
				<tbody class="adm_tbody">
					<tr class="adm_tbody_tr">
					<tr>
						<td>1234567891012</td>
						<td>1</td>
						<td>박광철</td>
						<td>2025-05-21 11:21:35</td>
						<td>동인천 도착</td>
						<td>30만원</td>
						<td>선불</td>
						<td>배송중</td>
					</tr>
					<tr>
						<td>1234567891012</td>
						<td>1</td>
						<td>박광철</td>
						<td>2025-05-21 11:21:35</td>
						<td>동인천 도착</td>
						<td>30만원</td>
						<td>착불</td>
						<td>배송중</td>
					</tr>
					<tr>
						<td>1234567891012</td>
						<td>1</td>
						<td>박광철</td>
						<td>2025-05-21 11:21:35</td>
						<td>동인천 도착</td>
						<td>30만원</td>
						<td>선불</td>
						<td>배송중</td>
					</tr>
					<tr>
						<td>1234567891012</td>
						<td>1</td>
						<td>박광철</td>
						<td>2025-05-21 11:21:35</td>
						<td>동인천 도착</td>
						<td>30만원</td>
						<td>선불</td>
						<td>배송중</td>
					</tr>
					<tr>
						<td>1234567891012</td>
						<td>1</td>
						<td>박광철</td>
						<td>2025-05-21 11:21:35</td>
						<td>동인천 도착</td>
						<td>30만원</td>
						<td>선불</td>
						<td>배송중</td>
					</tr>
					<tr>
						<td>1234567891012</td>
						<td>1</td>
						<td>박광철</td>
						<td>2025-05-21 11:21:35</td>
						<td>동인천 도착</td>
						<td>30만원</td>
						<td>선불</td>
						<td>배송중</td>
					</tr>
				</tbody>
			</table>
		</div>
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/script.jsp" />
	</div>
</body>
</html>