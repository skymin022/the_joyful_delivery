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
						<li><a href="<%=root%>/page/admin/admin_com.jsp">택배사</a></li>
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
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/script.jsp" />
	</div>
</body>
</html>