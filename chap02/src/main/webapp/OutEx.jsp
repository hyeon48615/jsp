<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>내장 객체 - out</h1>

<%
// 버퍼 내용 삭제
out.print("출력되지 않은 정보"); 	// 버퍼 저장
out.clearBuffer(); 				// 버퍼 내용 삭제 -> 브라우저에 출력되지 않음

out.print("<h2>out 내장 객체");

// 버퍼 크기 정보 확인
out.print("출력 버퍼의 크기 : " + out.getBufferSize() + "<br>");
out.print("남은 버퍼의 크기 : " + out.getRemaining() + "<br>");
out.flush();	// 버퍼 내용 출력

out.print("flush 후의 버퍼 크기 : " + out.getRemaining() + "<br>");

// 값 출력
out.print(1);
out.print(false);
out.print("문자열");

// 값을 출력
%>

</body>
</html>