<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>액션태그 - useBean 폼처리</h1>

<jsp:useBean id="person" class="net.fullstack10.domain.Person" />
<jsp:setProperty property="*" name="person" />

<ul>
	<li>이름 : <jsp:getProperty name="person" property="name" /> </li>
	<li>나이 : <jsp:getProperty name="person" property="age" /> </li>
	<li>성별 : <jsp:getProperty name="person" property="sex" /> </li>
</ul>
</body>
</html>