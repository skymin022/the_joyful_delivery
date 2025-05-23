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
	<div class="wrapper contact_back">
		<jsp:include page="/layout/header.jsp" />
		<%-- [Contents] ######################################################### --%>
		<div class="imp_main_container">
		<p class="imp_title">이용불가 상품</p>
			<div class="impossible_product">
				<p class="ip_title">이용불가 상품</p>
				<ul>
					<li>모든 택배 상품은 내용물을 보호할 수 있도록 포장되어야 합니다. 부피가 작은 상품의 경우 운송장보다 큰 소형박스 (15cm x 7cm)에 재포장하여 접수하셔야 합니다.</li>
				</ul>
			</div>
			<div class="impossible_list">
				<ul>
				   <li>
					  	<span>
					  		<img src="<%= root %>/static/img/prohibited-1.png" alt="유리 및 도자기류" >
					  		<p>유리 및 도자기류</p>
					  	</span>
			  	   </li>
			  	   <li>
					  	<span>
					  		<img src="<%= root %>/static/img/prohibited-2.png" alt="부패/변질 우려상품" >
					  		<p>부패/변질 우려상품</p>
					  	</span>
			  	   </li>
			  	   <li>
					  	<span>
					  		<img src="<%= root %>/static/img/prohibited-3.png" alt="포장불량 상품" >
					  		<p>포장불량 상품</p>
					  	</span>
			  	   </li>
			  	   <li>
					  	<span>
					  		<img src="<%= root %>/static/img/prohibited-4.png" alt="박스 포장 안 된 캐리어" >
					  		<p>박스 포장 안 된 캐리어</p>
					  	</span>
			  	   </li>
			  	   <li>
					  	<span>
					  		<img src="<%= root %>/static/img/prohibited-5.png" alt="종이 쇼핑백" >
					  		<p>종이 쇼핑백</p>
					  	</span>
			  	   </li>
			  	   <li>
					  	<span>
					  		<img src="<%= root %>/static/img/prohibited-6.png" alt="액체류 (샴푸,화장품류)" >
					  		<p>액체류 (샴푸,화장품류)</p>
					  	</span>
			  	   </li>
			  	   <li>
					  	<span>
					  		<img src="<%= root %>/static/img/prohibited-7.png" alt="귀금속, 유가증권, 현금 등" >
					  		<p>귀금속, 유가증권, 현금 등</p>
					  	</span>
			  	   </li>
			  	   <li>
					  	<span>
					  		<img src="<%= root %>/static/img/prohibited-8.png" alt="예술품, 낚시류, 골프채" >
					  		<p>예술품, 낚시류, 골프채</p>
					  	</span>
			  	   </li>
			  	   <li>
					  	<span>
					  		<img src="<%= root %>/static/img/prohibited-9.png" alt="편지봉투, 운송장보다 작은 상품" >
					  		<p>편지봉투, 운송장보다 작은 상품</p>
					  	</span>
			  	   </li>
			  	   <li>
					  	<span>
					  		<img src="<%= root %>/static/img/prohibited-10.png" alt="전용 박스 외의 한약" >
					  		<p>전용 박스 외의 한약</p>
					  	</span>
			  	   </li>
			  	   <li>
					  	<span>
					  		<img src="<%= root %>/static/img/prohibited-11.png" alt="전자제품 내품 완충불량" >
					  		<p>전자제품 내품 완충불량</p>
					  	</span>
			  	   </li>
			  	   <li>
					  	<span>
					  		<img src="<%= root %>/static/img/prohibited-12.png" alt="재 발행 재생불가 화물" >
					  		<p>재 발행 재생불가 화물</p>
					  	</span>
			  	   </li>
			  	   <li>
					  	<span>
					  		<img src="<%= root %>/static/img/prohibited-13.png" alt="처방약(시한성)" >
					  		<p>처방약(시한성)</p>
					  	</span>
			  	   </li>
				</ul>
			</div>
			<div class="other_impossible_list">
				<p>기타 접수 금지 상품</p>
				<ul>
					<li>위험물 : 화약류, 총포류</li>
					<li>인화성, 휘발성 화물 : 난로, 가스통</li>
					<li>다른 화물에 피해를 입힐 수 있다고 판단되는 화물</li>
					<li>살아있는 동/식물 (애완동물)</li>
					<li>포장이 불가하여 제품의 성질이나 외관을 손상시킬 수 있는 화물 : 타이어 부품류</li>
					<li>운송도중 또는 운송기일 내 훼손 또는 부패가능성 화물</li>
				</ul>
			</div>
		</div>
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/footer.jsp" />
		<jsp:include page="/layout/script.jsp" />
	</div>
</body>
</html>