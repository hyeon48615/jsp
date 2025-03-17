<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>액션태그 - useBean - 파라미터 전송</h1>

<form name="frmForm" action="UseBeanOk.jsp">
	이름 : <input type="text" name="name" value="" />
	<br>
	나이 : <input type="text" name="age" value="" />
	<br>
	성별 : 
	<input type="radio" name="sex" value="여자" /> 여자
	<input type="radio" name="sex" value="남자" /> 남자
	<br>
	<input type="submit" value="전송"/>
</form>
</body>
</html>