<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/common.jsp" %>
<head>
	<style type="text/css" >
		nav {
			display: flex;
			justify-content: space-between;
		}
	</style>
</head>
<header>
	
	<nav>
			<img src="<%= root %>/static/img/logo.png" width="380" height="153" >
			<div class="header_wrap">
				<div>
					<ul class="header_top">
						<li><a href="<%= root%>/search"><img src="<%= root %>/static/img/btn_search.png" width="30" height="30"></a></li>
						<li><a href="<%= root %>/login.jsp">로그인</a></li>
						<li><a href="<%= root %>/signup.jsp">회원가입</a></li>
					</ul>
				</div>    
				<div class="header_down">
					<ul class="header_down_1">
						<li><a href="<%= root %>/login.jsp">배송 조회</a></li>
						<li><a href="<%= root %>/login.jsp">고객센터</a></li>
					</ul>
					<ul class="header_down_2">
						<li><a href="<%= root%>/search"><img src="<%= root %>/static/img/ico_social_instagram.png" width="35" height="35"></a></li>
						<li><a href="<%= root%>/search"><img src="<%= root %>/static/img/ico_social_youtube.png" width="35" height="35"></a></li>
						<li><a href="<%= root%>/search"><img src="<%= root %>/static/img/ico_social_kakaotalk.png" width="35" height="35"></a></li>
						<li><a href="<%= root%>/search"><img src="<%= root %>/static/img/btn_menu.png" width=35 height="35"></a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
</header>