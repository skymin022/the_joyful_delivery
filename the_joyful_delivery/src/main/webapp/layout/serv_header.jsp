<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/common.jsp" %>
<%@ include file="/layout/jstl.jsp" %>
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
		<a href="<%= root %>/index"><img src="<%= root %>/static/img/logo.png" width="380" height="153" ></a>
		<div class="header_wrap">
			<div>
				<ul class="header_top">
					<li><a href="<%= root %>/search"><img src="<%= root %>/static/img/btn_search.png" width="30" height="30"></a></li>
					<c:if test="${ empty loginUser }">
						<li><a href="<%= root %>/page/login/login.jsp">로그인</a></li>
						<li><a href="<%= root %>/page/login//sign_up.jsp">회원가입</a></li>
					</c:if>
					<c:if test="${not empty loginUser }">
						<li><a href="<%= root %>/users/mypage-jsp">마이페이지</a></li>
						<li><a href="<%= root %>/users/logout">로그아웃</a></li>
					</c:if>
				</ul>
			</div>    
			<div class="header_down">
				<ul class="header_down_1">
					<li><a href="<%= root %>/page/delivery/delivery_main.jsp">배송조회</a></li>
					<li><a href="<%= root %>/serv_center/faq">자주묻는질문</a></li>
					<li><a href="<%= root %>/serv_center/announcement">공지사항</a></li>
					<c:if test="${ not empty loginUser}">
						<li><a href="<%= root %>/page/serv_center/contact.jsp">문의하기</a></li>
						<li><a href="<%= root %>/page/serv_center/myqna.jsp">내문의사항</a></li>
	            	</c:if>
				</ul>
				<ul class="header_down_2">
					<li><a href="<%= root%>/search"><img src="<%= root %>/static/img/ico_social_instagram.png" width="35" height="35"></a></li>
					<li><a href="<%= root%>/search"><img src="<%= root %>/static/img/ico_social_youtube.png" width="35" height="35"></a></li>
					<li><a href="<%= root%>/search"><img src="<%= root %>/static/img/ico_social_kakaotalk.png" width="35" height="35"></a></li>
					<li>
						<div class="side">
							<!-- checkbox -->
					        <input type="checkbox" id="offcanvas-toggle">
					        <!-- a href="javascript ;"  : a 태그 링크 이동 막기 -->
					        <a href="javascript: ;">
					        <!-- 오버레이 -->
       						<label for="offcanvas-toggle" class="overlay"></label>
       						 
					         <label for="offcanvas-toggle" class="bars">
					           <span class="bar top"></span>
<!-- 					           <span class="bar mid"></span> -->
					           <span class="bar bottom"></span>
					         </label>
					        </a>
				        </div>
					</li>
				</ul>
			</div>
		</div>
			<div class="offcanvas">
	        <div class="offcanvas_top">
	            <ul>
	            	<c:if test="${ empty loginUser }">
						<li><a href="<%= root %>/page/login/login.jsp">로그인</a></li>
						<li><a href="<%= root %>/page/login//sign_up.jsp">회원가입</a></li>
					</c:if>
					<c:if test="${not empty loginUser }">
						<li><a href="<%= root %>/users/mypage-jsp">마이페이지</a></li>
						<li><a href="<%= root %>/users/logout">로그아웃</a></li>
					</c:if>
				</ul>
	        </div>
	        <nav class="offcanvas_nav">
	            <ul class="offcanvas_ul">
	                <li><a href="">공지사항</a></li>
	                <li><a href="<%= root %>/page/delivery/delivery_main.jsp">배송조회하기</a></li>
	                <li><a href="<%= root %>/serv_center/faq">고객센터</a></li>
	                <li><a href="<%= root %>/page/login/login.jsp">문의하기</a></li>
	            </ul>
	        </nav>
   		</div>
	</nav>
</header>