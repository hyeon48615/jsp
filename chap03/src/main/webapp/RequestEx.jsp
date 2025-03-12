<%@page import="net.fullstack10.common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
request.setAttribute("str", "request 영역의 문자열 변수");
request.setAttribute("no", 100);
request.setAttribute("person", new Person("홍길동", 20, "남자"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>request 영역</h1>
<h2>request 영역의 속성값 처리</h2>
<%
request.removeAttribute("str");
request.removeAttribute("no");
%>

<h2>request 영역 속성값 조회</h2>
<%
Person person = (Person)(request.getAttribute("person"));
%>
<ul>
	<li>문자열 : <%=request.getAttribute("str") %> </li>
	<li>숫자 : <%=request.getAttribute("no") %> </li>
	<li>이름 : <%=person.getName() %> </li>
	<li>나이 : <%=person.getAge() %> </li>
	<li>성별 : <%=person.getSex() %> </li>
</ul>

<h2>포워드된 페이지에서 request 영역 조회</h2>
<%
pageContext.setAttribute("pageStr", "페이지영역변수");

request.getRequestDispatcher("PageForward.jsp?eng=Hello&kor=안녕하세요")
		.forward(request, response);
%>
</body>
</html>