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

<h1>JSTL - core - if</h1>

<c:set var="num1" value="99" />
<c:set var="str1" value="문자열 저장 변수" />

<h2>if - 짝수 / 홀수 출력</h2>
<c:if test="${ num1 mod 2 eq 0 }" var="result">
	${ num1 }은 짝수<br>
</c:if>
<c:if test="${ num1 mod 2 ne 0 }" var="result">
	${ num1 }은 홀수<br>
</c:if>

<h2>문자열 비교 출력</h2>
<c:if test="${ str1 eq '문자열 저장 변수' }">
	${ str1 } '문자열 저장 변수' 입니다. <br>
</c:if>

<h2>조건절 처리 방법</h2>
<c:if test="100" var="result">
	조건절에 EL 이 아닌 숫자 입력시 : false<br>
</c:if>
result : ${ result };
</body>
</html>