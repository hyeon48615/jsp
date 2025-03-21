<%@page import="net.fullstack10.common.CommonDateUtil"%>
<%@page import="net.fullstack10.common.BbsPage"%>
<%@page import="net.fullstack10.bbs.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="net.fullstack10.common.CommonUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="net.fullstack10.bbs.BbsDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="net.fullstack10.common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, thead, tbody, th, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
}
th {
	text-align: center;
	width: 150px;
	height: 40px;
	background-color: #e3e3e3;
}
td {
	height: 30px;
}
.align_center{
	text-align:center;
}
.align_right{
	text-align:right;
}
.search_table {
	width: 820px;
	height: 40px;
	margin-top: 4px;
	margin-bottom: 4px;
}
.search_td{
	height:40px;
	padding-left: 8px;
}
.search_input{
	width:200px;
}

.td_height40 {
	height:40px;
}

.td_height100 {
	height:100px;
}

.td40 {
	width:40px;
}
.td50 {
	width:50px;
}
.td60 {
	width:60px;
}
.td200 {
	width:200px;
}
.td400 {
	width:400px;
}
.td800 {
	width:800px;
}

.title{
	padding: 0px 0px 0px 4px;
}

</style>

</head>
<body>
<%@ include file="/common/common_top.jsp" %>
<%-- <jsp:include page="/common/common_top.jsp" /> --%>

<h1>게시판 목록</h1>

<%
//1. JDBC 객체 생성
//2. 쿼리 구문 작성
//3. PreparedStatement 구문 생성 및 변수 할당
//4. 쿼리 수행
//5. 리소스 해지
//--> DAO 객체로 이동
int total_count = 0;
int total_page = 1;
int page_no = 1;
int page_size = 10;
int page_skip_count = 10;
int page_block_size = 10;
int page_block_start = 1;
int page_block_end = 1;

CommonUtil cUtil = new CommonUtil();
CommonDateUtil dUtil = new CommonDateUtil();

BbsDAO dao = new BbsDAO();
Map<String, Object> param = new HashMap<String, Object>();

String search_category = (request.getParameter("search_category") != null ? request.getParameter("search_category").trim() : "");
String search_word = (request.getParameter("search_word") != null ? request.getParameter("search_word").trim() : "");
page_no = cUtil.parseInt(request.getParameter("page_no"), "1");
page_skip_count = (page_no-1)*page_size;

String urlParam = "";
urlParam = "search_category="+(search_category != null && !search_category.isEmpty() ? search_category : "");
urlParam += "&search_word="+(search_word != null && !search_word.isEmpty() ? search_word : "");


if ( search_category != null && !search_category.isEmpty()
		&& search_word != null && !search_word.isEmpty()
		) {
	param.put("search_category", search_category);
	param.put("search_word", search_word);
}
param.put("page_skip_count", page_skip_count);
param.put("page_size", page_size);

total_count = dao.getBbsTotalCount(param);
List<BbsDTO> bbsList = dao.getBbsList(param);
dao.close();
%>

<form name="frmSearch" id="frmSearch" method="get">
<table class="search_table">
	<tr>
		<td class="search_td">
			<select name="search_category" id="search_category" class="search_select">
				<option value="" selected>선택</option>
				<option value="title" <%=(search_category.equals("title") ? " selected" : "") %>>제목</option>
				<option value="content" <%=(search_category.equals("content") ? " selected" : "") %>>글내용</option>
				<option value="user_id" <%=(search_category.equals("user_id") ? " selected" : "") %>>작성자</option>
			</select>
			&nbsp;&nbsp;
			<input type="text" name="search_word" id="search_word" value="<%=search_word %>" maxlength="20" class="search_input" />
			&nbsp;&nbsp;
			<input type="button" name="btn_search" id="btn_search" value="검색" />
		</td>
	</tr>
</table>

<input type="hidden" name="idx" id="idx" value="" />
<table>
<tbody>
	<tr>
		<td colspan="6">전체 게시글 수 : <%=total_count %></td>
	</tr>
	<thead>
		<tr>
			<th class="td50"><input type="button" id="btnCheckAll" value="전체선택" /></th>
			<th class="td50">번호</th>
			<th class="td400">제목</th>
			<th class="td50">조회수</th>
			<th class="td200">등록일</th>
			<th class="td50">삭제</th>
		</tr>
	</thead>
	<tbody>
<%
if ( !bbsList.isEmpty() ) {
	int row_no = (total_count - (page_no-1)*page_size);
	for(BbsDTO dto : bbsList) {
%>	
		<tr>
			<td class="align_center"><input type="checkbox" name="delete_idx" value="<%=dto.getIdx() %>" /></td>
			<td class="align_center"><%=row_no %></td>
			<td class="title"><a href="view.jsp?idx=<%=dto.getIdx() %>"><%=dto.getTitle() %></a></td>
			<td class="align_center"><%=dto.getRead_cnt() %></td>
			<td class="align_center"><%= dUtil.localDateTimeToString(dto.getReg_date()) %></td>
			<td class="align_center">
				<input type="button" id="btnOneDelete" value="삭제" />
			</td>
		</tr>
<%
		row_no--;
	}
} else {
%>
		<tr>
			<td colspan="6" class="td_height100 align_center">
				등록된 게시물 정보가 없습니다.
			</td>
		</tr>
<%
}
%>

		<tr>
			<td colspan="6" class="td_height40 align_center">
				<%=BbsPage.pagingArea(total_count, page_no, page_size, page_block_size, "list.jsp?") %>
			</td>
		</tr>

		<tr>
			<td colspan="6" class="td_height40 align_right">
				<input type="button" id="btnRegist" value="등록" />
				<input type="button" id="btnDeleteSelected" value="선택삭제" />
			</td>
		</tr>

	</tbody>

</tbody>
</table>
</form>

<script>
const btnRegist = document.getElementById("btnRegist");
btnRegist.addEventListener("click", function(e){
	e.preventDefault();
	e.stopPropagation();
	
	window.location.href="regist.jsp?page_no=<%=page_no%>&<%=urlParam%>";
});
const btnOneDelete = document.getElementById("btnOneDelete");
btnOneDelete.addEventListener("click", function(e){
	e.preventDefault();
	e.stopPropagation();
	
	const frm = document.getElementById("frmSearch");
	//alert(this.parentElement.parentElement.firstElementChild.firstElementChild.value);
	// 선택 삭제 루틴
	const confirm_flag = confirm("해당 글을 삭제하시게습니까?\n삭제된 글은 복구되지 않습니다.");
	if (confirm_flag){
		frm.idx.value = this.parentElement.parentElement.firstElementChild.firstElementChild.value;
		frm.action = "delete_ok.jsp";
		frm.submit();
	}
});

let check_flag = false;
const btnCheckAll = document.getElementById("btnCheckAll");
btnCheckAll.addEventListener("click", function(e){
	e.preventDefault();
	e.stopPropagation();

	check_flag = (check_flag ? false : true);
	const check = document.getElementsByName("delete_idx");
	for (let i=0; i<check.length; i++) {
		//alert(check[i].checked);
		//check[i].checked = (check[i].checked ? false : true);
		check[i].checked = check_flag;
	}

// 	const els = document.querySelectorAll("input[type='checkbox']");
// 	els.forEach((el)=>{
// 		el.checked = (el.checked ? false : true);
// 	});

});

const btnDeleteSelected = document.getElementById("btnDeleteSelected");
btnDeleteSelected.addEventListener("click", function(e){
	e.preventDefault();
	e.stopPropagation();

	// 선택 삭제 루틴
	
	const frm = document.getElementById("frmSearch");
	//alert(this.parentElement.parentElement.firstElementChild.firstElementChild.value);
	// 선택 삭제 루틴
	const confirm_flag = confirm("선택하신 글을 삭제하시게습니까?\n삭제된 글은 복구되지 않습니다.");
	if (confirm_flag){
		frm.action = "delete_all_ok.jsp";
		frm.method = "post";
		frm.submit();
	}
});
const btnSearch = document.getElementById("btn_search");
btnSearch.addEventListener("click", function(e){
	e.preventDefault();
	e.stopPropagation();
	
	const search_category = document.querySelector("#search_category");
// 	if(search_category.value.length < 1 || search_category.value == "" || search_category.value == null) {
// 		alert("검색 구분을 선택하세요.");
// 		search_category.focus();
// 		return false;
// 	}
	const search_word = document.querySelector("#search_word");
// 	if(search_word.value.length<1 || search_word.value == "" || search_word.value == null) {
// 		alert("검색어를 입력하세요.");
// 		search_word.focus();
// 		return false;
// 	}
	
	
	const frm = document.querySelector("#frmSearch");
	if ( 
		( search_category.value != "" && search_word.value != "" ) 
		|| ( search_category.value == "" && search_word.value == "" )
	){
		//frm.action = "list.jsp";
		frm.submit();
	} else {
	 	if(search_category.value.length < 1 || search_category.value == "" || search_category.value == null) {
			alert("검색 구분을 선택하세요.");
			search_category.focus();
			return false;
		}
	 	if(search_word.value.length<1 || search_word.value == "" || search_word.value == null) {
			alert("검색어를 입력하세요.");
			search_word.focus();
			return false;
		}
	}
	
	
	
	return;
}, false);
</script>

</body>
</html>