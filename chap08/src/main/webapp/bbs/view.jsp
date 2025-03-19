<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="net.fullstack10.bbs.BbsDTO"%>
<%@page import="net.fullstack10.bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
td {
	padding: 2px;
}
.col-field {
	width: 120px;
	height: 30px;
	text-align: center;
	font-weight: bold;
}
.text-align {
	text-align: center;
}
#btnUpdate, #btnDelete {
	float: left;
}
#btnList {
	float: right;
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
dao.updateVisitCount(no);

BbsDTO dto = new BbsDTO();
dto = dao.getBbsByIdx(no);

dao.close();
%>
	<div class="container">
		<h1>게시판 상세보기</h1>
		<form name="frmBbs" id="frmBbs">
			<input type="hidden" name="no" id="no" value="<%=no %>" />
			<table>
				<tr>
					<td class="col-field">번호</td>
					<td><%=dto.getIdx() %></td>
					<td class="col-field">작성자</td>
					<td class="text-align"><%=dto.getUser_id() %></td>
				</tr>
				<tr>
					<td class="col-field">작성일</td>
					<td><%=dto.getReg_date().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")) %></td>
					<td class="col-field">조회수</td>
					<td class="text-align"><%=dto.getRead_cnt() %></td>
				</tr>
				<tr>
					<td class="col-field">제목</td>
					<td colspan="3"><%=dto.getTitle() %></td>
				</tr>
				<tr>
					<td class="col-field">내용</td>
					<td colspan="3" id="col-content"><%=dto.getContent() %></td>
				</tr>
				<% if(dto.getFile_path() != null && dto.getFile_name() != null && dto.getFile_ext() != null) { %>
				<tr>
					<td class="col-field">첨부파일</td>
					<td colspan="3" class="col-content"><%=dto.getFile_path() + dto.getFile_name() + "." + dto.getFile_ext() %> <span id="file_size"><%=dto.getFile_size() %></span></td>
				</tr>
				<% } %>
				<tr>
					<td colspan="4">
					<% if (dto.getUser_id().equals(memberId)) { %>
						<input type="button" name="btnUpdate" id="btnUpdate" value="수정" />
						<input type="button" name="btnDelete" id="btnDelete" value="삭제" />
					<% } %>	
						<input type="button" name="btnList" id="btnList" value="목록보기" />
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<script>
		document.getElementById("btnUpdate").addEventListener(("click"), (e) => {
			e.preventDefault();
		    e.stopPropagation();
		    
		    window.location.href = "modify.jsp?no=<%=no %>";
		});
		
		document.getElementById("btnDelete").addEventListener("click", (e) => {
			e.preventDefault();
		    e.stopPropagation();
		    
		    const frm = document.getElementById("frmBbs");
		    frm.action = "delete_ok.jsp";
		    frm.method = "post";
		    frm.submit();
		});
		
		document.getElementById("btnList").addEventListener("click", (e) => {
			e.preventDefault();
		    e.stopPropagation();
		    
		    window.location.href = "list.jsp";
		});
	</script>
</body>
</html>