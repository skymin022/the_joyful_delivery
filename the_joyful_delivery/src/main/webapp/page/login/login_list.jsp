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
    <link rel="stylesheet" type="text/css" href="<%= root %>/static/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%= root %>/static/css/login_list.css">
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/layout/header.jsp" />
		<%-- [Contents] ######################################################### --%>
		<main>

	        <div class="container">
	            <div class="search">
	                <div class="top">
	                    <div class="left">
	                        <img src="<%=root %>/static/img/plus.png" alt="">
	                        <input type="text" class="searchInput" id="searchInput" placeholder="검색어를 입력하세요" />
	                    </div>
	                    <div class="right">
	                        <span>|</span>
		                        <div class="list">
								    <label for="sendOption"></label>
								    <select id="sendOption" name="sendOption" class="box">
								        <option value="delivery">배송 내역</option>
								        <option value="sender" selected>보내는 사람</option>
								        <option value="receiver" selected>받는 사람</option>
								        <option value="address" selected>주소</option>
								    </select>
								</div>
	                    </div>
	                </div>
	                <div class="mid">
	                    <ul>
	                        <li>
								<button class="h2" type="button">선불</button>
					            <button class="h2" type="button">후불</button>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	            <div class="main-content">
	                <div class="tap">
	                    <span class="tab part1 active">배송 상태</span>
	                    <span class="tab part2">회원정보수정</span>
	                </div>
					 <div class="table-and-detail">
						 <div class="table-wrapper">
							 <div class="table-header">
								 <div>번호</div>
								 <div>배송 내역</div>
								 <div>보내는 사람 / 주소</div>
								 <div>받는 사람 / 주소</div>
								 <div>선불 / 후불</div>
								 <div>배송 상태</div>
							 </div>
							 <c:if test="${empty deliveries}">
                                 <div class="no-data">등록된 배송 내역이 없습니다.</div>
                              </c:if>	
							 <c:forEach var="delivery" items="${deliveries}">
								<div class="row-box row-content" onclick="...">
								    <input type="hidden" name="idx" value="${delivery.payment.idx}" />
								    <input type="hidden" name="pCard" value="${delivery.payment.PCard}" />
								    <input type="hidden" name="pAmount" value="${delivery.payment.PAmount}" />
								    <input type="hidden" name="pDate" value="${delivery.payment.PDate}" />
								
								    <div>${delivery.idx}</div>
								    <div>${delivery.value}</div>
								    <div>${delivery.sendingReceiving.SName} / ${delivery.sendingReceiving.SAddress}</div>
								    <div>${delivery.sendingReceiving.RName} / ${delivery.sendingReceiving.RAddress}</div>
								    <div>${delivery.prePos}</div>
								    <div>${delivery.status}</div>
								</div>
	
							 </c:forEach>

						</div>
						<div class="detail">
                        <div class="header">상세 내역</div>
                            <div class="form-group font">
                                <label>주문번호</label>
                                <input type="text" placeholder="주문번호" id="payment-idx" />
                            </div>
                            <div class="form-group font">
                                <label>카드정보</label>
                                <input type="text" placeholder="카드정보" id="payment-card" />
                            </div>
                            <div class="form-group font">
                                <label>결제날짜</label>
                                <input type="text" placeholder="결제날짜" id="payment-date" />
                            </div>
                            <div class="form-group font">
                                <label>금액</label>
                                <input type="text" placeholder="금액" id="payment-amount" />
                            </div>
                    	</div>
					 </div>
	            </div>
	        </div>

		</main>
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/footer.jsp" />
		<jsp:include page="/layout/script.jsp" />
		
		<script>

		</script>
	</div>
</body>
</html>























