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

<h1>JSTL - core - choose, when, otherwise</h1>

<%
int num1 = 100;
%>

<h2>choose 홀/짝수 판단</h2>
<c:set var="num1" value="<%=num1 %>" />

<c:choose>
	<c:when test="${ num1 % 2 == 0 }">${ num1 }짝수</c:when>
	<c:otherwise>${ num1 } 홀수</c:otherwise> 
</c:choose>

<h2>입력된 국, 영, 수의 점수 처리</h2>
<form>
국어 : <input type="text" name="kor" /><br>
영어 : <input type="text" name="eng" /><br>
수학 : <input type="text" name="math" /><br>
<input type="submit" value="전송" />
</form>

<h3>평균</h3>
<c:if test="${ not (empty param.kor || empty param.eng || empty param.math) }">
	<c:set var="avg" value="${(param.kor + param.eng + param.math)/3 }" />
	평균 : ${ avg }
</c:if>

<h3>평균에 대한 학점</h3>
<c:choose>
	<c:when test="${ avg >= 90 }">A학점</c:when>
</c:choose>
</body>
</html>