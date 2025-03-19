<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
if (session.getAttribute("memberId") == null) {
	String url = request.getRequestURI();
	session.setAttribute("redirectUrl", url);
	
	out.print("<script>");
	out.print("alert('로그인 후 이용해주십시오.');");
	out.print("window.location.href = '../login/login.jsp';");
	out.print("</script>");
	out.close();
}
%>