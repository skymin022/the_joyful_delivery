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
	<link rel="stylesheet" href="./static/css/checkout.css" />
</head>
<body>
	<jsp:include page="/layout/header.jsp" />
	<%-- [Contents] ######################################################### --%>

	<div class="card-container">
  <div class="card">
    <small>동일권 구분 없는 균일 가</small>
    <div class="title-row">
      <div class="card-title">직접 방문 택배</div>
      <div class="price-highlight">↓ 2800원 부터</div>
    </div>
    <div class="truck-row">
      <img class="icon" src="./static/img/image26.png" alt="트럭 이미지">
      <div class="price-list">
        <div class="row"><span>· 500g이하</span><span>2800원</span></div>
        <div class="row"><span>· 5kg이하</span><span>3600원</span></div>
        <div class="row sub-note"><span>↳ 점포수령</span><span>2200원</span></div>
      </div>
    </div>
    <div class="divider"></div>
    <button class="button">선택 하기</button>
  </div>

  <div class="card">
    <small>기사 방문 택배</small>
    <div class="title-row">
      <div class="card-title">다량 택배 배송</div>
      <div class="price-highlight">↓ 4300원 부터</div>
    </div>
    <div class="truck-row">
      <img class="icon" src="./static/img/image25.png" alt="트럭 이미지">
      <div class="price-list">
        <div class="row"><span>· 80cm이하</span><span>4300원</span></div>
        <div class="row"><span>·140cm이하</span><span>4800원</span></div>
        <div class="row"><span>·160cm이하</span><span>5800원</span></div>
      </div>
    </div>
    <div class="divider"></div>
    <button class="button">선택 하기</button>
  </div>

  <div class="card">
    <small>5박스 이상 접수 가능</small>
    <div class="title-row">
      <div class="card-title">다량 택배 배송</div>
      <div class="price-highlight">↓ 2700원 부터</div>
    </div>
    <div class="truck-row">
      <img class="icon" src="./static/img/image23.png" alt="트럭 이미지">
      <div class="price-list">
        <div class="row"><span>· 60cm이하</span><span>2700원</span></div>
        <div class="row"><span>·120cm이하</span><span>3400원</span></div>
        <div class="row"><span>·180cm이하</span><span>3600원</span></div>
      </div>
    </div>
    <div class="divider"></div>
    <button class="button">선택 하기</button>
  </div>
</div>

<!-- 카드 디자인 레이아웃 -->
<div class="flex justify-content-stretch align-items-center gap-30">
  <!--1-->
  <div class="card-lg">
    <a href=""><img src="" alt= ""></a>
  </div>
    </div>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>