<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>JSTL - core - import2</h2>

<ul>
	<li>저장된 값1 : ${ requestScope.param1 }</li>
	<li>매개변수1 : ${ param.param2 }</li>
	<li>매개변수2 : ${ param.param3 }</li>
</ul>
</body>
</html>