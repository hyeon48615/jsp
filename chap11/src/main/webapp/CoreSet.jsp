<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="chap11.Students"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>JSTL - core - set</h1>
<%!
String str3 = "선언부 변수";
%>
<%
String str2 = "스크립틀릿에서 변수 설정";
%>
<!-- 변수 선언 -->
<c:set var="num1" value="100" />
<c:set var="elnum1" value="${ num1 / 5 }" />
<c:set var="date" value="<%=new Date() %>" />
<c:set var="str1">태그 내부에 변수값 지정</c:set>
<c:set var="str2" value="<%=str2 %>" />
<c:set var="str3" value="<%=str3 %>" />

<h2>변수 출력 - EL 사용</h2>
<ul>
	<li>num1 : ${ num1 }</li> <%-- pageScope.num1 --%>
	<li>elnum1 : ${ elnum1 }</li>
	<li>date : ${ date }</li>
	<li>str1 : ${ str1 }</li>
	<%-- <li>str1 : <%=str1 %> => JSTL 사용시, EL 필수 --%>
	<li>str2 : ${ str2 }</li>
	<li>str3 : ${ str3 }</li>
</ul>

<h2>자바빈즈 생성 - 생성자 이용</h2>
<c:set var="student1" value='<%=new Students("홍길동", 20, 1, "남자") %>' scope="request" />

<ul>
	<li>이름(getName()) : ${ student1.getName() }</li>	
	<li>이름(name) : ${ student1.name }</li>	
	<li>이름(pageScope) : ${ pageScope.student1 }</li>
	<li>이름(requestScope) : ${ requestScope.student1.name }</li>	
</ul>

<h2>자바빈즈 생성 - target, property</h2>
<c:set var="student2" value="<%=new Students() %>" scope="request" />
<c:set target="${ student2 }" property="name" value="홍길순" />
<c:set target="${ student2 }" property="age" value="19" />
<c:set target="${ student2 }" property="gender" value="여자" />

<ul>
	<li>이름 : ${ student2.name }</li>
	<li>나이 : ${ student2.age }</li>
	<li>성별 : ${ student2.gender }</li>
</ul>

<h2>JSTL - 컬렉션 사용</h2>
<%
List<Students> sList = new ArrayList<Students>();
sList.add(new Students("홍길동", 20, 1, "남자"));
sList.add(new Students("홍길순", 19, 1, "여자"));
%>
<c:set var="studentsList" value="<%=sList %>" scope="request" />
<ul>
	<li>이름: ${ requestScope.studentsList[0].name }</li>
	<li>나이: ${ requestScope.studentsList[0].age }</li>
	<li>학년: ${ requestScope.studentsList[0].grade }</li>
	<li>성별: ${ requestScope.studentsList[0].gender }</li>
	<li>이름: ${ requestScope.studentsList[1].name }</li>
	<li>나이: ${ requestScope.studentsList[1].age }</li>
	<li>학년: ${ requestScope.studentsList[1].grade }</li>
	<li>성별: ${ requestScope.studentsList[1].gender }</li>
</ul>
</body>
</html>