<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>session 영역</h1>

<%
List<String> list = new ArrayList<>();
list.add("리스트");
list.add("강아지");
list.add("고양이");
list.add("송아지");
session.setAttribute("list", list);
session.setAttribute("user_id", "user0");
session.setAttribute("nick_name", "조커");
session.setAttribute("email", "user0@www.net");
%>
<h2>페이지 이동 후 session 영역 조회</h2>
<a href="Session1.jsp">페이지 이동</a>



</body>
</html>