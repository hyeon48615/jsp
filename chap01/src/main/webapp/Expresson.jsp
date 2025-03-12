<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 요소</title>
</head>
<body>
<%! // 선언부
public int add(int num1, int num2) {
	return num1 + num2;
}
%>

<h1>스크립트 요소 - 표현식(Expression)</h1>

<%
int result = add(10, 30);
%>
결과 1 : <%=result %>
<%
out.print("<br/>");
%>
결과 2: <%=add(100, 200) %>
</body>
</html>