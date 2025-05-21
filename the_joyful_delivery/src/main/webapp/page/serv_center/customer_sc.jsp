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
		<jsp:include page="/layout/header.jsp" />
		<div class="container">
			<h2 class="title">고객센터</h2>
			<h3>자주 묻는 질문</h3>
			<form action="">
				<div class="input_area">
					<input class="input_sear" name="keyword" type="text" placeholder="검색어" title="검색 키워드를 입력해주세요."/>
					<button class="search_icon"><img src="<%=root%>/static/img/search.png" alt="돋보기 이미지"/></button>
				</div>
			</form>
			<div class="bg_container">
				<ul>
					<li>
						<img alt="깃발이미지" src="<%=root%>/static/img/flags.png">
						<p class="bor_txt">택배서비스</p>
						<p>택배를 취소하고 싶어요</p>
						<button type="button" class="dropdown">
							<img alt="드랍다운 화살표" src="<%=root%>/static/img/downarrow.png">
						</button>
					</li>
					<li class="answer">
						<p>
						택배 취소는 기사님께서 수거해가지 않으셨을 경우에만 취소가 가능해요! <br> 접수 하신 후 2일이 되지 않으셨다면 접수하신 점포에서 근무자를 통해 취소가 가능하시며, <br>
						2일이 경과하신 경우에는 당사 고객센터(1234-5678)로 문의 주시면 됩니다.
						</p>
					</li>
					<li>
						<img alt="깃발이미지" src="<%=root%>/static/img/flags.png">
						<p class="bor_txt">택배서비스</p>
						<p>택배를 취소하고 싶어요</p>
						<button type="button" class="dropdown">
							<img alt="드랍다운 화살표" src="<%=root%>/static/img/downarrow.png">
						</button>
					</li>
					<li class="answer">
						<p>
						택배 취소는 기사님께서 수거해가지 않으셨을 경우에만 취소가 가능해요! <br> 접수 하신 후 2일이 되지 않으셨다면 접수하신 점포에서 근무자를 통해 취소가 가능하시며, <br>
						2일이 경과하신 경우에는 당사 고객센터(1234-5678)로 문의 주시면 됩니다.
						</p>
					</li>
					<li>
						<img alt="깃발이미지" src="<%=root%>/static/img/flags.png">
						<p class="bor_txt">택배서비스</p>
						<p>택배를 취소하고 싶어요</p>
						<button type="button" class="dropdown">
							<img alt="드랍다운 화살표" src="<%=root%>/static/img/downarrow.png">
						</button>
					</li>
					<li class="answer">
						<p>
						택배 취소는 기사님께서 수거해가지 않으셨을 경우에만 취소가 가능해요! <br> 접수 하신 후 2일이 되지 않으셨다면 접수하신 점포에서 근무자를 통해 취소가 가능하시며, <br>
						2일이 경과하신 경우에는 당사 고객센터(1234-5678)로 문의 주시면 됩니다.
						</p>
					</li>
					<li>
						<img alt="깃발이미지" src="<%=root%>/static/img/flags.png">
						<p class="bor_txt">택배서비스</p>
						<p>택배를 취소하고 싶어요</p>
						<button type="button" class="dropdown">
							<img alt="드랍다운 화살표" src="<%=root%>/static/img/downarrow.png">
						</button>
					</li>
					<li class="answer">
						<p>
						택배 취소는 기사님께서 수거해가지 않으셨을 경우에만 취소가 가능해요! <br> 접수 하신 후 2일이 되지 않으셨다면 접수하신 점포에서 근무자를 통해 취소가 가능하시며, <br>
						2일이 경과하신 경우에는 당사 고객센터(1234-5678)로 문의 주시면 됩니다.
						</p>
					</li>
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