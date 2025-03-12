<%@page import="net.fullstack10.common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
int no2 = (Integer)(pageContext.getAttribute("no"));
String str2 = pageContext.getAttribute("str").toString();
Person person2 = (Person)(pageContext.getAttribute("person"));
%>

<ul>
	<li>Integer 객체 : <%=no2 %></li>
	<li>String 객체 : <%=pageContext.getAttribute("str") %></li>
	<li>Person 객체 : 이름(<%=person2.getName() %>), 성별(<%=person2.getSex() %>), 나이(<%=person2.getAge() %>)</li>
</ul>