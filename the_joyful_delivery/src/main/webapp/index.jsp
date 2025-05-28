<%@page import="DTO.Announcement"%>
<%@page import="java.util.List"%>
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
	<div class="wrapper main_back">
		<jsp:include page="/layout/header.jsp" />
		<%-- [Contents] ######################################################### --%>
		<div class="main_container">
			<div class="main_left">
			    <div class="input_delivery_no">
			      <input type="text" placeholder="운송장 번호를 입력해 주세요." />
			      <span><img src="<%= root %>/static/img/btn_search.png" alt="송장입력창"></span>
			    </div>
			    <div class="booking_box_wrap">
			      <a href="<%= root %>/page/delivery/delivery_rec1.jsp" class="booking_box">
			        <div><p>택배<br>접수하기</p></div>
			        <span><img src="<%= root %>/static/img/box_white.png" alt="택배박스" ></span>
			      </a>
			      <div class="info_how">
			        <div><p>이용안내</p></div>
			        <span><img src="<%= root %>/static/img/box_white.png" alt="택배박스" ></span>
			      </div>
		        </div>
			    <div class="notice_wrap">
			    	<div class="notice">
				    	<p>공지사항</p>
			    	</div>
			    	<%
			    		List<Announcement> list = (List)request.getAttribute("list");
			    		for(Announcement anno : list) {
			    	%>
				    	<div class="anno_line">
					    	<p class="title1"><%=anno.getTitle() %></p>
					    	<p class="title_date"><%=anno.getCreatedAt() %></p>
				    	</div>
			    	<%} %>
			    </div>
			    <div class="customer_service">
			    	<div class="serv_center">
				    	<p>고객센터</p>
			    	</div>
			    	<div class="service_wrap">
						<ul class="service_list">
						  <li>
						  	<a href="<%= root %>/serv_center/faq">
							  	<span>
							  		<img src="<%= root %>/static/img/headphone.png" alt="" >
							  		<p>자주하는 질문<br>(FAQ)</p>
							  	</span>
						  	</a>
					  	  </li>
				          <li><span class="line"></span></li>
				          <li>
				          	<a href="<%=root%>/page/serv_center/contact.jsp">
				          		<span>
							  		<img src="<%= root %>/static/img/contact.png" alt="" >
							  		<p>1:1 문의</p>
							  	</span>
				          	</a>
			          	  </li>
				          <li><span class="line"></span></li>
				          <li>
					          <a href="">
						          <span>
								  	  <img src="<%= root %>/static/img/cashbill.png" alt="" >
								  	  <p>결제내역<br>조회</p>
						  		  </span>
					          </a>
				          </li>
				          <li><span class="line"></span></li>
				          <li>
					          <a href="<%=root%>/impossible_product.jsp">
					          	<span>
							  		<img src="<%= root %>/static/img/nobox.png" alt="" >
							  		<p>이용불가<br>상품</p>
							  	</span>
					          </a>
				          </li>
						</ul>
					 </div>
			    </div>
    		 </div>
  			<div class="main_right">
  				<div class="main_right_wrap1">
  					<div class="main_img_slide">
					    <div class="main_slide" id="main_slide">
					      <img src="<%= root %>/static/img/mainslide1.jpg" alt="슬라이드1">
					      <img src="<%= root %>/static/img/mainslide2.jpg" alt="슬라이드2">
					      <img src="<%= root %>/static/img/mainslide3.jpg" alt="슬라이드3">
					    </div>
					</div>
  				</div>
<!-- 			      <div class="main_right_top1"> -->
<!-- 			        <div><p>택배<br>예약하기</p></div> -->
<%-- 			        <span><img src="<%= root %>/static/img/box_white.png" alt="택배박스" ></span> --%>
<!-- 			      </div> -->
<!-- 			      <div class="main_right_top2"> -->
<!-- 			        <div><p>택배<br>예약하기</p></div> -->
<%-- 			        <span><img src="<%= root %>/static/img/box_white.png" alt="택배박스" ></span> --%>
<!-- 			      </div> -->
<!-- 		        </div> -->
		        
		        <div class="main_right_wrap2">
			      <div class="main_right_bottom1">
			        <div><p>택배<br>예약</p></div>
			        <span><img src="<%= root %>/static/img/box_white.png" alt="택배박스" ></span>
			      </div>
			      <div class="main_right_bottom2">
			        <div><p>택배<br>예약하기</p></div>
			        <span><img src="<%= root %>/static/img/box_white.png" alt="택배박스" ></span>
			      </div>
		        </div>
  			</div>
	</div>
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/footer.jsp" />
		<jsp:include page="/layout/script.jsp" />
	</div>
</body>
</html>