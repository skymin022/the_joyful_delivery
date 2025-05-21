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
    <link rel="stylesheet" type="text/css" href="<%= root %>/static/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%= root %>/static/css/login_list.css">
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/layout/header.jsp" />
		<%-- [Contents] ######################################################### --%>
		<main>
		
	        <div class="container">
	            <div class="search">
	                <div class="top">
	                    <div class="left">
	                        <img src="/src/main/webapp/static/img/plus.png" alt="">
	                        <h1>검색내용</h1>
	                    </div>
	                    <div class="right">
	                        <span>|</span>
	                        <div class="list">
	                            <h1>보내는 사람</h1>
	                            <img src="/src/main/webapp/static/img/down direction.png" alt="">
	                        </div>
	                    </div>
	                </div>
	                <div class="mid">
	                    <ul>
	                        <li>
	                            <h2>선불</h2>
	                            <h2>후불</h2>
	                            <h3>배송 완료</h3>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	            <div class="main-content">
	                <div class="tap">
	                    <span class="tab part1 active">배송 중 / 전</span>
	                    <span class="tab part2">배송 완료</span>
	                </div>
	                <div class="table-wrapper">
	                    <div class="table-header">
	                        <div>번호</div>
	                        <div>배송 내역</div>
	                        <div>보내는 사람 / 주소</div>
	                        <div>받는 사람 / 주소</div>
	                        <div>선불 / 후불</div>
	                        <div>배송 상태</div>
	                    </div>
	                    <div class="row-box">
	                        <div class="row-content">
	                            <div>1</div>
	                            <div>전자기기</div>
	                            <div>886 방배읍 - 인제, 강원 / 95154</div>
	                            <div>4085 신월동 - 군산, 경남 / 86656</div>
	                            <div>선불</div>
	                            <div>배송 전</div>
	                        </div>
	                    </div>
	                    <div class="row-box">
	                        <div class="row-content">
	                            <div>1</div>
	                            <div>전자기기</div>
	                            <div>886 방배읍 - 인제, 강원 / 95154</div>
	                            <div>4085 신월동 - 군산, 경남 / 86656</div>
	                            <div>선불</div>
	                            <div>배송 전</div>
	                        </div>
	                    </div>
	                    <div class="row-box">
	                        <div class="row-content">
	                            <div>1</div>
	                            <div>전자기기</div>
	                            <div>886 방배읍 - 인제, 강원 / 95154</div>
	                            <div>4085 신월동 - 군산, 경남 / 86656</div>
	                            <div>선불</div>
	                            <div>배송 전</div>
	                        </div>
	                    </div>
	
	
	                </div>
	            </div>
	        </div>
		
		</main>
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/footer.jsp" />
		<jsp:include page="/layout/script.jsp" />
	</div>
</body>
</html>