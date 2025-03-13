<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="net.fullstack10.common.CommonUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
CommonUtil cUtil = new CommonUtil();
String saveIdFlag = cUtil.getCookieInfo(request, "save_id_flag");
String savedId = cUtil.getCookieInfo(request, "saved_id");
%>

<h1>쿠키 사용하기 - 아이디 저장하기</h1>
<h2>로그인 페이지</h2>
<div id="container">
	<form name="frmLogin" id="frmLogin" action="LoginOk.jsp" method="post">
		아이디 : <input type="text" name="user_id" id="user_id"
		 value="<%=savedId %>" />
		<input type="checkbox" name="save_id_flag" id="save_id_flag" value="Y" <%=(saveIdFlag != null && saveIdFlag.equals("Y") ? "checked" : "") %> />
		아이디 저장하기
		<br>
		비밀번호 : <input type="password" name="pwd" id="pwd" />
		<br>
		<input type="submit" value="로그인" />
	</form>
</div>



</body>
</html>