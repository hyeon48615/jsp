<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isErrorPage="true" 
%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAGE 지시어 - errorPage/isErrorPage 속성</title>
</head>
<body>
<h1>isErrorPage 속성</h1>
<hr>
<h2>서비스 중 오류가 발생하였습니다.</h2>
<p>
	발생 오류 : <%=exception.getClass().getName() %> <br />
	오류 메시지 : <%=exception.getMessage() %>
</p>
</body>
</html>