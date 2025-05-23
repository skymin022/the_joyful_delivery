<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/common.jsp" %>
<head>
</head>
<header>
	<div class="admin_header">
		<a href="<%= root %>/index.jsp"><img src="<%= root %>/static/img/logo.png" width="380" height="153" ></a>
		<nav>
			<ul>
				<li class="on"><a href="<%=root%>/page/admin/admin_user.jsp">회원관리</a></li>
				<li><a href="<%=root%>/page/admin/admin_delivery.jsp">택배관리</a></li>
				<li><a href="<%=root%>/page/admin/admin_inq.jsp">문의</a></li>
				<li><a href="<%=root%>/page/admin/admin_driver.jsp">기사관리</a></li>
			</ul>
		</nav>
	</div>
</header>