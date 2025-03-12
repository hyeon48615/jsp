<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="net.fullstack10.common.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>page 영역</h1>
<h2>페이지 이동 후 page 영역 조회</h2>

<%
Object no = pageContext.getAttribute("no");
Object str = pageContext.getAttribute("str");
Object person = pageContext.getAttribute("person");
%>

<ul>
	<li>Integer 객체 : <%=(no == null ? "값 없음" : no) %></li>
	<li>String 객체 : <%=(str == null ? "값 없음" : str) %></li>
	<li>Person 객체 : <%=(person == null ? "값 없음" : ((Person)person).getName()) %></li>
</ul>


</body>
</html>