<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>1. 클라이언트와 서버의 환경 정보 읽기</h1>

<ul>
	<li>데이터 전송 방식 : <%=request.getMethod() %></li>
	<li>URL : <%=request.getRequestURL() %></li>
	<li>URI : <%=request.getRequestURI() %></li>
	<li>프로토콜 : <%=request.getProtocol() %></li>
	<li>서버명 : <%=request.getServerName() %></li>
	<li>서버포트 : <%=request.getServerPort() %></li>
	<li>클라이언트 IP 주소 : <%=request.getRemoteAddr() %></li>
	<li>쿼리스트링 : <%=request.getQueryString() %></li>
	<li>파라미터값1 : <%=request.getParameter("eng") %></li>
	<li>파라미터값2 : <%=request.getParameter("kor") %></li>
</ul>

</body>
</html>