<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>표현 언어(EL) - 내장 객체</h1>

<h2>Forwarding 페이지</h2>
<h3>각 영역에 저장된 속성값 조회</h3>

<ul>
	<li>페이지 영역 : ${ pageScope.sParam }</li>
	<li>request 영역 : ${ requestScope.sParam }</li>
	<li>session 영역 : ${ sessionScope.sParam }</li>
	<li>application 영역 : ${ applicationScope.sParam }</li>
</ul>

<h2>속성값만 조회</h2>
<ul>
	<li>${ sParam }</li>
</ul>
</body>
</html>