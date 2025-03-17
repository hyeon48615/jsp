<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>액션태그 - 파라미터 전달</h1>

<jsp:useBean id="person" class="net.fullstack10.domain.Person" scope="request" />
<jsp:setProperty name="person" property="name" value="홍길동" />
<jsp:setProperty name="person" property="age" value="20" />
<jsp:setProperty name="person" property="sex" value="남자" />
<jsp:forward page="ParamEx2.jsp?email=www@www.net">
	<jsp:param name="favorite" value="스포츠" />
</jsp:forward>
</body>
</html>