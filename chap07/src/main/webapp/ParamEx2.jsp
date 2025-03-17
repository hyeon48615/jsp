<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>액션태그 - 파라미터 전달</h1>
<jsp:useBean id="person" class="net.fullstack10.domain.Person" scope="request" />

<h2>forward 된 매개변수 확인</h2>
<ul>
	<li>이름 : <jsp:getProperty name="person" property="name" /></li>
	<li>나이 : <jsp:getProperty name="person" property="age" /></li>
	<li>성별 : <jsp:getProperty name="person" property="sex" /></li>
	<li>이메일 : <%=request.getParameter("email") %></li>
	<li>취미 : <%=request.getParameter("favorite") %></li>
</ul>

<!-- HTML 로 결과만 출력 -->
<jsp:include page="include/ParamInclude.jsp">
	<jsp:param name="addr1" value="서울시 강남구" />
	<jsp:param name="addr2" value="논현동" />
</jsp:include>
</body>
</html>