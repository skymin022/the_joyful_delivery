
<%@page import="DTO.FAQ"%>
<%@page import="java.util.List"%>
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
</head>
<body>
	<div class="wrapper">
	<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/serv_header.jsp" />
		<div class="container">
			<h2 class="title">고객센터</h2>
			<h3>자주 묻는 질문(FAQ)</h3>
			<!-- TODO: form태그 만들기 -->
			<div class="input_area">
				<input class="input_sear" name="keyword" type="text" placeholder="검색어" title="검색 키워드를 입력해주세요."/>
				<button class="search_icon"><img src="<%=root%>/static/img/search.png" alt="돋보기 이미지"/></button>
			</div>
			<div class="bg_container">
				<ul>
					<%
						List<FAQ> list = (List)request.getAttribute("faqList");
						for(FAQ faq : list) {
					%>
						<li>
							<img class="icon_img" alt="깃발이미지" src="<%=root%>/static/img/Megaphone.png">
							<p class="bor_txt">택배서비스</p>
							<p><%=faq.getTitle() %></p>
							<button type="button" class="dropdown">
								<img alt="드랍다운 화살표" src="<%=root%>/static/img/downarrow.png">
							</button>
						</li>
						<li class="answer">
							<p><%=faq.getContent() %></p>
						</li>
					<%}%>
				</ul>
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
		</div>
		<jsp:include page="/layout/footer.jsp" />
	</div>
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/layout/script.jsp" />
</body>
</html>