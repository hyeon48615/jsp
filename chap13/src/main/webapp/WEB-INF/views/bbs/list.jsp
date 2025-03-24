<%@page import="net.fullstack10.common.CommonDateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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
<c:set var="map" value='${ map }' />

<h1>게시판 목록</h1>
<form name="frmSearch" id="frmSearch" method="get">
<table class="search_table">
	<tr>
		<td class="search_td">
			<select name="search_category" id="search_category" class="search_select">
				<option value="" selected>선택</option>
				
				<option value="title" ${ map.search_category == 'title' ? 'selected' : '' }>제목</option>
				<option value="content" ${ map.search_category == 'content' ? 'selected' : '' }>글내용</option>
				<option value="user_id" ${ map.search_category == 'user_id' ? 'selected' : '' }>작성자</option>
			</select>
			&nbsp;&nbsp;
			<input type="text" name="search_word" id="search_word" value="${ map.search_word }" maxlength="20" class="search_input" />
			&nbsp;&nbsp;
			<input type="button" name="btn_search" id="btn_search" value="검색" />
		</td>
	</tr>
</table>

<input type="hidden" name="idx" id="idx" value="" />
<table>
<tbody>
	<tr>
		<td colspan="6">전체 게시글 수 : ${ map.total_count }</td>
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
		<c:choose>
			<c:when test="${ not empty map.bbsList }">
				<c:set var="page_no" value="${ map.page_no }" />
				<c:set var="page_size" value="${ map.page_size }" />
				<c:set var="bbs_no" value="${ (page_no-1) * page_size }" />
				<c:forEach var="dto" items="${ map.bbsList }" varStatus="loopStatus">
					<tr>
						<td class="align_center"><input type="checkbox" name="delete_idx" value="${ dto.getIdx() }" /></td>
						<td class="align_center">${ bbs_no + loopStatus.count }</td>
						<td class="title"><a href="view.jsp?idx=${ dto.getIdx() }">${ dto.getTitle() }</a></td>
						<td class="align_center">${ dto.getRead_cnt() }</td>
						<td class="align_center">
							<fmt:parseDate var="pRegDate" value="${ dto.getReg_date() }" type="both" pattern="yyyy-MM-dd'T'HH:mm:ss" />
							<fmt:formatDate value="${ pRegDate }" type="both" pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
						<td class="align_center">
							<input type="button" id="btnOneDelete" value="삭제" />
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="6" class="td_height100 align_center">
						등록된 게시물 정보가 없습니다.
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="6" class="td_height40 align_center">
				${ map.paging }
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
		
		window.location.href="./bbs/BbsRegist.do";
	});
	
	const btnOneDelete = document.getElementById("btnOneDelete");
	if (btnOneDelete) {
		btnOneDelete.addEventListener("click", function(e){
			e.preventDefault();
			e.stopPropagation();
			
			const frm = document.getElementById("frmSearch");
			//alert(this.parentElement.parentElement.firstElementChild.firstElementChild.value);
			// 선택 삭제 루틴
			const confirm_flag = confirm("해당 글을 삭제하시겠습니까?\n삭제된 글은 복구되지 않습니다.");
			if (confirm_flag){
				frm.idx.value = this.parentElement.parentElement.firstElementChild.firstElementChild.value;
				frm.action = "delete_ok.jsp";
				frm.submit();
			}
		});
	}
	
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
	if (btnDeleteSelected) {
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
	}
	
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