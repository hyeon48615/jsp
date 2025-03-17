<%@page import="net.fullstack10.domain.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>액션태그 - useBean</h1>

<h2>자바빈즈 생성</h2>

<%
// Person person = new Person();
// person.setName("홍길동");
// person.setAge(20);
// person.setSex("남자");

// person.getName();
// person.getAge();
// person.getSex();

// pageContext.setAttribute("person", person);
%>

<jsp:useBean id="person" class="net.fullstack10.domain.Person" scope="request" />

<h2>빈즈 속성 지정</h2>

<jsp:setProperty name="person" property="name" value="홍길동" />
<jsp:setProperty name="person" property="age" value="20" />
<jsp:setProperty name="person" property="sex" value="남자" />

<h2>빈즈 속성 조회</h2>
<ul>
	<li>이름 : <jsp:getProperty name="person" property="name" /></li>
	<li>나이 : <jsp:getProperty name="person" property="age" /></li>
	<li>성별 : <jsp:getProperty name="person" property="sex" /></li>
</ul>
</body>
</html>