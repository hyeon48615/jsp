<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	errorPage="IsErrorPage.jsp"
%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
int age = Integer.parseInt(request.getParameter("age"))+10;
out.println("10 년 뒤 나이는 " + age + " 입니다.");
%>

</body>
</html>