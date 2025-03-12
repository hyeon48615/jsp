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

<h2>1. 클라이언트와 서버 환경 정보 읽기</h2>
<a href="RequestInfo.jsp?eng=Hello&kor=한글">Get 방식 전송</a>

<hr>

<form name="frmForm" action="RequestInfo.jsp" method="post">
	영어 : <input type="text" name="eng" value="HI" /> <br/>
	한글 : <input type="text" name="kor" value="안녕" /> <br/>
	<input type="submit" value="POST 방식 전송" />
</form>

<hr>

<h2>2. 클라이언트의 요청 매개 변수 읽기</h2>
<form name="frmClient" action="RequestParam.jsp" method="post">
	아이디 : <input type="text" name="id" id="id" value="" /> <br/>
	성별 : 
		<input type="radio" name="sex" id="sex_0" value="man" /> 남자
		<input type="radio" name="sex" id="sex_1" value="woman" /> 여자
		<br/>
	관심사항 : 
		<input type="checkbox" name="favorite" id="favorite_0" value="경제" /> 경제
		<input type="checkbox" name="favorite" id="favorite_1" value="정치" /> 정치
		<input type="checkbox" name="favorite" id="favorite_2" value="연예" /> 연예
		<input type="checkbox" name="favorite" id="favorite_3" value="스포츠" /> 스포츠
		<br/>
	자기소개 : 
	<textarea name="introduce" cols="30" rows="4"></textarea>
	<br/>
	<input type="submit" value="전송하기" />
</form>

<h2>3. HTTP 요청 헤더 정보 읽기</h2>
<a href="RequestHeader.jsp">요청 헤더 정보 읽기</a>
</body>
</html>