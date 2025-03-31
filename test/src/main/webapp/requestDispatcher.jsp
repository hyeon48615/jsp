<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestDispatcher 테스트</title>
</head>
<body>
	<%
	// RequestDispatcher
	// 기존 요청을 유지하므로 제출한 userId 와 pwd 를 가져올 수 있음
	String userId = request.getParameter("userId");
	String pwd = request.getParameter("pwd");

	System.out.println("requestDispatcher > ");
	System.out.println("userId: " + userId + ", pwd: " + pwd);
	%>
	<form method="post" action="requestDispatcher_ok.jsp">
		<input type="text" name="userId" value="<%=userId != null ? userId : "" %>" />
		<input type="password" name="pwd" value="<%=pwd != null ? pwd : "" %>"/>
		<input type="submit" />
	</form>
</body>
</html>