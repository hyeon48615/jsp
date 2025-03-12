<%@ page import="java.util.Enumeration" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>내장 객체 - request</h1>
<h2>3. 요청 헤더 정보 출력하기</h2>

<%
Enumeration headers = request.getHeaderNames();
while (headers.hasMoreElements()) {
	String hName = (String)headers.nextElement();
	String hVal = request.getHeader(hName);
	out.print("<b>헤더명</b> : " + hName + ", = " + hVal + "<br/>");
}
%>

<p>이 파일을 직접 실행하면 referer 정보는 출력되지 않습니다.</p>
</body>
</html>