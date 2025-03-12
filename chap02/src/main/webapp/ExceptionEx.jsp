<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>내장 객체 - exception</h1>
<%
int status = response.getStatus();
System.out.println("status: " + status);

if (status == 404) {
	out.print("404 에러 발생");
	out.print("<br>해당 경로 확인 바람");
}
else if (status == 405) {
	out.print("405 에러 발생");
	out.print("<br>요청 방식(method) 확인 바람");
}
else if (status == 500) {
	out.print("500 에러 발생");
	out.print("<br>소스 코드 확인 바람");
}
%>
</body>
</html>