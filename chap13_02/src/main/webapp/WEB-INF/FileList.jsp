<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>DB에 등록된 파일 목록 보기</h2>
	<a href="./regist.do">단일 파일 등록</a>
	<a href="./multiRegist.do">다중 파일 등록</a>
	
	<table border="1">
		<tr>
			<th>No</th>
			<th>제목</th>
			<th>카테고리</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="file" items="${fileList}">
		    <tr style="cursor: pointer;" onclick="window.location.href='./view.do?idx=${ file.idx }'">
		        <td>${ file.idx }</td>
		        <td>${ file.title }</td>
		        <td>${ file.category }</td>
		        <td>${ file.postdate }</td>
		    </tr>
		</c:forEach>
	</table>
</body>
</html>