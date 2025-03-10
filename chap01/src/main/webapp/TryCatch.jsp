<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>page 지시어 - errorPage, isError 페이지 속성</h1>

<%
try {
	int age = Integer.parseInt(request.getParameter("age"))+10;
	out.println("10 년 뒤 나이는 " + age + " 입니다.");
} catch (Exception e) {
	out.println("예외 발생 : " + e.getMessage());
	out.println(e.getStackTrace());
}
%>
</body>
</html>