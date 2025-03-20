<%@page import="net.fullstack10.bbs.BbsDTO"%>
<%@page import="net.fullstack10.bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../login/isLogin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../basic.css" rel="stylesheet" type="text/css">

<style>
table {
	width: 100%;
}

table, thead, tbody, th, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th {
	text-align: center;
	width: 120px;
	height: 20px;
	background-color: lightgray;
}

.input_col {
	height: 40px;
	padding: 2px 5px;
}

.input_content {
	resize: none;
}

.input_box {
	width: 400px;
	height: 40px;
}

input[type='text'], textarea {
	width: 100%;
	box-sizing: border-box;
	border: none;
}

.align_center {
	text-align: center;
}

.btn_area {
	text-align: center;
	height: 40px;
	margin: 4px;
}
</style>
</head>
<body>
<%
String memberId = session.getAttribute("memberId").toString();

String no = request.getParameter("no");
if (no == null || no == "") {
	out.print("<script>");
	out.print("alert('게시글 번호가 올바르지 않습니다.');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}

BbsDAO dao = new BbsDAO();
BbsDTO dto = dao.getBbsByIdx(no);
dao.close();
if (!memberId.equals(dto.getUser_id())) {
	out.print("<script>");
	out.print("alert('이 글을 수정할 수 있는 권한이 없습니다.');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}
%>
	<div class="container">
		<h1>게시판 수정</h1>
		<form id="frmModify" name="frmModify" action="modify_ok.jsp" method="post">
			<input type="hidden" id="no" name="no" value="<%=no %>"/>
			<input type="hidden" id="memberId" name="memberId" value="<%=memberId %>" />
			<table>
				<tbody>
					<tr>
						<th>작성자</th>
						<td class="input_col"><%=memberId %></td>
					</tr>
					<tr>
						<th>제목</th>
						<td class="input_col">
							<input type="text" class="input_box" id="title" name="title" value="<%=dto.getTitle() %>" maxlength="100">
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td class="input_col">
							<textarea id="content" name="content" class="input_content" rows="10" cols="50" wrap="hard"><%=dto.getContent().replace("<br>", "\r\n") %></textarea>
						</td>
					</tr>
					<tr>
						<td class="align_center btn_area" colspan="2">
							<input type="submit" id="btnModify" value="수정" />
							<input type="reset" id="btnReset" value="재입력" />
							<input type="button" id="btnCancel" value="취소" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<script>
		const btnRegist = document.getElementById("btnModify");
		btnRegist.addEventListener("click", (e) => {
			e.preventDefault();
		    e.stopPropagation();
		    
		    const frm = document.querySelector("#frmModify");
		    const title = frm.title.value;
		    const content = frm.content.value;
			
			if (title.length < 1 || title.length > 100) {
				alert("제목은 1글자 이상 100글자 이하로 입력하세요.");
				frm.title.focus();
				return;
			}
			
			if (content.length < 1 || content.length > 1000) {
				alert("내용은 1자리 이상 1000자리 이하로 입력하세요.");
				frm.content.focus();
				return;
			}
			
			frm.submit();
		});
		
		const btnReset = document.getElementById("btnReset");
		btnReset.addEventListener("click", (e) => {
			e.preventDefault();
			e.stopPropagation();
			
			const els = document.querySelectorAll("input[type='text'], textarea");
			els.forEach((el)=>{
				el.value = "";
			});
		});
		    
		const btnCancel = document.getElementById("btnCancel");
		btnCancel.addEventListener("click", (e) => {
			e.preventDefault();
			e.stopPropagation();
			history.back();
		});
	</script>
</body>
</html>