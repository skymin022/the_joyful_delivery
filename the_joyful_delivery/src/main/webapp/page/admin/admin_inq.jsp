<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.util.List"%>
<%@page import="DTO.Inquiry"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<Inquiry> list = (List)request.getAttribute("inquiries"); %>
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
						<li><a href="<%=root%>/admin/user">회원관리</a></li>
						<li><a href="<%=root%>/admin/delivery">택배관리</a></li>
						<li class="on"><a href="<%=root%>/admin/inquiry">문의</a></li>
						<li><a href="<%=root%>/admin/driver">기사관리</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<%-- [Contents] ######################################################### --%>
		<form action="">
			<div class="ad_search">
				<ul>     
					<li><input name="where" id="inquiryNo" value="inquiryNo" type="radio"/><label for="inquiryNo">문의번호</label></li>
					<li><input name="where" id="userNo"    value="userNo"    type="radio"/><label for="userNo">회원번호</label></li>
					<li><input name="where" id="content"   value="content"   type="radio"/><label for="content">내용</label></li>
					<li><input name="where" id="cratedAt"  value="cratedAt"  type="radio"/><label for="cratedAt">문의날짜</label></li>
					<li><input name="where" id="check"     value="check"     type="radio"/><label for="check">답변여부</label></li>
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
						<th>문의번호</th>
						<th>회원번호</th>
						<th>내용</th>
						<th>문의날짜</th>
						<th>답변여부</th>
					</tr>
				</thead>
				<tbody class="adm_tbody">
				<% for(Inquiry inquiry : list) { %>
					<tr class="adm_tbody_tr">
					<tr>
						<td><%= inquiry.getIdx() %></td>
						<td><%= inquiry.getUserNo() %></td>
						<td><%= inquiry.getContent() %></td>
						<td><%= inquiry.getCreatedAt() %></td>
						<td><%= inquiry.isCheckAnswer() ? "Y" : "N" %></td>
					</tr>
					<% } %>
				</tbody>
<%-- 				<c:forEach var="inquiry" items="inquiries"> --%>
<!-- 					<tr> -->
<%-- 						<td>${inquiry.idx }</td> --%>
<%-- 						<td>${inquiry.userNo }</td> --%>
<%-- 						<td>${inquiry.content }</td> --%>
<%-- 						<td>${inquiry.createdAt }</td> --%>
<%-- 						<td>${inquiry.checkAnswer }</td> --%>
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>
			</table>
			<div class="adm_bottom_page">
				<ul>
					<li>
						<a href="#"><img src="<%=root%>/static/img/lleft.png" alt=""/></a>
					</li>
					<li>
						<a href="#"><img src="<%=root%>/static/img/left.png" alt=""/></a>
					</li>
					<li>
						<a href="#">1</a>
					</li>
					<li>
						<a href="#">2</a>
					</li>
					<li>
						<a href="#">3</a>
					</li>
					<li>
						<a href="#"><img src="<%=root%>/static/img/right.png" alt=""/></a>
					</li>
					<li>
						<a href="#"><img src="<%=root%>/static/img/rright.png" alt=""/></a>
					</li>
				 </ul>
			 </div>
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/script.jsp" />
	</div>
 </div>
</body>
</html>