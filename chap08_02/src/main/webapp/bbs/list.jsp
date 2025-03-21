<%@page import="java.sql.Timestamp"%>
<%@page import="net.fullstack10.common.CommonDateUtil"%>
<%@page import="net.fullstack10.common.CommonPageUtil"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="net.fullstack10.common.CommonUtil"%>
<%@page import="net.fullstack10.bbs.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="net.fullstack10.bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../basic.css" rel="stylesheet" type="text/css">

<style>
form {
	width: 100%;
	padding: 5px;
	border: 1px solid black;
	border-bottom: none;
	text-align: center;
	line-height: 25px;
}
form > select, form > input {
	height: 25px;
}
table {
	width: 100%;
}
table, thead, tbody, th, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
}
th {
	text-align: center;
	height: 30px;
	background-color: #efefef;
}
td {
	padding: 2px;
}
.col40 {
	width: 40px;
}
.col60 {
	width: 60px;
}
.col180 {
	width: 180px;
}
.text-align {
	text-align: center;
}

a {
	text-decoration: none;
	color: black;
}
.btn-page, .btn-cur-page {
	padding: 4px;
}
.btn-page:hover {
	font-weight: bold;
	color: red;
}
.btn-cur-page {
	font-weight: bold;
}

#btnRegist {
	float: right;
}
</style>
</head>
<body>
<%
CommonUtil cUtil = new CommonUtil();

int total_count = 0;
int page_no = cUtil.parseInt(request.getParameter("page_no"), 1);
int page_size = 10;
int page_block_size = 10;
int page_skip_count = (page_no-1) * page_size;

// 게시글 조회
BbsDAO dao = new BbsDAO();

Map<String, Object> param = new HashMap<String, Object>();

String search_category = request.getParameter("search_category");
String search_word = request.getParameter("search_word");

if (search_category != null && !search_category.isEmpty()
	&& search_word != null && !search_word.isEmpty()) {
	param.put("search_category", search_category);
	param.put("search_word", search_word);
}

param.put("page_skip_count", page_skip_count);
param.put("page_size", page_size);

total_count = dao.getBbsTotalCount(param);
List<BbsDTO> bbsList = dao.getBbsList(param);

// 페이지네이션 객체
CommonPageUtil pUtil = new CommonPageUtil(page_no, page_size, total_count, page_block_size);
%>
<c:set var="total_count" value="<%=dao.getBbsTotalCount(param) %>" />
<c:set var="bbsList" value="<%=dao.getBbsList(param) %>" />
<c:set var="pUtil" value="<%=pUtil %>" />

	<div class="container">
		<h1>게시판 목록</h1>
		<p><b>전체 게시글 개수 : </b>${ total_count }</p>
		<form name="frmSearch" id="frmSearch" method="get">
			<select name="search_category" id="search_cateogory">
				<option value="" selected>선택</option>
				<option value="title">제목</option>
				<option value="content">글내용</option>
				<option value="member_id">작성자</option>
			</select>
			&nbsp;<input type="text" name="search_word" id="search_word" value="" maxlength="20" />
			&nbsp;<input type="submit" name="btn_search" id="btn_search" value="검색" />
		</form>
		
		<table>
			<thead>
				<tr>
					<th class="col40">선택</th>
					<th class="col40">번호</th>
					<th>제목</th>
					<th class="col60">조회수</th>
					<th class="col180">등록일</th>
					<th class="col40">삭제</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${ not empty bbsList }">
				<c:set var="bbs_no" value="<%=(page_no-1) * page_size %>" />
				<c:forEach var="dto" items="${ bbsList }" varStatus="loopStatus">
					<tr>
						<td class="text-align"><input type="checkbox" name="delete_idx" value="${ dto.getIdx() }" /></td>
						<td class="text-align">${ bbs_no + loopStatus.count }</td>
						<td><a href="view.jsp?no=${ dto.getIdx() }">${ dto.getTitle() }</a></td>
						<td class="text-align">${ dto.getRead_cnt() }</td>
						<td class="text-align">
							<fmt:parseDate var="pRegDate" value="${ dto.getReg_date() }" type="both" pattern="yyyy-MM-dd'T'HH:mm:ss" />
							<fmt:formatDate value="${ pRegDate }" type="both" pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
						<td class="text-align"><input type="button" class="btnDeleteRow" value="삭제" /></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${ empty bbsList }">
				<tr>
					<td colspan="6" >등록된 게시물이 없습니다.</td>
				</tr>
			</c:if>
				

				<tr>
					<td colspan="6" class="text-align">
						<c:set var="baseURL" value="<%=request.getRequestURI() %>" />
						<c:set var="queryString" value="<%=request.getQueryString() %>" />
						${ pUtil.printPagination(baseURL, queryString) }
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<input type="button" id="btnDeleteSelect" value="선택삭제" />
						<input type="button" id="btnDelete" value="전체삭제" />
						<input type="button" id="btnRegist" value="글쓰기" />
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<script>
		document.getElementById("btnRegist").addEventListener("click", (e) => {
			e.preventDefault();
		    e.stopPropagation();
		    
		    window.location.href = "regist.jsp";
		});
		
		
	</script>
</body>
</html>