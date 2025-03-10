<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
Date today = new Date();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
String strToday = dateFormat.format(today);

out.println("오늘은 : " + strToday);
%>

</body>
</html>