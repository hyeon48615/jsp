<%@ page import="java.util.Collection" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm");
long add_date = s.parse(request.getParameter("add_date")).getTime();
int add_int = Integer.parseInt(request.getParameter("add_int"));
String add_str = request.getParameter("add_str");

response.addDateHeader("dateType", add_date);
response.addIntHeader("intType", add_int);
response.addIntHeader("intType", 0002);
response.addHeader("strType", add_str);
response.setHeader("strType", "str2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - resposne</title>
</head>
<body>

<h2>응답 헤더 정보 출력하기</h2>
<%
Collection<String> headerNames = response.getHeaderNames();
for (String hName : headerNames) {
	String hValue = response.getHeader(hName);
%>
<li><%=hName %> : <%=hValue %></li>
<%
}
%>
<h2>intType만 출력하기</h2>
<%
Collection<String> intType = response.getHeaders("intType");
for (String num : intType) {
%>
<li>intType : <%=num %></li>
<%
}
%>
</body>
</html>