<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
<h1>application 영역</h1>
<h2>application 영역의 속성값 공유</h2>
<%
List<String> list = new ArrayList<>();
list.add("강아지");
list.add("고양이");
list.add("송아지");

Map<String, Person> map = new HashMap<>();
map.put("std1", new Person("홍길동", 20, "남자"));
map.put("std2", new Person("홍길동1", 21, "남자"));

application.setAttribute("list", list);
application.setAttribute("map", map);

%>

application 영역에 속성을 저장하였습니다.

</body>
</html>