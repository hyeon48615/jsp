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

<%
pageContext.setAttribute("sParam", "페이지 영역에서 선언");
request.setAttribute("sParam", "request 영역에서 선언");
session.setAttribute("sParam", "session 영역에서 선언");
application.setAttribute("sParam", "application 영역에서 선언");
%>

<h2>각 영역에 저장된 속성값 조회</h2>
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

<%-- <jsp:forward page="EL2.jsp" /> --%>
</body>
</html>