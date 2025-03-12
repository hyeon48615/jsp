<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="net.fullstack10.common.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>application 영역 속성 조회</h1>

<%
List<String> list = (ArrayList<String>)application.getAttribute("list");
Map<String, Person> map = (HashMap<String, Person>)application.getAttribute("map");
Set<String> keys = map.keySet();
for (String key : keys){
	Person person = map.get(key);
	out.print(String.format("이름 : %s, 나이 : %d, 성별: %s<br>", person.getName(), person.getAge(), person.getSex()));
}

for (String str : list){
	out.print(str + "<br>");
}
%>

</body>
</html>