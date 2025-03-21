<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>test2.jsp</h1>
<h2>annotation 에서 매핑</h2>
<p>
	<%=request.getAttribute("msg") %>
	<br>
	<a href="./Test2.do">바로가기</a>
</p>
</body>
</html>