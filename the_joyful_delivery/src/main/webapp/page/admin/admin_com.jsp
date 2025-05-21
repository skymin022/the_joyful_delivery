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
						<li><a href="<%=root%>/page/admin/admin_delivery.jsp">택배관리</a></li>
						<li><a href="<%=root%>/page/admin/admin_inq.jsp">문의</a></li>
						<li class="on"><a href="<%=root%>/page/admin/admin_com.jsp">택배사</a></li>
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
					<li><input name="where" id="comName"   value="comName"   type="radio"/><label for="comName">택배사명</label></li>
					<li><input name="where" id="comNum" value="comNum" type="radio"/><label for="comNum">택배사연락처</label></li>
				</ul>
			</div>		
		</form>
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/script.jsp" />
	</div>
</body>
</html>