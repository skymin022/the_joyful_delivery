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
	                        <img src="<%=root %>/static/img/plus.png" alt="">
	                        <input type="text" class="searchInput" id="searchInput" placeholder="검색어를 입력하세요" />
	                    </div>
	                    <div class="right">
	                        <span>|</span>
		                        <div class="list">
								    <label for="sendOption"></label>
								    <select id="sendOption" name="sendOption" class="box">
								        <option value="delivery">배송 내역</option>
								        <option value="sender" selected>보내는 사람</option>
								        <option value="receiver" selected>받는 사람</option>
								        <option value="address" selected>주소</option>
								    </select>
								</div>
	                    </div>
	                </div>
	                <div class="mid">
	                    <ul>
	                        <li>
								<button class="h2" type="button">선불</button>
					            <button class="h2" type="button">후불</button>
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
	                            <div>배송 완료</div>
	                        </div>
	                    </div>
						<div class="row-box">
							<div class="row-content">
								<div>1</div>
								<div>전자기기</div>
								<div>홍길동 / 서울 강남구 역삼동 123-45</div>
								<div>김철수 / 부산 해운대구 중동 678-90</div>
								<div>선불</div>
								<div>배송 전</div>
							</div>
						</div>

						<div class="row-box">
							<div class="row-content">
								<div>2</div>
								<div>의류</div>
								<div>이영희 / 인천 남동구 논현동 111-22</div>
								<div>박민수 / 대구 수성구 범어동 333-44</div>
								<div>후불</div>
								<div>배송 중</div>
							</div>
						</div>

						<div class="row-box">
							<div class="row-content">
								<div>3</div>
								<div>도서</div>
								<div>최수진 / 광주 북구 일곡동 555-66</div>
								<div>오세훈 / 대전 유성구 봉명동 777-88</div>
								<div>선불</div>
								<div>배송 완료</div>
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