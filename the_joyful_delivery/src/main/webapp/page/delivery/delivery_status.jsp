<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.Delivery" %>
<%
    Delivery delivery = (Delivery) request.getAttribute("delivery");
%>
<!DOCTYPE html>
<html>
<head>
    <title>배송현황</title>
    <jsp:include page="/layout/meta.jsp" />
    <jsp:include page="/layout/link.jsp" />
    <style>
        .delivery-status-box {
            background: #f4f8ff;
            border-radius: 16px;
            padding: 32px;
            max-width: 350px;
            margin: 40px auto;
        }
        .icon-area {
            text-align: center;
            margin-bottom: 16px;
        }
        .icon-area img {
            width: 60px;
        }
        .info-list, .log-list {
            list-style: none;
            padding: 0;
            margin: 0 0 16px 0;
        }
        .info-list li, .log-list li {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
            font-size: 14px;
        }
        .log-list li {
            font-size: 13px;
        }
        .btn-area {
            text-align: center;
            margin-top: 16px;
        }
        .btn-area a {
            background: #ffb74d;
            color: white;
            padding: 10px 32px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <jsp:include page="/layout/header.jsp" />
<!--         <div class="delivery-status-box"> -->
<!--             <div class="icon-area"> -->
<%--                 <img src="<%=request.getContextPath()%>/static/img/delivery.png" alt="택배 이미지" /> --%>
<!--             </div> -->
<!--             <ul class="info-list"> -->
<%--                 <li><span>예약명</span><span><%= delivery.getReserName() %></span></li> --%>
<%--                 <li><span>보내는 분</span><span><%= delivery.getSendingReceiving().getSName() %></span></li> --%>
<%--                 <li><span>받는 분</span><span><%= delivery.getSendingReceiving().getRName() %></span></li> --%>
<%--                 <li><span>배송지점</span><span><%= delivery.getSendingReceiving().getRAddress() %></span></li> --%>
<!--             </ul> -->
<!--             <hr /> -->
<!--             <ul class="log-list"> -->
<%--                 <% for (DeliveryLogDTO log : delivery.getLogs()) { %> --%>
<%--                     <li><%= log.getTime() %> [<%= log.getLocation() %>] <%= log.getStatus() %></li> --%>
<%--                 <% } %> --%>
<!--             </ul> -->
<!--             <div class="btn-area"> -->
<%--                 <a href="<%=request.getContextPath()%>/main">메인으로</a> --%>
<!--             </div> -->
<!--         </div> -->
        <jsp:include page="/layout/footer.jsp" />
    </div>
    <jsp:include page="/layout/script.jsp" />
</body>
</html>
