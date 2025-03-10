<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	String str1 = "JSP";
	String str2 = "Hello~";
%>

<h2>첫 JSP : <%=str1 %></h2>

<p>
	<%
		out.println(str2 + ", " + str1 + "입니다.");
	%>
</p>
</body>
</html>