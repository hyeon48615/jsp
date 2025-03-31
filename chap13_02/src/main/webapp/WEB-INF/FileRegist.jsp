<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>파일 업로드</h3>
	<span style="color: red;">${ errorMessage }</span>
	<form id="frmFile" name="frmFile" method="post" enctype="multipart/form-data"
		action="regist.do">
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" /></td>
			</tr>
			<tr>
				<th>카테고리(선택사항)</th>
				<td>
					<input type="checkbox" name="category" value="사진" /> 사진
					<input type="checkbox" name="category" value="과제" /> 과제
					<input type="checkbox" name="category" value="워드" /> 워드
					<input type="checkbox" name="category" value="음원" /> 음원
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="ofile" /></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="submit" id="btnSubmit" value="전송" />
				</td>
			</tr>
		</table>
	</form>
	
	<script>
		document.getElementById("submit").addEventListener((e) => {
			e.preventDefault();
			e.stopPropagation();
			
			const frm = document.getElementById("frmFile");
			if (frm.title.value == "") {
				alert("제목을 입력하세요.");
				frm.title.focus();
				return;
			}
			if (frm.ofile.value == "") {
				alert("첨부 파일은 필수 입니다.");
				return;
			}
			
			frm.submit();
		});
	</script>
</body>
</html>