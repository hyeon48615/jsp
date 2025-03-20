<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Format</h1>

<h2>Format - 숫자 포맷</h2>

<c:set var="num1" value="123456789" />
콤마 출력 : <fmt:formatNumber value="${ num1 }" /><br>
콤마 미출력 : <fmt:formatNumber value="${ num1 }" groupingUsed="false" /><br>

<fmt:formatNumber value="${ num1 }" type="currency" var="pNum1" />
통화기호 : ${ pNum1 }<br>

<fmt:formatNumber value="0.47" type="percent" var="pNum2" />
퍼센트 : ${ pNum2 }<br>

<h2>Format - 문자열 => 숫자 포맷</h2>

<c:set var="num2" value="2,789,997.89" />
<fmt:parseNumber value="${ num2 }" pattern="00,000.00" var="pNum3" />
소수점 : ${ pNum3 }<br>

<fmt:parseNumber value="${ num2 }" integerOnly="true" var="pNum4" />
정수형 : ${ pNum4 }<br>

<h2>Format - 날짜 포맷</h2>
<c:set var="today" value="<%=new Date() %>" />

full : <fmt:formatDate value="${ today }" type="date" dateStyle="full" /><br>
short : <fmt:formatDate value="${ today }" type="date" dateStyle="short" /><br>
long : <fmt:formatDate value="${ today }" type="date" dateStyle="long" /><br>
default : <fmt:formatDate value="${ today }" type="date" dateStyle="default" /><br>

<h2>Format - 시간 포맷</h2>
full : <fmt:formatDate value="${ today }" type="time" timeStyle="full" /><br>
short : <fmt:formatDate value="${ today }" type="time" timeStyle="short" /><br>
long : <fmt:formatDate value="${ today }" type="time" timeStyle="long" /><br>
default : <fmt:formatDate value="${ today }" type="time" timeStyle="default" /><br>

<h2>Format - 날짜/시간 포맷</h2>
full : <fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full" /><br>
short : <fmt:formatDate value="${ today }" type="both" pattern="yyyy-MM-dd HH:mm:ss" /><br>
</body>
</html>