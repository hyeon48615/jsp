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
<h1>JSTL - core - import</h1>

<c:set var="param1" value="문자열1" scope="request" />
<c:import url="CoreImport2.jsp" var="contents">
	<c:param name="param2" value="문자열2" />
	<c:param name="param3" value="문자열3" />
</c:import>

<h2>다른 문서 삽입 -> 결과만, HTML</h2>
${ contents }

<hr>

<h2>다른 문서 삽입 -> 외부파일</h2>
<c:import url="https://www.naver.com" />
</body>
</html>