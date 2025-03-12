<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>쿠키</h1>

<h2>1. 쿠키 설정</h2>
<%
Cookie cookie1 = new Cookie("cookie1", "쿠키설정");
cookie1.setPath("/");
cookie1.setMaxAge(10);
response.addCookie(cookie1);
%>

<h2>2. 쿠키 값 확인</h2>
<%
Cookie[] cookies = request.getCookies();
if ( cookies != null ){
	for (Cookie cookie : cookies) {
		String name = cookie.getName();
		String value = cookie.getValue();
		out.print(String.format("%s : %s<br>", name, value));
	}
}

%>

</body>
</html>