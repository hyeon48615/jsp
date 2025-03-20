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
<%
Students student = new Students();
pageContext.setAttribute("student", student);
%>

<h1>표현 언어 - 메서드 호출</h1>

<h2>page 영역에 저장 후 호출</h2>
001225-3123456 ==> ${ student.getBirthInfo("001225-3123456") }
<br>
<%-- 생일은 2000년 12월 25일 입니다. 출력하는 메서드 추가 --%>
001225-3123456 ==> ${ student.printBirthInfo("001225-3123456") }
<br>
<%-- 생일은 1999년 12월 25일 입니다. 출력하는 메서드 추가 --%>
991225-1123456 ==> ${ student.printBirthInfo("991225-1123456") }
<br>
001225-3123456 ==> ${ student.getSex("001225-3123456") }
<br>
<%-- 성별은 남자 입니다. 출력하는 메서드 추가 --%>
001225-3123456 ==> ${ student.printSex("001225-3123456") }
<br>
<%-- 성별은 여자 입니다. 출력하는 메서드 추가 --%>
991225-2123456 ==> ${ student.printSex("991225-2123456") }

<h2>static 메서드 호출</h2>
${ Students.showPersonInfo("홍길동", 20, "남성") }
</body>
</html>