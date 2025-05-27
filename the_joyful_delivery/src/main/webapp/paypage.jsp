<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>결제 페이지</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/reset.css" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/checkout.css" />
  <style>
     body {
      font-family: 'Arial', sans-serif;
      background-color: #EFF6FF;
      margin: 0;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }
    header {
      background-color: #fff;
      padding: 10px 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      border-bottom: 1px solid #ddd;
      box-sizing: border-box;
    }
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
    .card-container {
      display: flex;
      justify-content: center;
      flex-wrap: wrap;
      padding: 40px 20px;
      gap: 30px;
    }
    .card {
      width: 300px;
      background-color: #ffffff;
      border-radius: 12px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      padding: 20px;
      box-sizing: border-box;
      border: 2px solid #65FB13;
    }
    .card small {
      font-size: 12px;
      color: #888;
      display: block;
      margin-bottom: 4px;
    }
    .card-title {
      font-size: 16px;
      font-weight: bold;
      margin-bottom: 5px;
    }
    .price-highlight {
      color: #ff6666;
      font-weight: bold;
      margin-left: 30px;
    }
    .title-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 25px;
    }
    .price-list {
      font-size: 14px;
      margin-bottom: 20px;
    }
    .price-list .row {
      display: flex;
      justify-content: space-between;
      margin: 6px 0;
    }
    .divider {
      border-top: 1px solid #eee;
      margin: 20px 0;
    }
    .button-row {
      display: flex;
      justify-content: space-between;
      gap: 12px;
      margin-top: 10px;
    }
    .button {
      flex: 1;
      padding: 10px 0;
      border: none;
      border-radius: 20px;
      font-weight: bold;
      cursor: pointer;
      text-align: center;
      background-color: #ffc658;
      color: white;
    }
    .button:hover {
      background-color: #ffb737;
    }
    .form-group {
      display: flex;
      flex-direction: column;
      margin-bottom: 15px;
    }
    .form-group label {
      margin-bottom: 6px;
      font-weight: bold;
    }
    .form-group input {
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 6px;
      font-size: 14px;
    }
    .submit-button {
      width: 100%;
      margin-top: 10px;
      padding: 10px 0;
      border: none;
      border-radius: 20px;
      font-weight: bold;
      cursor: pointer;
      background-color: #ffc658;
      color: white;
      text-align: center;
    }
    .submit-button:hover {
      background-color: #ffb737;
    }
    .item-card {
      border: none;
      background-color: transparent;
      box-shadow: none;
    }
    .item-title {
      font-weight: bold;
      font-size: 16px;
      margin: 10px 0;
    }
    .item-image {
      width: 100%;
      height: 80px;
      margin: 10px 0;
      border-radius: 12px;
      border: 1px solid #ccc;
      background-image:
        linear-gradient(45deg, #eee 25%, transparent 25%),
        linear-gradient(-45deg, #eee 25%, transparent 25%),
        linear-gradient(45deg, transparent 75%, #eee 75%),
        linear-gradient(-45deg, transparent 75%, #eee 75%);
      background-size: 20px 20px;
      background-position: 0 0, 0 10px, 10px -10px, -10px 0px;
    }
    footer {
      background-color: #F5F6FF;
      width: 100vw;
      position: relative;
      left: 50%;
      right: 50%;
      margin-left: -50vw;
      margin-right: -50vw;
      padding: 20px 0;
      box-sizing: border-box;
      text-align: center;
      font-size: 14px;
      color: #666;
      border-top: 1px solid #ddd;
      flex-shrink: 0;
    }
    .footer-content {
      max-width: 1200px;
      margin: 0 auto;
    }
    .footer-logo {
      max-width: 70%;
      height: auto;
      display: block;
      margin: 0 auto;
    }
  </style>
</head>
<body>
<header>
  <div class="logo-area">
    <img src="<%=request.getContextPath()%>/static/img/logo.png" alt="로고" />
    <div class="nav-links">
      <a href="#">배송 조회</a>
      <a href="#">고객센터</a>
    </div>
  </div>
  <div class="header-right">
    <img src="<%=request.getContextPath()%>/static/img/ico_social_instagram_1.png" alt="인스타그램" />
    <img src="<%=request.getContextPath()%>/static/img/ico_social_youtube.png" alt="유튜브" />
    <img src="<%=request.getContextPath()%>/static/img/ico_social_kakaotalk.png" alt="카카오톡" />
    <a href="#">로그인</a>
    <a href="#">회원가입</a>
  </div>
</header>

<div class="card-container">
  <!-- 주문/송장 카드 -->
  <div class="card item-card">
    <div class="form-group">
      <label for="order-number">주문 번호</label>
      <input type="text" id="order-number" name="orderNumber" />
    </div>
    <div class="form-group">
      <label for="tracking-number">송장 번호</label>
      <input type="text" id="tracking-number" name="trackingNumber" />
    </div>
    <h4 class="item-title">물품 목록</h4>
    <div class="item-image"></div>
    <div class="item-image"></div>
  </div>

  <!-- 결제 카드 -->
  <div class="card">
    <div class="title-row">
      <div class="card-title">총 결제 금액</div>
      <div class="price-highlight">${totalPrice}원</div>
    </div>
    <div class="truck-row">
      <div class="price-list">
        
        <div class="row"><span>· 기본운임</span><span>5500원</span></div>
        <div class="row"><span>· 배달 수수료</span><span>1000원</span></div>
        <div class="row"><span>· 최종 운임</span><span>${totalPrice}원</span></div>
      </div>
    </div>
    <div class="divider"></div>

    <!-- 결제 폼 시작 -->
    <form method="post" action="${pageContext.request.contextPath}/paypage">
      <div class="payment-method">
        <p style="font-weight: bold; margin-bottom: 10px;">
          <span style="color: green; font-weight: bold;">✔</span> 카드결제
        </p>
        <div class="form-group">
          <input type="text" name="cardNumber" placeholder="카드번호 입력해주세요" required />
        </div>
        <div class="form-group">
          <input type="text" name="payerName" placeholder="입금자명(미 입력시 주문자 명)" />
        </div>
        <p style="font-size: 12px; color: red; margin-top: 5px;">
          주문 후 3시간 동안 미지급 시 자동 취소 됩니다.
        </p>
      </div>
      <div class="divider"></div>
      <div class="button-row">
        <button type="button" class="button cancel" id="cancel-button">결제 취소</button>
        <button type="submit" class="button confirm" id="confirm-button">결제 하기</button>
      </div>
    </form>
    <!-- 결제 폼 끝 -->
  </div>

  <!-- 배송 정보 카드 -->
  <div class="card">
    <div class="title-row">
      <div class="card-title">배송 정보 확인</div>
    </div>
    <div class="form-group">
      <label for="sender-name">배송자 이름</label>
      <input type="text" id="sender-name" name="senderName" placeholder="이름을 입력하세요">
    </div>
    <div class="form-group">
      <label for="password">송장 번호</label>
      <input type="password" id="password" name="invoiceNumber" placeholder="ex)송장번호">
    </div>
    <div class="form-group">
      <label for="phone">핸드폰 번호</label>
      <input type="tel" id="phone" name="phone" placeholder="010-0000-0000">
    </div>
    <div class="form-group">
      <label for="email">E-mail</label>
      <input type="email" id="email" name="email" placeholder="이메일 주소 입력">
    </div>
    <div class="form-group">
      <label for="receiver-name">받는 분 이름</label>
      <input type="text" id="receiver-name" name="receiverName" placeholder="이름 입력">
    </div>
    <div class="form-group">
      <label for="address">받는 분 주소</label>
      <input type="text" id="address" name="address" placeholder="주소 입력">
    </div>
    <div class="form-group">
      <input type="text" id="address-detail" name="addressDetail" placeholder="상세 주소 입력">
    </div>
    <div class="divider"></div>
  </div>
</div>

<footer>
  <div class="footer-content">
    <img src="<%=request.getContextPath()%>/static/img/footer.png" alt="푸터 로고" class="footer-logo" />
  </div>
</footer>

<script>
  document.getElementById("cancel-button").addEventListener("click", function () {
    window.location.href = "<%=request.getContextPath()%>/CheckoutPage.jsp?type=direct#여기";
  });
  
  function validateForm() {
	    const cardNumber = document.getElementById("cardNumber").value.trim();

	    if (cardNumber === "") {
	      alert("카드 번호를 입력하세요.");
	      return false; // 폼 제출 막기
	    }

	    return true; // 유효성 통과 → 서버로 제출
	  }
  
</script>
</body>
</html>
