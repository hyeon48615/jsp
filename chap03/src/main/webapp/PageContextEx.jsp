<%@ page import="net.fullstack10.common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
pageContext.setAttribute("no", 100);
pageContext.setAttribute("str", "페이지 영역의 문자열");
pageContext.setAttribute("person", new Person("홍길동", 14, "남"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>내장 객체의 영역 - page 영역</h1>
<h2>page 영역 속성 조회</h2>
<%
int no = (Integer)(pageContext.getAttribute("no"));
String str = pageContext.getAttribute("str").toString();
Person person = (Person)(pageContext.getAttribute("person"));
%>

<ul>
	<li>Integer 객체 : <%=no %></li>
	<li>String 객체 : <%=str %></li>
	<li>Person 객체 : 이름(<%=person.getName() %>), 성별(<%=person.getSex() %>), 나이(<%=person.getAge() %>)</li>
</ul>

<hr>include 된 파일에서 page 영역 정보 조회</h2>
<%@ include file="IncPage.jsp" %>

<h2>페이지 이동 후 page 영역 조회</h2>
<a href="PageLink.jsp">PageLink.jsp 바로가기</a>
</body>
</html>