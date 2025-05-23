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
	<div class="wrapper">
		<jsp:include page="/layout/header.jsp" />
		<%-- [Contents] ######################################################### --%>
		<div class="container">
			<h2 class="title">택배접수</h2>
			<h3>물품정보</h3>
			<div class="sm_container il">
				<form id="form" action="" method="post">
					<ul class="input_list">
						<li>
						 	<label for="keyword">품목</label>
						 	<select id="keyword" name="keyword">
								<option disabled selected>품목 선택</option>
								<option value="의류">의류</option>
								<option value="서신/서류">서신/서류</option>
								<option value="가전제품류">가전제품류</option>
								<option value="과일류">과일류</option>
								<option value="곡물류">곡물류</option>
								<option value="한약류">한약류</option>
								<option value="식품류">식품류</option>
								<option value="잡화/서적류">잡화/서적류</option>
							</select>				
						</li>
						<li>
						 	<label for="value">물품가액</label>
					  	 	<input id="value" name="value" type="text" title="물품가액을 입력해주세요." placeholder="물품가액">
					  	 	<span class="value_txt">만원</span>
					  	 	<div class="values">
					  	 		<button type="button">1만원</button>
					  	 		<button type="button">3만원</button>
					  	 		<button type="button">5만원</button>
					  	 		<button type="button">10만원</button>
					  	 		<button type="button">50만원</button>
					  	 		<button type="button">99만원</button>
					  	 	</div>
					  	 	<p class="long_txt">
					  	 		&middot; 물품의 총 가액을 콤마( , )없이 입력하여 주세요. <br>
								&middot; 물품 가액이 50만원을 초과시 고가 할증운임 2,500원이 추가되며 100만원 이상은 &nbsp;&nbsp;접수 불가합니다.<br>
								&middot; 권역에 따른 배송비 산정은 물품을 발송하는 편의점 위치 기준함.<br>
								&nbsp;&nbsp; (보내는 분 주소 기준이 아님)<br>
								&middot; 물품가액은 배송 사고 시 보상의 기준이 되오며, 허위 기재 시 배송 과정에서 불이익이 발생할 수 있으니 실제 물품의 가치를 정확히 기재 바랍니다.<br>
					  	 	</p>
						</li>
						<li>
						 	<label for="reserv">예약명</label>
						 	<input id="reserv" name="reserv" type="text" placeholder="예약명">
						</li>
					</ul>
					<button id="next_btn" type="submit">다음으로</button>
				</form>
			</div> <!-- sm_container -->
		</div> <!-- container -->
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/footer.jsp" />
	</div> <!-- wrapper -->
	<jsp:include page="/layout/script.jsp" />
</body>
</html>