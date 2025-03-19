<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>표현 언어 - 연산자</h1>
<%
pageContext.setAttribute("num1", "10");
pageContext.setAttribute("num2", "20");
pageContext.setAttribute("num3", "30");
int num4 = 40;
%>

<h2>변수 할당</h2>
스클립틀릿에서 선언 : ${ num4 }<br>
page 영역 : ${ num1 }, ${ num2 }, ${ num3 }<br>
변수 할당 및 즉시 출력 : ${ num1 = 7 }<br>
변수 할당 및 별도 출력 : ${ num2 = 17;'' } => ${ num2 }<br>
num1 = ${ num1 }, num2 = ${ num2 }, num3 = ${ num3 }, num4 = ${ num4 }

<h2>산술 연산자</h2>
num1 + num2 : ${ num1 + num2 }<br>
num1 - num2 : ${ num1 - num2 }<br>
num1 * num2 : ${ num1 * num2 }<br>
num1 / num2 : ${ num1 / num2 }<br>
<%-- num3 / num4 : ${ num3 / num4 }<br> --%>
<%-- num3 % num4 : ${ num3 % num4 }<br> --%>

<%
pageContext.setAttribute("num1", "10");
pageContext.setAttribute("num2", "20");
pageContext.setAttribute("num3", "30");
num4 = 40;
%>

<h2>+ 연산자</h2>
<p>'+' : 문자열 연결 연산을 수행하지 않음</p>
num1 + "100" : ${ num1 + "100" }<br>
<%-- num1 + "이십" : ${ num1 + "이십" }<br> --> NumberFormatException --%>
num2 + "100" : ${ num2 + "100" }<br>
<%-- num2 + "이십" : ${ num2 + "이십" }<br> --> NumberFormatException --%>
num2 + 100 : ${ num2 + 100 }<br>
<%-- "이십" + num2 : ${ "이십" + num2 }<br> --> NumberFormatException --%>
"100" + num2 : ${ "100" + num2 }<br>

<h2>논리 연산자</h2>
num3 <= num4 && num3 == num4 : ${ num3 le num4 and num3 eq num4 }<br>
num3 <= num4 && num3 == num4 : ${ num3 <= num4 && num3 == num4 }<br>
num3 >= num4 || num3 != num4 : ${ num3 ge num4 or num3 ne num4 }<br>
num3 >= num4 || num3 != num4 : ${ num3 >= num4 || num3 != num4 }<br>
</body>
</html>