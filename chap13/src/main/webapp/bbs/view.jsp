<%@page import="java.net.URLEncoder"%>
<%@page import="net.fullstack10.common.CommonDateUtil"%>
<%@page import="net.fullstack10.common.JSFunction"%>
<%@page import="net.fullstack10.bbs.BbsDTO"%>
<%@page import="net.fullstack10.bbs.BbsDAO"%>
<%@page import="net.fullstack10.common.CommonUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	table, thead, tbody, th, tr, td {
		border:1px solid black;
		border-collapse: collapse;
	}
	th {
		text-align:center;
		width:120px;
		height:20px;
		background-color: #efefef;
	}
	.input_col {
		width:400px;
		height:40px;
	}
	.input_box {
		width:400px;
		height:20px;
		margin:2px 0px 2px 4px;
	}
	.input_box_id {
		width:200px;
		height:20px;
		margin:2px 0px 2px 4px;
	}
	.align_cener {
		text-align: center;
	}
	.input_content_area {
		padding:4px;
	}
	.input_content {
		resize : none;
	}
	.btn_area {
		height:40px;
		margin:4px;
	}
	
</style>
</head>
<body>

<%@ include file="/common/common_top.jsp" %>
<%-- <jsp:include page="/common/common_top.jsp" /> --%>

<h1>게시판 조회 페이지</h1>

<%
CommonUtil cUtil = new CommonUtil();
CommonDateUtil dUtil = new CommonDateUtil();

int idx = cUtil.parseInt(request.getParameter("idx"));
String rtnParam = URLEncoder.encode(request.getRequestURI(), "UTF-8");

if ( idx < 1 ){
	JSFunction.alertLocation(response, "replace", "접근 경로가 올바르지 않습니다", "list.jsp?"+rtnParam); 
}

BbsDAO dao = new BbsDAO();
BbsDTO dto = dao.getBbsView(idx);
dao.close();
%>
<form name="frmView" id="frmView" method="get">
<input type="hidden" name="idx" idx="idx" value="<%=idx %>" />

<table>
<tbody>
	<tr>
		<th>작성자 : </th>
		<td class="input_col"><%=dto.getUser_id()%></td> 
		<th>작성일 : </th>
		<td class="input_col"><%= dUtil.localDateTimeToString(dto.getReg_date()) %></td> 
	</tr>
	<tr>
		<th>제목 : </th>
		<td colspan="3" class="input_col"><%=dto.getTitle()%></td> 
	</tr>
	<tr>
		<th>내용 : </th>
		<td colspan="3" class="input_content_area"><%=dto.getContent()%></td> 
	</tr>
	<tr>
		<td colspan="4" class="align_cener btn_area">
			<input type="button" id="btnModify" value="글수정" />
			<input type="button" id="btnDelete" value="글삭제" />
			<input type="button" id="btnList" value="목록으로" />
		</td>
	</tr>
	
</tbody>
</table>
</form>

<script>
// 회원 등록
const btnModify = document.getElementById("btnModify");
btnModify.addEventListener("click", (e)=>{
	e.preventDefault();
	e.stopPropagation();
	
	const frm = document.querySelector("#frmView");
	const idx = frm.idx.value;

	if (idx == "" || idx < 0){
		alert("접근 경로가 올바르지 않습니다.");
		window.location.replace("list.jsp");
		return;
	}
	
 	frm.action = "modify.jsp";
 	frm.method = "get";
	frm.submit();
});

//등록 취소
const btnDelete = document.getElementById("btnDelete");
btnDelete.addEventListener("click", (e)=>{
	e.preventDefault();
	e.stopPropagation();

	const frm = document.querySelector("#frmView");
	const idx = frm.idx.value;

	if (idx == "" || idx < 0){
		alert("접근 경로가 올바르지 않습니다.");
		window.location.replace("list.jsp");
		return;
	}
	
 	frm.action = "delete_ok.jsp";
 	frm.method = "post";
	frm.submit();
});

// 목록으로 이동
const btnList = document.getElementById("btnList");
btnList.addEventListener("click", (e)=>{
	e.preventDefault();
	e.stopPropagation();

	window.location.href = "list.jsp";
});


</script>

</body>
</html>