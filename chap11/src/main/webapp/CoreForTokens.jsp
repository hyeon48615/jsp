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

<h1>JSTL - core - forTokens</h1>

<%
String colors = "red,blud,yellow,white";
%>
<c:forTokens items="<%=colors %>" delims="," var="color">
	<span style="color: ${color};">${color}</span><br>
</c:forTokens>
<%
for(String s : colors.split(",")) {
	out.print("<span style='color:" + s + "';>" + s + "<span><br>");
}
%>
</body>
</html>