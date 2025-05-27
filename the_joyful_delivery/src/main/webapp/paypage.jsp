<%@page import="DTO.Announcement"%>
<%@page import="java.util.List"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
  .menu-area {
      display: flex;
      flex-direction: column;
      align-items: flex-end;
    }

    .top-menu {
      display: flex;
      flex-wrap: wrap;
      gap: 12px;
      font-size: 14px;
    }

    .top-menu a {
      text-decoration: none;
      color: #333;
    }

    .top-menu a:hover {
      text-decoration: underline;
    }

    .sns-icons {
      display: flex;
      gap: 10px;
      margin-top: 8px;
    }

    .sns-icons img {
      width: 24px;
      height: 24px;
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

</style>
	<title>project💻 - ALOHA CLASS🌴</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<div class="wrapper main_back">
		<jsp:include page="/layout/header.jsp" />
		<%-- [Contents] ######################################################### --%>
		
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
		
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/footer.jsp" />
		<jsp:include page="/layout/script.jsp" />
	</div>
	 <script>
    document.getElementById("cancel-button").addEventListener("click", function () {
      window.location.href = "http://127.0.0.1:5500/the_joyful_delivery/src/main/webapp/CheckoutPage.html?type=direct#여기";
    });

    document.getElementById("confirm-button").addEventListener("click", function () {
      // 50% 확률로 성공/실패 페이지 이동
      if (Math.random() < 0.5) {
        window.location.href = "http://127.0.0.1:5500/the_joyful_delivery/src/main/webapp/paysuccess.html";
      } else {
        window.location.href = "http://127.0.0.1:5500/the_joyful_delivery/src/main/webapp/payfail.html";
      }
    });
  </script>
</body>
</html>