<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	table, thead, tbody, th, tr, td {
		border : 1px solid black;
		border-collapse : collapse;
	}
	th {
		text-align : center;
		min-width : 120px;
		height : 20px;
		background-color : #efefef;
	}
	.input_col {
		width : 400px;
		height : 40px;
	}
	.input_box {
		width : 300px;
		height : 20px;
		margin : 2px 0px 2px 4px;
	}
	.input_box_id {
		width : 200px;
	}
	.align_center {
		text-align : center;
	}
</style>

</head>
<body>
<h1>회원 등록</h1>

<form>
	<table>
		<tbody>
			<tr>
				<th>아이디 : </th>
				<td class="input_col">
					<input type="text" class="input_box input_box_id"  name="member_id" id="member_id" value="" maxlength="20" autofocus />
				</td>
			</tr>
			<tr>
				<th>비밀번호 : </th>
				<td class="input_col">
					<input type="password" class="input_box"  name="pwd" id="pwd" value="" maxlength="20" />
				</td>
			</tr>
			<tr>
				<th>이름 : </th>
				<td class="input_col">
					<input type="text" class="input_box" name="name" id="name" value="" maxlength="10" />
				</td>
			</tr>
			<tr>
				<td colspan="2" class="align_center">
					<input type="submit" id="btnRegist" value="등록" />
					<input type="button" id="btnCancel" value="취소" />
				</td>
			</tr>
		</tbody>
	</table>
</form>

<script>
let btnSubmit = document.getElementById("btnRegist");
btnSubmit.addEventListener("click", () => {
	event.preventDefault();
    event.stopPropagation();
    
    let frm = document.getElementsByTagName("form")[0];
	let memberId = frm.member_id;
	let pwd = frm.pwd;
	let name = frm.name;
	
    if (memberId.value == null || memberId.value.length < 4 || memberId.value.length > 20 ) {
    	alert('아이디를 4자리 이상 20자리 이하로 입력하세요.');
    	memberId.focus();
    	return;
    }
	if (pwd.value == null || pwd.value.length < 4 || pwd.value.length > 20 ) {
		alert('비밀번호를 4자리 이상 20자리 이하로 입력하세요.');
		pwd.focus();
    	return;
	}
	if (name.value == null || name.value.length < 2 || name.value.length > 10 ) {
		alert('이름을 2자리 이상 10자리 이하로 입력하세요.');
		name.focus();
    	return;
	}
	
	frm.action = "regist_ok.jsp";
	frm.method = "post";
	frm.submit();
});

let btnCancel = document.getElementById("btnCancel");
btnCancel.addEventListener("click", () => {
	let inputs = document.querySelectorAll(".input_box");
	inputs.forEach(input => {
		input.value = "";
	});
});
</script>
</body>
</html>