<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
String userId = request.getParameter("userId");
String pwd = request.getParameter("pwd");

System.out.println("requestDispatcher_ok > ");
System.out.println("userId: " + userId + ", pwd: " + pwd);

request.getRequestDispatcher("requestDispatcher.jsp").forward(request, response);
%>