]<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="DTO.AskDTO"%>
<%@page import="java.util.List"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<AskDTO> list = (List)request.getAttribute("askList"); %>
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
			<h2 class="title">내 문의 내역</h2>
			<h3></h3>
			<!-- TODO: form태그 만들기 -->
			<div class="qna_container">
				<ul>
				<% for(AskDTO askDto : list) {%>
					<li>
						<img alt="사람이미지" src="<%=root%>/static/img/person.png">
						<p class="bor_txt"><%= askDto.getType() %></p>
						<p class="ask_title"><%= askDto.getTitle() %></p>
						<p class="ask_date"><%= askDto.getCreatedAt() %></p>
						<button type="button" class="dropdown">
							<img alt="드랍다운 화살표" src="<%=root%>/static/img/downarrow.png">
						</button>
					</li>
					<li class="answer admin">
						<p><%= askDto.getContent() %></p>
						<span class="qna_line"></span>
						<div class="answer_wrap">
							<p>관리자 : </p>
							<p><%= askDto.getCreatedAt() %></p>
						</div>
							<% if(askDto.getCheckAnswer() == 1) { %>
							<p class="admin_answer">
							<%-- <% ??????.getAnswer() %> --%>
							</p>
							<% } else { %>
								<p class="admin_answer">아직 답변이 등록되지 않았습니다.</p>
							<% } %>
					</li>
			<% } %>
					
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