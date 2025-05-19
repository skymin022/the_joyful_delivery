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
	<jsp:include page="/layout/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	<div class="container">
		<h2 class="title">배송현황</h2>	
		<div class="sm_container">
			<div class="img_area">
				<img alt="택배 이미지" src="<%=root%>/static/img/delivery.png">
			</div>
			<div class="stat_top">
				<ul>
					<li>
						<p>에약명</p>
						<p class="value">선물</p>
					</li>
					<li>
						<p>보내는분</p>
						<p class="value">이준*</p>
					</li>
					<li>
						<p>받는분</p>
						<p class="value">구본*</p>
					</li>
					<li>
						<p>배송지점</p>
						<p class="value">서울 남용산 (02-3274-0696)</p>
					</li>
				</ul>
			</div>
			<hr>
			<div class="stat_bottom">
				<div class="del_log">
					<ul>
						<li>13 : 30 [서울 남용산] 배달완료</li>
						<li>13 : 59 [곽두철] 배달출발</li>
						<li>16 : 30 [용산] 배달완료</li>
						<li>17 : 30 [김두한] 배달출발</li>
						<li>19 : 30 [서울 구로] 배달완료</li>
					</ul>
				</div>
			</div>
		</div> <!-- sm_container -->
		<div class="btn_area">
			<a href="<%=root%>/index.jsp">메인으로</a>
		</div>
	</div> <!-- wrapper -->
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>