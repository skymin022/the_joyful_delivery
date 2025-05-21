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
			<div class="contact_container il">
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
						 	<label for="c_title">제목</label>
					  	 	<input class="check_trim" id="c_title" name="c_title" type="text" title="받는분의 이름을 입력해주세요." placeholder="제목을 입력해 주세요.">
						</li>
						<li>
						 	<label for="c_content">문의내용</label>
					  	 	<textarea id="c_content" name="c_content" rows="15" cols="62" placeholder="문의 내용을 입력해 주세요."></textarea>
						</li>
					</ul>
					<div class="values">
			  	 		<button type="button">파일1</button>
			  	 		<button type="button">파일2</button>
			  	 		<button type="button">파일3</button>
			  	 	</div>
			  	 	<div class="contact_upload">
			  	 		<label for="c_upload">파일 업로드</label>
				  	 	<input class="input_upload" id="c_upload" name="c_upload" type="text" title="업로드파일을 선택해주세요." placeholder="업로드할 파일을 불러와주세요." tabindex="-1" disabled>
						<button class="contact_btn_find" type="button">찾아보기</button>
			  	 	</div>
					<button class="contact_prev_btn" type="button" onclick="history.back()">이전</button>
					<button class="contact_submit_btn" type="submit">접수하기</button>
				</form>
			</div> <!-- contact_container il -->
		</div> <!-- container -->
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/footer.jsp" />
		<jsp:include page="/layout/script.jsp" />
	</div>
</body>
</html>