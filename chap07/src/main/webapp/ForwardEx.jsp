<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
pageContext.setAttribute("pageParam1", "파라미터1"); 
request.setAttribute("reqParam1", "request파라미터1");
%>

<h1>액션태그 - forward</h1>

<jsp:forward page="Forward2.jsp"></jsp:forward>
</body>
</html>