<%@page import="DTO.Announcement"%>
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
<style>


    .success-container {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 60px 20px;
      min-height: 700px;
    }

    .success-card {
      width: 100%;
      max-width: 500px;
      background-color: white;
      border-radius: 12px;
      padding: 40px 20px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      text-align: center;
    }

    .success-icon img {
      width: 60px;
      margin-bottom: 20px;
    }

    .success-message {
      font-size: 16px;
      color: #555;
      margin-bottom: 30px;
    }

    .success-button {
      padding: 12px 24px;
      background-color: #ffc658;
      border: none;
      border-radius: 24px;
      color: white;
      font-weight: bold;
      font-size: 14px;
      cursor: pointer;
    }

    .success-button:hover {
      background-color: #ffb737;
    }

   
  </style>
<body>
	<div class="wrapper main_back height">
		<jsp:include page="/layout/header.jsp" />
		<%-- [Contents] ######################################################### --%>
		<div class="success-container">
		    <div class="success-card">
		      <div class="success-icon">
		        <img src="./static/img/delivery.png" alt="성공 아이콘" />
		      </div>
		      <p class="success-message">결제가 성공적으로 완료 되었습니다.</p>
		      <button class="success-button" onclick="location.href='http://localhost:8080/the_joyful_delivery/page/delivery/delivery_main.jsp';">
		        결제 확인
		      </button>
		    </div>
		  </div>
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/footer.jsp" />
		<jsp:include page="/layout/script.jsp" />
	</div>
</body>
</html>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>결제 실패</title>
<jsp:include page="/layout/meta.jsp" />
<jsp:include page="/layout/link.jsp" />
<jsp:include page="/layout/common.jsp" />
<style>
.logo-area {
	display: flex;
	align-items: center;
	gap: 20px;
}

.logo-area img {
	height: 40px;
}

.nav-links {
	font-size: 14px;
	color: #333;
}

.nav-links a {
	margin: 0 10px;
	text-decoration: none;
	color: #333;
}

.header-right {
	display: flex;
	align-items: center;
	gap: 15px;
}

.header-right img {
	width: 24px;
	height: 24px;
}

.header-right a {
	font-size: 14px;
	text-decoration: none;
	color: #333;
	margin-left: 10px;
}

.success-container {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 60px 20px;
	height: 620px;
}

.success-card {
	width: 100%;
	max-width: 500px;
	background-color: white;
	border-radius: 12px;
	padding: 40px 20px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
	text-align: center;
}

.success-icon img {
	width: 60px;
	margin-bottom: 20px;
}

.success-message {
	font-size: 16px;
	color: #555;
	margin-bottom: 30px;
}

.success-button {
	padding: 12px 24px;
	background-color: #ffc658;
	border: none;
	border-radius: 24px;
	color: white;
	font-weight: bold;
	font-size: 14px;
	cursor: pointer;
}

.success-button:hover {
	background-color: #ffb737;
}
</style>
</head>
<body>
	<div class="wrapper">
		<!-- 헤더 -->
		<jsp:include page="/layout/header.jsp" />
		<!-- 본문 - 결제 완료 카드 -->
		<div class="success-container">
			<div class="success-card">
				<div class="success-icon">
					<img src="./static/img/delivery.png" alt="성공 아이콘" />
				</div>
				<p class="success-message">결제가 성공적으로 완료 되었습니다.</p>
				<a href="/the_joyful_delivery/users/mypage-jsp" class="success-button">결제 확인</a>
			</div>
		</div>
		<!-- 푸터 -->
		<jsp:include page="/layout/footer.jsp" />
	</div>
	<jsp:include page="/layout/script.jsp" />
</body>
</html>
