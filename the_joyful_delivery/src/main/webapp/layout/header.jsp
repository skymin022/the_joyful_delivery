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
<%-- 	<link href="<%= root %>/static/css/style.css" rel="stylesheet" /> --%>
<%-- 	<link href="<%= root %>/static/css/reset.css" rel="stylesheet" /> --%>
<%-- 	<link href="<%= root %>/static/css/ys.css" rel="stylesheet" /> --%>
</head>
<header>
	<nav>
		<a href="<%= root %>/index.jsp"><img src="<%= root %>/static/img/logo.png" width="380" height="153" ></a>
	    
	    
			<div class="header_wrap">
				<div>
					<ul class="header_top">
						<li>
							<a href="<%= root %>/search">
								<img src="<%= root %>/static/img/btn_search.png" width="30" height="30">
							</a>
						</li>
			
						<% if (loginId == null) { %>
							<li><a href="<%= root %>/page/login/login.jsp">로그인</a></li>
							<li><a href="<%= root %>/page/login/sign_up.jsp">회원가입</a></li>
						<% } else { %>
							<li><a href="<%= root %>/users/mypage-jsp">마이페이지</a></li>
							<li><a href="<%= root %>/users/logout">로그아웃</a></li>
						<% } %>
					</ul>
				</div>
			
				<div class="header_down">
					<ul class="header_down_1">
						<li><a href="<%= root %>/page/delivery/delivery_main.jsp">배송 조회</a></li>
						<li><a href="<%= root %>/page/serv_center/customer_sc.jsp">고객센터</a></li>
					</ul>
					<ul class="header_down_2">
						<li><a href="<%= root %>/search"><img src="<%= root %>/static/img/ico_social_instagram.png" width="35" height="35"></a></li>
						<li><a href="<%= root %>/search"><img src="<%= root %>/static/img/ico_social_youtube.png" width="35" height="35"></a></li>
						<li><a href="<%= root %>/search"><img src="<%= root %>/static/img/ico_social_kakaotalk.png" width="35" height="35"></a></li>
						<li>
							<div class="side">
								<input type="checkbox" id="offcanvas-toggle">
								<a href="javascript: ;">
									<label for="offcanvas-toggle" class="overlay"></label>
									<label for="offcanvas-toggle" class="bars">
										<span class="bar top"></span>
										<span class="bar bottom"></span>
									</label>
								</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
			
			<!-- 사이드 메뉴 로그인 관련 -->
			<div class="offcanvas">
				<div class="offcanvas_top">
					<ul>
						<% if (loginId == null) { %>
							<li><a href="<%= root %>/page/login/login.jsp">로그인</a></li>
							<li><a href="<%= root %>/page/login/sign_up.jsp">회원가입</a></li>
						<% } else { %>
							<li><a href="<%= root %>/users/mypage-jsp">마이페이지</a></li>
							<li><a href="<%= root %>/logout">로그아웃</a></li>
						<% } %>
					</ul>
				</div>
			
				<nav class="offcanvas_nav">
					<ul class="offcanvas_ul">
						<li><a href="#">공지사항</a></li>
						<li><a href="<%= root %>/page/delivery/delivery_main.jsp">배송조회하기</a></li>
						<li><a href="<%= root %>/page/serv_center/customer_sc.jsp">고객센터</a></li>
						<li><a href="<%= root %>/page/login/login.jsp">문의하기</a></li>
					</ul>
				</nav>
			</div>

		
	</nav>
</header>