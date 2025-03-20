<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>JSTL - core - remove</h1>

<c:set var="param1" value="페이지 영역" />
<c:set var="param1" value="request 영역" scope="request" />
<c:set var="param1" value="session 영역" scope="session" />
<c:set var="param1" value="application 영역" scope="application" />

<h2>영역별 값 출력</h2>
<ul>
	<li>param1 : ${ param1 }</li>
	<li>requestScope.param1 : ${ requestScope.param1 }</li>
	<li>sessionScope.param1 : ${ sessionScope.param1 }</li>
	<li>applicationScope.param1 : ${ applicationScope.param1 }</li>
</ul>

<h2>영역별 값 삭제</h2>
<c:remove var="param1" scope="session" />
<ul>
	<li>param1 : ${ param1 }</li>
	<li>requestScope.param1 : ${ requestScope.param1 }</li>
	<li>sessionScope.param1 : ${ sessionScope.param1 }</li>
	<li>applicationScope.param1 : ${ applicationScope.param1 }</li>
</ul>

<h2>영역별 값 일괄 삭제</h2>
<c:remove var="param1" />
<ul>
	<li>param1 : ${ param1 }</li>
	<li>requestScope.param1 : ${ requestScope.param1 }</li>
	<li>sessionScope.param1 : ${ sessionScope.param1 }</li>
	<li>applicationScope.param1 : ${ applicationScope.param1 }</li>
</ul>
</body>
</html>