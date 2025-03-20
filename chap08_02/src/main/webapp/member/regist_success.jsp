<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원 정보를 등록하였습니다.</h1>
<br>
<button id="btnSuccess">목록으로 이동</button>

<script>
const btnSuccess = document.getElementById("btnSuccess");
btnSuccess.addEventListener("click", function() {
	// window.location.replace();
	// window.location.reaload();
	location.href = "list.jsp";
});
</script>
</body>
</html>