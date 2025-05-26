<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 삼항 연산자 전용 변수
	String queryString = (String)request.getAttribute("paramQuery");	
	request.setAttribute("queryString", queryString);	// JSTL 에서 쓸 수 있게
	String baseUrl = root + "/admin/delivery";
	request.setAttribute("baseUrl", baseUrl);			// JSTL 에서 쓸 수 있게
	int size = (int)request.getAttribute("size");
	int currentPage = (int)request.getAttribute("currentPage");
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
				<a href="<%= root %>/index"><img src="<%= root %>/static/img/logo.png" width="380" height="153" ></a>
				<nav>
					<ul>
						<li><a href="<%=root%>/admin/user">회원관리</a></li>
						<li class="on"><a href="<%=root%>/admin/delivery">택배관리</a></li>
						<li><a href="<%=root%>/admin/inquiry">문의</a></li>
						<li><a href="<%=root%>/admin/driver">기사관리</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<%-- [Contents] ######################################################### --%>
		<form action="<%=root%>/admin/delivery">
			<div class="ad_search">
				<ul>     
					<li><input name="where" id="delNo"     value="idx"     type="radio"/><label for="delNo">송장번호</label></li>
					<li><input name="where" id="userNo"    value="user_idx"    type="radio"/><label for="userNo">회원번호</label></li>
					<li><input name="where" id="createdAt" value="created_at" type="radio"/><label for="createdAt">송장발행일</label></li>
					<li><input name="where" id="currLoc"   value="r_status"   type="radio"/><label for="currLoc">현재위치</label></li>
					<li><input name="where" id="status"    value="status"    type="radio"/><label for="status">배송상태</label></li>
				</ul>
				<div class="line"></div>
				<div style="position: relative;">
					<input type="text" name="where_txt">
					<button class="ad_search_icon"><img src="<%=root%>/static/img/search.png" alt="돋보기 이미지"/></button>
				</div>
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
					<c:forEach var="del" items="${deliveries}">
					    <tr>
					      <td>${del.idx}</td>
					      <td>${del.userIdx}</td>
					      <td>${del.name}</td>
					      <td>${del.formatCreatedAt}</td>
					      <td>${del.regStatus}</td>
					      <td>${del.value}만원</td>
					      <td>${del.prePos}</td>
					      <td>${del.status}</td>
					    </tr>
			  		</c:forEach>
				</tbody>
			</table>
			<div class="adm_bottom_page">
			    <ul>
			        <li>
			            <a href="<%= baseUrl + "?" + (queryString.length() > 0 ? queryString + "&" : "") + "page=1" %>">
			                <img src="<%=root%>/static/img/lleft.png" alt="처음"/>
			            </a>
			        </li>
			        <li>
			            <a href="<%= baseUrl + "?" + (queryString.length() > 0 ? queryString + "&" : "") + "page=" + Math.max(currentPage - 1, 1) %>">
			                <img src="<%=root%>/static/img/left.png" alt="이전"/>
			            </a>
			        </li>
			        <c:forEach var="i" begin="${startPage}" end="${endPage}">
					    <c:set var="pageQuery" value="page=${i+1}" />
					    <c:choose>
					        <c:when test="${not empty queryString}">
					            <c:set var="fullQuery" value="${queryString}&${pageQuery}" />
					        </c:when>
					        <c:otherwise>
					            <c:set var="fullQuery" value="${pageQuery}" />
					        </c:otherwise>
					    </c:choose>
					    <c:set var="pageLink" value="${baseUrl}?${fullQuery}" />
					    <li><a style="${i  == currentPage - 1 ? 'font-weight: bold; color: red;' : ' '}" href="${pageLink}">${i + 1}</a></li>
					</c:forEach>
			        <li>
			            <a href="<%= baseUrl + "?" + (queryString.length() > 0 ? queryString + "&" : "") + "page=" + Math.min(currentPage + 1, size) %>">
			                <img src="<%=root%>/static/img/right.png" alt="다음"/>
			            </a>
			        </li>
			        <li>
			            <a href="<%= baseUrl + "?" + (queryString.length() > 0 ? queryString + "&" : "") + "page=" + (size) %>">
			                <img src="<%=root%>/static/img/rright.png" alt="마지막"/>
			            </a>
			        </li>
			    </ul>
			</div>
		</div>
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/script.jsp" />
	</div>
</body>
</html>