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
<h1>JSTL - core - redirect</h1>

<c:set var="param1" value="문자열 값1" scope="request" />

<c:redirect url="CoreImport2.jsp">
	<c:param name="param2" value="리다이렉트 변수값1" />
	<c:param name="param3" value="리다이렉트 변수값2" />
</c:redirect>
</body>
</html>