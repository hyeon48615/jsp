<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>표현언어 - 폼 값 받기</h1>

<ul>
	<li>이름 : ${ param.name }</li>
	<li>성별 : ${ param.sex }</li>
	<li>취미 : ${ param.favorite }</li>
	<li>관심사항 : ${ paramValues.curious[0] }, ${ paramValues.curious[1] }</li>
	<li>지역 : ${ param.area }</li>
</ul>
</body>
</html>