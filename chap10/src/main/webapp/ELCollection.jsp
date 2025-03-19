<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="chap10.Students"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>표현 언어 - 컬렉션</h1>
<%
List<Object> aList = new ArrayList<Object>();
aList.add("오브젝트");
aList.add(new Students("홍길동", 20, 2, "남자"));
pageContext.setAttribute("student", aList);
%>
<h2>aList 요소 출력</h2>
<ul>
	<li>aList[0] : ${ student[0] }</li>
	<li>aList[1] : ${ student[1].name }, ${ student[1].age }, ${ student[1].grade }, ${ student[1].gender }</li>
	<%-- <li>aList[1] : ${ student[1].name2 }</li> -> Students 클래스에서 에러를 발생시킴 --%>
	<li>aList[2] : ${ student[2] }</li>
</ul>

<h2>Map 컬렉션</h2>
<%
Map<String, String> map = new HashMap<>();
map.put("한글1", "english");
map.put("eng", "한글");
pageContext.setAttribute("map", map);
%>
<ul>
	<li>${ map["한글1"] }, ${ map.한글1 }, ${ map['한글1'] }</li>
	<li>${ map["eng"] }, ${ map.eng }, ${ map['eng'] }</li>
</ul>
</body>
</html>