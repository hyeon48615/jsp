<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>내장 객체 - session</h1>
<h2>로그인 페이지</h2>

<div id="container">
<%
if (session.getAttribute("memberId") == null) {
	// 로그아웃 상태
%>
	<form name="frmLogin" id="frmLogin" action="login_ok.jsp" method="post">
		아이디 : <input type="text" name="member_id" id="member_id" maxlength="20"/>
		<input type="checkbox" name="save_id_flag" id="save_id_flag" value="Y"/>
		아이디 저장하기
		<br>
		비밀번호 : <input type="password" name="pwd" id="pwd" maxlength="20"/>
		<br>
		<input type="submit" value="로그인" />
	</form>
<%
} else {
	// 로그인 상태
%>
<%=session.getAttribute("memberId") %> 님, 안녕하세요.
<br>
<a href="#"><b>[ 로 그 아 웃 ]</b></a>
<%
}
%>
</div>

</body>
</html>