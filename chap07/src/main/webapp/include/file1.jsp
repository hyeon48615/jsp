<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>file1</h2>

<%
String fileVar1 = "파일1의 문자열 변수1";
%>

<ul>
	<li>page 영역 속성 값 : <%=pageContext.getAttribute("pageParma1")%> </li>
</ul>
</body>
</html>