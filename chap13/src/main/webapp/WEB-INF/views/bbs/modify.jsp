<%@page import="java.net.URLEncoder"%>
<%@page import="net.fullstack10.common.CommonDateUtil"%>
<%@page import="net.fullstack10.common.JSFunction"%>
<%@page import="net.fullstack10.bbs.BbsDTO"%>
<%@page import="net.fullstack10.bbs.BbsDAO"%>
<%@page import="net.fullstack10.common.CommonUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
	.img_area {
		width:400px;
	}
	.view_img {
		width:400px;
	}	
</style>
</head>
<body>

<%@ include file="/common/common_top.jsp" %>
<%-- <jsp:include page="/common/common_top.jsp" /> --%>

<h1>게시판 수정 페이지</h1>

<form name="frmModify" id="frmModify" action="./modify.do?" method="post" enctype="multipart/form-data">
<input type="hidden" name="idx" idx="idx" value="${map.idx}" />
<table>
<tbody>
	<tr>
		<th>작성자 : </th>
		<td class="input_col">
			<input type="text" class="input_box_id" name="member_id" id="member_id"
				value="${map.dto.user_id}" maxlength="20" readonly />
		</td> 
	</tr>
	<tr>
		<th>제목 : </th>
		<td class="input_col">
			<input type="text" class="input_box" name="title" id="title" value="${map.dto.title}" maxlength="100" />
		</td> 
	</tr>
	<tr>
		<th>내용 : </th>
		<td class="input_content_area">
			<textarea name="content" id="content" class="input_content" rows="10" cols="60" wrap="hard">${map.dto.content}</textarea>		
		</td> 
	</tr>
	<tr>
		<th>첨부파일 : </th>
		<td class="input_col">
			<c:if test="${not empty map.dto.file_name}">
			<img class="view_img" src="/chap14${map.dto.file_path}/${map.dto.file_name}" alt="${map.dto.file_name}" />
			<input type="checkbox" name="prev_file_delete_flag" id="prev_file_delete_flag" value="Y" /> 삭제
			<hr/>
			</c:if>
			<input type="file" name="file1" />	
		</td> 
	</tr>
	<tr>
		<td colspan="2" class="align_cener btn_area">
			<input type="submit" id="btnModify" value="글수정" />
			<input type="button" id="btnCancel" value="취소" />
			<input type="button" id="btnDelete" value="삭제하기" />
			<input type="button" id="btnList" value="목록으로" />
		</td>
	</tr>
	
</tbody>
</table>
</form>

<script>
// 글 수정
const btnModify = document.getElementById("btnModify");
btnModify.addEventListener("click", (e)=>{
	e.preventDefault();
	e.stopPropagation();
	
	const frm = document.querySelector("#frmModify");
	const idx = frm.idx.value;
	const memberId = frm.member_id.value;
	const title = frm.title.value;
	const content = frm.content.value;

	if (idx == "" || idx < 0){
		alert("접근 경로가 올바르지 않습니다.");
		window.location.replace("list.jsp");
		return;
	}

	if (memberId.length < 4 || memberId.length > 20){
		alert("아이디를 4자리 이상 20자리 이하로 입력하세요.");
		frm.member_id.focus();
		return;
	}
	if (title.length < 2 || title.length > 100){
		alert("제목을 1자리 이상 100자리 이하로 입력하세요.");
		frm.title.focus();
		return;
	}
	if (content.length < 2 || content.length > 1000){
		alert("글 내용을 1자리 이상 1000자리 이하로 입력하세요.");
		frm.content.focus();
		return;
	}

 	//frm.action = "./modify.do";
 	//frm.method = "post";
	frm.submit();
});

//수정 취소
const btnCancel = document.getElementById("btnCancel");
btnCancel.addEventListener("click", (e)=>{
	e.preventDefault();
	e.stopPropagation();
	
});

//글 삭제
const btnDelete = document.getElementById("btnDelete");
btnDelete.addEventListener("click", (e)=>{
	e.preventDefault();
	e.stopPropagation();

});

// 목록으로 이동
const btnList = document.getElementById("btnList");
btnList.addEventListener("click", (e)=>{
	e.preventDefault();
	e.stopPropagation();
	window.location.href="./list.do";
});


</script>

</body>
</html>