<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");

long createTime = session.getCreationTime();
String strCreateTime = sdf.format(new Date(createTime));

long lastAccTime = session.getLastAccessedTime();
String strLastAccTime = sdf.format(new Date(lastAccTime));
%>

<h1>내장 객체 - session</h1>

<h2>Session 설정 확인</h2>

<ul>
	<li>세션 유지 시간 : <%=session.getMaxInactiveInterval() %></li>
	<li>세션 아이디 : <%=session.getId() %></li>
	<li>세션 요청 시각 : <%=strCreateTime %></li>
	<li>마지막 요청 시각 : <%=strLastAccTime %></li>
</ul>
</body>
</html>