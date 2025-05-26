<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>결제 페이지</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/reset.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/checkout.css" />
  <style>
    html, body {
      height: 100%;
      margin: 0;
    }
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
      padding: 10px 30px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      border-bottom: 1px solid #ddd;
      height: 120px;
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
    main {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: #EFF6FF;
      box-sizing: border-box;
      padding: 60px;
    }
    .card-container {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-wrap: wrap;
      gap: 30px;
    }
    .card {
      width: 300px;
      background-color: #ffffff;
      border-radius: 12px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
      padding: 20px;
      box-sizing: border-box;
    }
    .card small {
      font-size: 12px;
      color: #888;
      display: block;
      margin-bottom: 4px;
    }
    .title-row {
      display: flex;
      gap: 25px;
      align-items: center;
    }
    .card-title {
      font-size: 1.1em;
      font-weight: bold;
    }
    .price-highlight {
      font-size: 1em;
      color: #e53935;
      font-weight: bold;
      margin-left: 30px;
    }
    .truck-row {
      display: flex;
      align-items: flex-start;
      gap: 14px;
      margin-top: 10px;
    }
    .icon {
      width: 50px;
      height: 50px;
    }
    .price-list {
      font-size: 14px;
      flex: 1;
    }
    .price-list .row {
      display: flex;
      justify-content: space-between;
      margin: 6px 0;
    }
    .sub-note span:last-child {
      color: #aaa;
    }
    .price-list .sub-note {
      font-size: 13px;
      color: #aaa;
      padding-left: 18px;
    }
    .divider {
      border-top: 1px solid #eee;
      margin: 20px 0;
    }
    .button {
      display: block;
      width: 100px;
      margin: 0 auto;
      padding: 8px 0;
      background-color: #ffc658;
      color: white;
      border: none;
      border-radius: 20px;
      font-weight: bold;
      text-align: center;
      text-decoration: none;
      cursor: pointer;
    }
    .button:hover {
      background-color: #ffb737;
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
  <!-- 헤더 -->
  <header>
    <div class="logo-area">
      <img src="${pageContext.request.contextPath}/static/img/logo.png" alt="로고" />
      <div class="nav-links">
        <a href="#">배송 조회</a>
        <a href="#">고객센터</a>
      </div>
    </div>
    <div class="header-right">
      <img src="${pageContext.request.contextPath}/static/img/ico_social_instagram_1.png" alt="인스타그램" />
      <img src="${pageContext.request.contextPath}/static/img/ico_social_youtube.png" alt="유튜브" />
      <img src="${pageContext.request.contextPath}/static/img/ico_social_kakaotalk.png" alt="카카오톡" />
      <a href="#">로그인</a>
      <a href="#">회원가입</a>
    </div>
  </header>

  <!-- 본문 -->
  <main>
    <div class="card-container">
      <!-- 카드 1 -->
      <div class="card">
        <small>동일권 구분 없는 균일 가</small>
        <div class="title-row">
          <div class="card-title">직접 방문 택배</div>
          <div class="price-highlight">↓ 2800원 부터</div>
        </div>
        <div class="truck-row">
          <img class="icon" src="${pageContext.request.contextPath}/static/img/image26.png" alt="트럭 이미지" />
          <div class="price-list">
            <div class="row"><span>· 500g이하</span><span>2800원</span></div>
            <div class="row"><span>· 5kg이하</span><span>3600원</span></div>
            <div class="row sub-note"><span>↳ 점포수령</span><span>2200원</span></div>
          </div>
        </div>
        <div class="divider"></div>
        <a href="${pageContext.request.contextPath}/paypage.jsp" class="button">선택 하기</a>
      </div>

      <!-- 카드 2 -->
      <div class="card">
        <small>기사 방문 택배</small>
        <div class="title-row">
          <div class="card-title">다량 택배 배송</div>
          <div class="price-highlight">↓ 4300원 부터</div>
        </div>
        <div class="truck-row">
          <img class="icon" src="${pageContext.request.contextPath}/static/img/image25.png" alt="트럭 이미지" />
          <div class="price-list">
            <div class="row"><span>· 80cm이하</span><span>4300원</span></div>
            <div class="row"><span>·140cm이하</span><span>4800원</span></div>
            <div class="row"><span>·160cm이하</span><span>5800원</span></div>
          </div>
        </div>
        <div class="divider"></div>
        <a href="${pageContext.request.contextPath}/paypage.jsp" class="button">선택 하기</a>
      </div>

      <!-- 카드 3 -->
      <div class="card">
        <small>5박스 이상 접수 가능</small>
        <div class="title-row">
          <div class="card-title">다량 택배 배송</div>
          <div class="price-highlight">↓ 2700원 부터</div>
        </div>
        <div class="truck-row">
          <img class="icon" src="${pageContext.request.contextPath}/static/img/image23.png" alt="트럭 이미지" />
          <div class="price-list">
            <div class="row"><span>· 60cm이하</span><span>2700원</span></div>
            <div class="row"><span>·120cm이하</span><span>3400원</span></div>
            <div class="row"><span>·180cm이하</span><span>3600원</span></div>
          </div>
        </div>
        <div class="divider"></div>
        <a href="${pageContext.request.contextPath}/paypage.jsp" class="button">선택 하기</a>
      </div>
    </div>
  </main>

  <!-- 푸터 -->
  <footer>
    <div class="footer-content">
      <img src="${pageContext.request.contextPath}/static/img/footer.png" alt="푸터 로고" class="footer-logo" />
    </div>
  </footer>
</body>
</html>
