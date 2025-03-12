<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>내장 객체 - request></h1>

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id"); // html 에 있는 name 속성 값
String sex = request.getParameter("sex");
String[] favorite = request.getParameterValues("favorite");
String strFavorite = "";
if (favorite != null) {
	for(int i=0; i<favorite.length; i++) {
		strFavorite += favorite[i] + " ";
	}
}
String introduce = request.getParameter("introduce");
introduce = (introduce != null && introduce != "" ? introduce.replace("\r\n", "<br/>").replace(" ", "&nbsp") : "");
%>

<ul>
	<li>아이디: <%=id %></li>
	<li>성별: <%=sex %></li>
	<li>관심사항: <%=strFavorite %></li>
	<li>자기소개: <%=introduce %></li>
</ul>

</body>
</html>