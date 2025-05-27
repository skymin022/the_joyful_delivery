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
    padding: 25px 25px 30px 25px;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }
  .card small {
    font-size: 13px;
    color: #666666;
    display: block;
    margin-bottom: 8px;
    letter-spacing: 0.5px;
    font-weight: 600;
  }
  .title-row {
    display: flex;
    gap: 8px;  /* 간격 축소 */
    align-items: center;
    margin-bottom: 10px;
  }
  .card-title {
    font-size: 1em;
    font-weight: 700;
    color: #222222;
    line-height: 1.2;
    flex: none;               /* 공간 꽉 채우기 대신 필요한 만큼만 */
    white-space: nowrap;      /* 줄바꿈 방지 */
  }
  .price-highlight {
    font-size: 1.1em;
    color: #e53935;
    font-weight: 700;
    white-space: nowrap;

    margin-left: auto; /* 여기 추가: 오른쪽 정렬 */
  }
  .truck-row {
    display: flex;
    align-items: flex-start;
    gap: 16px;
    margin-top: 10px;
  }
  .icon {
    width: 48px;
    height: 48px;
    border-radius: 8px;
    object-fit: contain;
  }
  .price-list {
    font-size: 14px;
    flex: 1;
    color: #333333;
  }
  .price-list .row {
    display: flex;
    justify-content: space-between;
    margin: 7px 0;
  }
  .price-list .sub-note {
    font-size: 13px;
    color: #999999;
    padding-left: 18px;
    font-style: italic;
  }
  .price-list .sub-note span:last-child {
    color: #aaa;
  }
  .divider {
    border-top: 1px solid #eee;
    margin: 22px 0;
  }
  .button {
    display: block;
    width: 110px;
    margin: 0 auto;
    padding: 10px 0;
    background-color: #ffc658;
    color: white;
    border: none;
    border-radius: 22px;
    font-weight: 700;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }
  .button:hover {
    background-color: #ffb737;
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
            <div class="card-title">방문 택배 </div>
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
              <div class="row"><span>· 60cm 이하</span><span>2700원</span></div>
              <div class="row"><span>· 80cm 이하</span><span>3200원</span></div>
              <div class="row"><span>·140cm 이하</span><span>3700원</span></div>
            </div>
          </div>
          <div class="divider"></div>
          <a href="${pageContext.request.contextPath}/paypage.jsp" class="button">선택 하기</a>
        </div>
      </div>
    </main>
    <%-- [Contents] ######################################################### --%>
    <jsp:include page="/layout/footer.jsp" />
    <jsp:include page="/layout/script.jsp" />
  </div>
</body>
</html>
