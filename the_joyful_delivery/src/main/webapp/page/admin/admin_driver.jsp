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
						<li><a href="<%=root%>/admin/user">회원관리</a></li>
						<li><a href="<%=root%>/admin/delivery">택배관리</a></li>
						<li><a href="<%=root%>/admin/inquiry">문의</a></li>
						<li class="on"><a href="<%=root%>/admin/driver">기사관리</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<%-- [Contents] ######################################################### --%>
		<form action="<%=root%>/admin/delivery">
			<div class="ad_search">
				<ul>     
					<li><input name="where" id="comName"   value="comName"   type="radio"/><label for="comName">기사번호</label></li>
					<li><input name="where" id="drivName" value="drivName" type="radio"/><label for="drivName">기사이름</label></li>
					<li><input name="where" id="drivNum" value="drivNum" type="radio"/><label for="drivNum">기사연락처</label></li>
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
						<th>기사번호</th>
						<th>기사이름</th>
						<th>기사연락처</th>
					</tr>
				</thead>
				<tbody class="adm_tbody">
					<c:forEach var="driver" items="${drivers }">
					<tr>
						<td>${driver.idx}</td>
						<td>${driver.name }</td>
						<td>${driver.number }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="bottom_page">
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
		 </div>
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/script.jsp" />
	</div>
</body>
</html>