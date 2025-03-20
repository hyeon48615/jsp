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
<h1>JSTL - core - catch</h1>

<%
int num1 = 100;
%>

<c:catch var="emsg">

<%
int rtn = num1 / 0;
%>

</c:catch>
예외 : ${ emsg };
</body>
</html>