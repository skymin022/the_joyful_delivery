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
		<div class="contact_container">
			<h2 class="contact_title">문의하기</h2>
			<div class="sm_container il">
				<form id="form" action="">
					<ul class="contact_input_list">
						<li>
						 	<label for="pre_pos">문의유형</label>
						 	<select id="pre_pos" name="pre_pos">
								<option disabled selected>유형선택</option>
								<option value="배송문의">배송문의</option>
								<option value="결제관련문의">결제관련문의</option>
								<option value="사고보상문의">사고보상문의</option>
								<option value="서비스관련문의">서비스관련문의</option>
								<option value="불편사항문의">불편사항문의</option>
							</select>
						</li>
						<li>
						 	<label for="r_name">제목</label>
					  	 	<input class="check_trim" id="r_name" name="r_name" type="text" title="받는분의 이름을 입력해주세요." placeholder="제목을 입력해 주세요.">
						</li>
						<li>
						 	<label for="r_number">문의내용</label>
					  	 	<textarea id="r_number" name="r_number" rows="20" cols="62" placeholder="문의 내용을 입력해 주세요."></textarea>
						</li>
					</ul>
					<div class="values">
			  	 		<button type="button">파일1</button>
			  	 		<button type="button">파일2</button>
			  	 		<button type="button">파일3</button>
			  	 	</div>
			  	 	<div>
			  	 		<label for="r_name">파일 업로드</label>
				  	 	<input class="check_trim" id="r_name" name="r_name" type="text" title="받는분의 이름을 입력해주세요." placeholder="업로드할 파일을 불러와주세요.">
						<button id="next_btn3" type="button">찾아보기</button>
			  	 	</div>
					<button id="prev_btn" type="button" onclick="history.back()">이전</button>
					<button id="next_btn3" type="submit">접수하기</button>
				</form>
			</div> <!-- sm_container -->
		</div> <!-- container -->
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/footer.jsp" />
		<jsp:include page="/layout/script.jsp" />
	</div>
</body>
</html>