<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.Delivery, DTO.SendingReceiving" %>
<%
    Delivery delivery = (Delivery) request.getAttribute("delivery");
    SendingReceiving sr = (delivery != null) ? delivery.getSendingReceiving() : null;
%>
<!DOCTYPE html>
<html>
<head>
    <title>배송현황</title>
    <jsp:include page="/layout/meta.jsp" />
    <jsp:include page="/layout/link.jsp" />
    <link rel="stylesheet" type="text/css" href="<%= root %>/static/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%= root %>/static/css/delivery_status.css">
</head>
<body>
<jsp:include page="/layout/header.jsp" />
<main>
	<div class=container>
    <div class="track-container">
        <div class="track-title">배송현황</div>
        <% if (delivery == null) { %>
            <p style="text-align:center; color:#888; margin:30px 0;">조회된 배송 정보가 없습니다.</p>
        <% } else { %>
            <div class="track-card">
                <div class="track-imgbox">
                    <img src="<%=request.getContextPath()%>/static/img/delivery.png" alt="택배 아이콘">
                </div>
                <div class="track-info">
                    <div class="track-info-row"><strong>예약명</strong> <%=delivery.getKeyword()%></div>
                    <div class="track-info-row"><strong>보내는 분</strong> <%=sr != null ? sr.getSName() : "" %></div>
                    <div class="track-info-row"><strong>받는 분</strong> <%=sr != null ? sr.getRName() : "" %></div>
                    <div class="track-info-row"><strong>배송지점</strong> <%=sr != null ? sr.getRAddress() : "" %></div>
                </div>
            </div>
            <hr class="track-divider">
            <div class="track-log-date"><%=delivery.getCreatedAt() != null ? new java.text.SimpleDateFormat("MM/dd").format(delivery.getCreatedAt()) : "" %></div>
            <ul class="track-log-list">
                <%-- 예시: 실제 배송 로그 여러 건이 있다면 반복문으로 출력
                     아래는 단일 상태만 출력, 여러 상태 로그가 있다면 List<RegionName> 등으로 반복 출력 --%>
                <li>
                    <%=delivery.getCreatedAt() != null ? new java.text.SimpleDateFormat("HH:mm").format(delivery.getCreatedAt()) : ""%>
                    [<%=sr != null ? sr.getRAddress() : ""%>] <%=delivery.getRegStatus()%>
                </li>
                <%-- 실제 로그가 여러 건이면 여기에 forEach로 출력 --%>
            </ul>
        <% } %>
        <button class="track-btn" onclick="location.href='<%=request.getContextPath()%>/index'">메인으로</button>
    </div>
	
	</div>
</main>
<jsp:include page="/layout/footer.jsp" />
<jsp:include page="/layout/script.jsp" />
</body>
</html>
