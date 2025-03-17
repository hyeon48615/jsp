<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>액션 태그 - forward 결과</h1>

<ul>
	<li>page 영역 변수 : <%=pageContext.getAttribute("pageParam1") %></li>
	<li>request 영역 변수 : <%=request.getAttribute("reqParam1") %></li>
</ul>
</body>
</html>