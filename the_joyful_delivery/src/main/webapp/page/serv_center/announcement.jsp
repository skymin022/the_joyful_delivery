
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
			<h3>공지사항</h3>
			<form id="form_to_search" action="<%=root%>/serv_center/announcement/search">
				<div class="input_area">
					<input class="input_sear" name="keyword" type="text" placeholder="검색어" title="검색 키워드를 입력해주세요." value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>"/>
					<button onclick="document.getElementById('form_to_search').submit()" type="submit" class="search_icon"><img src="<%=root%>/static/img/search.png" alt="돋보기 이미지"/></button>
				</div>
			</form>
			<div class="bg_container">
				<ul>
					<c:forEach var="anno" items="${list }">
						<li>
							<img class="icon_img" alt="공지사항 아이콘" src="<%=root%>/static/img/Megaphone.png">
							<p class="bor_txt">택배서비스</p>
							<p class="ann_title">${anno.title}</p>
							<span class="date1">${anno.createdAt}</span>
							<button type="button" class="dropdown">
								<img alt="드랍다운 화살표" src="<%=root%>/static/img/downarrow.png">
							</button>
						</li>
						<li class="answer">
							<p>
								${anno.content}
							</p>
						</li>
					</c:forEach>
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