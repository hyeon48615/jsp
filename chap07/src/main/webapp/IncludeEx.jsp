<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
// 포함 파일
String file1 = "./include/file1.jsp";
String file2 = "./include/file2.jsp";

pageContext.setAttribute("pageParam1", "페이지 영역 파라미터 값");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>액션태그</h1>
<h2>지시어와 액션태그 동작 방식 비교</h2>

<!-- 지시어 -->
<h3>지시어로 페이지 포함</h3>
<%@ include file="./include/file1.jsp" %>
<p>include 파일에 선언한 변수 : <%=fileVar1 %>

<!--  액션태그 -->
<h3>액션 태그로 페이지 포함|</h3>
<jsp:include page="./include/file1.jsp" />
<p>include 파일에 선언한 변수 : <%//=fileVar2 %>
</body>
</html>