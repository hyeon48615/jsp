<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>한 번의 매핑으로 여러 가지 요청 처리</h1>
${ rtnTitle }
<ol>
	<li>URI : ${ uri }</li>
	<li>요청 : ${ reqStr }</li>
</ol>

<ul>
	<li><a href="./free.bbs">자유게시판</a></li>
	<li><a href="./event.bbs">이벤트게시판</a></li>
	<li><a href="./image.bbs">이미지게시판</a></li>
</ul>
</body>
</html>