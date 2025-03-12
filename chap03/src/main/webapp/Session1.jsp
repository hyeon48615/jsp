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
<h2>페이지 이동 후 session 영역 속성 조회</h2>

<%
List<String> list = (ArrayList<String>)session.getAttribute("list");
String user_id = session.getAttribute("user_id").toString();
String nick_name = session.getAttribute("nick_name").toString();
String email = session.getAttribute("email").toString();

for(String str : list) {
	out.print(str + "<br>");
}
out.print("user_id : "+ user_id + "<br>");
out.print("nick_name : "+ nick_name + "<br>");
out.print("email : "+ email + "<br>");
%>
</body>
</html>