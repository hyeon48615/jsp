<%@page import="chap11.Students"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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

<h1>JSTL - core - forEach문</h1>

<h2>일반 for 문</h2>
<c:forEach var="i" begin="1" end="10" step="1">
	<c:set var="sum" value="${ sum + i }" />
</c:forEach>
1-10 합계 : ${ sum }<br>

<h2>varStatus 값</h2>
<table border="1">
	<tr>
		<th>count</th>
		<th>index</th>
		<th>current</th>
		<th>first</th>
		<th>last</th>
	</tr>
<c:forEach var="i" begin="11" end="20" varStatus="loopVal">
	<tr style='background-color:${ (loopVal.index mod 2 eq 0) ? '#efefef' : '#ffffff' }'>
		<td>${ loopVal.count }</td>
		<td>${ loopVal.index }</td>
		<td>${ loopVal.current }</td>
		<td>${ loopVal.first }</td>
		<td>${ loopVal.last }</td>
	</tr>
</c:forEach>
</table>

<h2>향상된 for 문</h2>
<%
String[] colors = { "red", "blue", "yellow", "white" };
%>
<table border="1">
	<tr>
		<th>count</th>
		<th>index</th>
		<th>current</th>
		<th>first</th>
		<th>last</th>
	</tr>
<c:forEach var="bg" items="<%=colors %>" varStatus="loopStatus">
	<tr style='background-color:${ bg }'>
		<td>${ loopStatus.count }</td>
		<td>${ loopStatus.index }</td>
		<td>${ loopStatus.current }</td>
		<td>${ loopStatus.first }</td>
		<td>${ loopStatus.last }</td>
	</tr>
</c:forEach>
</table>

<h2>향상된 for 문 - List</h2>
<%
List<Students> sList = new ArrayList<>();
sList.add(new Students("홍길동1", 20, 1, "남"));
sList.add(new Students("홍길동2", 21, 2, "여"));
sList.add(new Students("홍길동3", 22, 3, "남"));
%>
<ul>
<c:forEach var="st" items="<%=sList %>" varStatus="loopStatus">
	<li>이름 : ${ st.name }, 나이 : ${ st.age }, 학년 : ${ st.grade }, 성별 : ${ st.gender }</li>
</c:forEach>
</ul>
</body>
</html>