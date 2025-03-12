<%@page import="net.fullstack10.common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>request 영역</h1>
<h2>request 포워드로 전달된 페이지</h2>
<h3>request 영역 속성 조회</h3>
<%
Person person = (Person)(request.getAttribute("person"));
%>
<ul>
	<li>pageStr : <%=pageContext.getAttribute("pageStr") %> </li>
	<li>문자열 : <%=request.getAttribute("str") %> </li>
	<li>숫자 : <%=request.getAttribute("no") %> </li>
	<li>이름 : <%=person.getName() %> </li>
	<li>나이 : <%=person.getAge() %> </li>
	<li>성별 : <%=person.getSex() %> </li>
</ul>

<h3>QueryString 으로 받은 변수</h3>
<%
out.print(request.getParameter("eng")+"<br>");
out.print(request.getParameter("kor")+"<br>");
%>


</body>
</html>