<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>내장 객체 - application</h1>

<h2>web.xml 에 설정한 값 조회</h2>

설정 파라미터 : <%=application.getInitParameter("INIT_PARAM") %>

<br>

<h2>서버의 물리적 경로 조회</h2>
application 내장 객체 : <%=application.getRealPath("/ApplicationEx.jsp") %>

<h2> 선언부에서 aplication 객체 사용</h2>
<%!
public String getPath() {
	return this.getServletContext().getRealPath("ApplicationEx.jsp");
}

public String getPath(ServletContext app) {
	return app.getRealPath("ApplicationEx.jsp");
}
%>

<ul>
	<li>this 사용 : <%=getPath() %></li>
	<li>내장 객체 전달 : <%=getPath(application) %></li>
</ul>
</body>
</html>