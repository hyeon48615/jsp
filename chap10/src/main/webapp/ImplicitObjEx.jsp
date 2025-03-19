<%@page import="net.fullstack10.common.CommonUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// 쿠기 사용
CommonUtil cUtil = new CommonUtil();
cUtil.makeCookie(response, "", "/", 10, "ELCookie", "EL쿠키사용법");
%>
<h1>표현언어 - 내장객체 사용</h1>
<h2>쿠키 조회</h2>
<ul>
	<li>쿠키값 조회 : ${ cookie.ELCookie.value }</li>
</ul>

<h2>HTTP 헤더 읽기</h2>
<ul>
	<li>host : ${ header.host }</li>
	<li>user-agent : ${ header["user-agent"] }</li>
	<li>cookie : ${ header.cookie }
</ul>

<h2>컨텍스트 초기화 변수 읽기</h2>
<ul>
	<li>DB Driver : ${ initParam.MariaDriver }</li>
	<li>DB MariaURL : ${ initParam.MariaURL }</li>
</ul>

<h2>컨텍스트 루트 경로 읽기</h2>
<ul>
	<li>contextPath : ${ pageContext.request.contextPath }</li>
	<li>getContextPath : <%=request.getContextPath() %></li>
</ul>
</body>
</html>