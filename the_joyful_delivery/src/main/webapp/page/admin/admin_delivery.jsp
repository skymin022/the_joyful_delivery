<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="service.RegionServiceImpl"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.List"%>
<%@page import="DTO.Delivery"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Delivery> list = (List) request.getAttribute("deliveries");
	int size = (int)request.getAttribute("size");
	
	// 
	StringBuilder queryWithoutPage = new StringBuilder();
	Map<String, String[]> paramMap = null;
	if(request.getParameterMap() != null) {
	    paramMap = request.getParameterMap();
	    for (Map.Entry<String, String[]> entry : paramMap.entrySet()) {
	        String key = entry.getKey();
	        if (!"page".equals(key)) {  // page 제외
	            for (String value : entry.getValue()) {
	                if (queryWithoutPage.length() > 0) {
	                    queryWithoutPage.append("&");
	                }
	                queryWithoutPage.append(key)
	                                .append("=")
	                                .append(value);
	            }
	        }
	    }
	}
	
	int currentPage = 0;
	if(request.getParameter("page") != null) {
		currentPage = Integer.parseInt(request.getParameter("page"));
	}
	
	String baseUrl = root + "/admin/delivery";
--%>
<!DOCTYPE html>
<html>
<head>
	<title>project💻 - ALOHA CLASS🌴</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
	<style type="text/css">
		body {
			background-color: #EEEEEE !important;
		}
	</style>
</head>
<body>
	<div class="wrapper">
		<header>
			<div class="admin_header">
				<a href="<%= root %>/index.jsp"><img src="<%= root %>/static/img/logo.png" width="380" height="153" ></a>
				<nav>
					<ul>
						<li><a href="<%=root%>/admin/user">회원관리</a></li>
						<li class="on"><a href="<%=root%>/admin/delivery">택배관리</a></li>
						<li><a href="<%=root%>/admin/inquiry">문의</a></li>
						<li><a href="<%=root%>/admin/driver">기사관리</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<%-- [Contents] ######################################################### --%>
		<form action="<%=root%>/admin/delivery">
			<div class="ad_search">
				<ul>     
					<li><input name="where" id="delNo"     value="idx"     type="radio"/><label for="delNo">송장번호</label></li>
					<li><input name="where" id="userNo"    value="user_idx"    type="radio"/><label for="userNo">회원번호</label></li>
					<li><input name="where" id="createdAt" value="created_at" type="radio"/><label for="createdAt">송장발행일</label></li>
					<li><input name="where" id="currLoc"   value="r_status"   type="radio"/><label for="currLoc">현재위치</label></li>
					<li><input name="where" id="status"    value="status"    type="radio"/><label for="status">배송상태</label></li>
				</ul>
				<div class="line"></div>
				<div style="position: relative;">
					<input type="text" name="where_txt">
					<button class="ad_search_icon"><img src="<%=root%>/static/img/search.png" alt="돋보기 이미지"/></button>
				</div>
			</div>		
		</form>
		<div class="adm_table">
			<table class="admin_table">
				<thead class="adm_th_wrap">
					<tr class="adm_th_tr">
						<th>송장번호</th>
						<th>회원번호</th>
						<th>담당기사</th>
						<th>송장발행일</th>
						<th>현재위치</th>
						<th>물품가액</th>
						<th>선불착불</th>
						<th>배송상태</th>
					</tr>
				</thead>
				<tbody class="adm_tbody">
					<%
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						for(Delivery del : list) {
							Timestamp _addTime = new Timestamp(del.getCreatedAt().getTime());
							String addTime = sdf.format(_addTime);
							// TODO: ORDER BY 로 가장 최근에 위치를 가져와야 함.
					%>
					<tr>
						<td><%=del.getIdx() %></td>
						<td><%=del.getUserIdx() %></td>
						<td><%=del.getDriverIdx() %></td>
						<td><%=addTime %></td>
						<td><%=del.getRegStatus() %></td>
						<td><%=del.getValue() %>만원</td>
						<td><%=del.getPrePos() %></td>
						<td><%=del.getStatus() %></td>
					</tr>
					<%} %>
				</tbody>
			</table>
			<div class="adm_bottom_page">
			    <ul>
			        <li>
			            <a href="<%= baseUrl + "?" + (queryWithoutPage.length() > 0 ? queryWithoutPage + "&" : "") + "page=0" %>">
			                <img src="<%=root%>/static/img/lleft.png" alt="처음"/>
			            </a>
			        </li>
			        <li>
			            <a href="<%= baseUrl + "?" + (queryWithoutPage.length() > 0 ? queryWithoutPage + "&" : "") + "page=" + Math.max(currentPage - 1, 0) %>">
			                <img src="<%=root%>/static/img/left.png" alt="이전"/>
			            </a>
			        </li>
			        <% for (int i = 0; i < size; i++) {
			               String pageQuery = "page=" + i;
			               String fullQuery;
			           
			               if (queryWithoutPage.length() > 0) {
			                   fullQuery = queryWithoutPage.toString() + "&" + pageQuery;
			               } else {
			                   fullQuery = pageQuery;
			               }
			           
			               String pageLink = baseUrl + "?" + fullQuery;
			        %>
			            <li><a href="<%= pageLink %>"><%= (i + 1) %></a></li>
			        <% } %>
			        <li>
			            <a href="<%= baseUrl + "?" + (queryWithoutPage.length() > 0 ? queryWithoutPage + "&" : "") + "page=" + Math.min(currentPage + 1, size - 1) %>">
			                <img src="<%=root%>/static/img/right.png" alt="다음"/>
			            </a>
			        </li>
			        <li>
			            <a href="<%= baseUrl + "?" + (queryWithoutPage.length() > 0 ? queryWithoutPage + "&" : "") + "page=" + (size - 1) %>">
			                <img src="<%=root%>/static/img/rright.png" alt="마지막"/>
			            </a>
			        </li>
			    </ul>
			</div>
		</div>
		<%-- [Contents] ######################################################### --%>
		<jsp:include page="/layout/script.jsp" />
	</div>
</body>
</html>