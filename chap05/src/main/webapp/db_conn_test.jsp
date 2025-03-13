<%@page import="net.fullstack10.common.DBConnPool"%>
<%@ page import="net.fullstack10.common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>JDBC 테스트 1</h1>
<%
JDBConnect jdbc1;
try {
	jdbc1 = new JDBConnect();
	
	out.println("========================================<br>");
	out.println("DB 접속 성공(기본생성자)<br>");
	out.println("jdbc1 : " + jdbc1 + "<br>");
	out.println("========================================<br>");
	
	jdbc1.close();
} catch (Exception e) {
	out.println("========================================<br>");
	out.println("DB 접속 에러(기본생성자)<br>");
	out.println(e.getMessage() + "<br>");
	out.println("========================================<br>");
}
%>

<h1>JDBC 테스트 2</h1>
<%
String driver = "org.mariadb.jdbc.Driver";
String url = "jdbc:mariadb://localhost:3306/fullstack10";
String id = "root";
String pwd = "1234";


try {
	jdbc1 = new JDBConnect(driver, url, id, pwd);
	
	out.println("========================================<br>");
	out.println("DB 접속 성공(두번째 생성자)<br>");
	out.println("jdbc2 : " + jdbc1 + "<br>");
	out.println("========================================<br>");
	
	jdbc1.close();
} catch (Exception e) {
	out.println("========================================<br>");
	out.println("DB 접속 에러(두번째 생성자)<br>");
	out.println(e.getMessage() + "<br>");
	out.println("========================================<br>");
}

%>

<h1>JDBC 테스트 3</h1>
<%
try {
	jdbc1 = new JDBConnect(application);
	
	out.println("========================================<br>");
	out.println("DB 접속 성공(세번째 생성자)<br>");
	out.println("jdbc2 : " + jdbc1 + "<br>");
	out.println("========================================<br>");
	
	jdbc1.close();
} catch (Exception e) {
	out.println("========================================<br>");
	out.println("DB 접속 에러(세번째 생성자)<br>");
	out.println(e.getMessage() + "<br>");
	out.println("========================================<br>");
}

%>

<h1>커넥션 풀 테스트 1</h1>
<%
DBConnPool pool;
try {
	pool = new DBConnPool();
	
	out.println("========================================" + "<br>");
	out.println("DB 커넥션 풀 연결 성공(기본 생성자)" + "<br>");
	out.println("pool : " + pool + "<br>");
	out.println("========================================" + "<br>");
	
	pool.close();
} catch (Exception e) {
	out.println("========================================" + "<br>");
	out.println("DB 커넥션 풀 연결 실패(기본 생성자)" + "<br>");
	out.println(e.getMessage() + "<br>");
	out.println("========================================" + "<br>");
}

%>

<h1>커넥션 풀 테스트 2</h1>
<%
try {
	String ct = "java:comp/env";
	String ds = "jdbc_maria";
	
	pool = new DBConnPool(ct, ds);
	
	out.println("========================================" + "<br>");
	out.println("DB 커넥션 풀 연결 성공(두번째 생성자)" + "<br>");
	out.println("pool : " + pool + "<br>");
	out.println("========================================" + "<br>");
	
	pool.close();
} catch (Exception e) {
	out.println("========================================" + "<br>");
	out.println("DB 커넥션 풀 연결 실패(두번째 생성자)" + "<br>");
	out.println(e.getMessage() + "<br>");
	out.println("========================================" + "<br>");
}

%>

</body>
</html>