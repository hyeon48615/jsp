<%@page import="chap10.Students"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>표현언어 - 폼처리</h1>

<%
request.setAttribute("student", new Students("홍길동", 20, 1, "남자"));
request.setAttribute("str", "무궁화 꽃이 피었습니다.");
%>

<form action="ELFormOk.jsp" method="post">
이름 : <input type="text" name="name" />
<br>
성별 : 
<input type="radio" name="sex" value="남자" />남자
<input type="radio" name="sex" value="여자" />여자
<br>
취미 :
<select name="favorite">
<!-- value 명시하지 않을 경우, innerText에 있는 값이 자동으로 지정된다. 
	단, 명시하는 버릇을 들일 것! -->
	<option value="축구">축구</option> 
	<option value="농구">농구</option>
	<option value="야구">야구</option>
	<option value="골프">골프</option>
</select>
<br>
관심사항 :
<input type="checkbox" name="curious" value="우주" />우주
<input type="checkbox" name="curious" value="영화" />영화
<input type="checkbox" name="curious" value="연애" />연애
<br>
지역 : 
<select name="area" multiple="multiple">
	<option value="경기도">경기도</option> 
	<option value="서울">서울</option>
	<option value="부산">부산</option>
	<option value="강원">강원</option>
</select>
<br>
<input type="submit" value="전송" />
</form>

<jsp:forward page="ELFormForward.jsp">
	<jsp:param name="age" value="20" />
	<jsp:param name="gender" value="M" />
</jsp:forward>
</body>
</html>