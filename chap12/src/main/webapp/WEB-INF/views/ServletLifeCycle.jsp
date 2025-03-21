<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		function req(obj, reqType) {
			obj.form.method = reqType;
			obj.form.submit();
		}
	</script>
	
	<h1>서블릿 라이프사이클</h1>
	
	<h2>서블릿 라이플사이클 메서드</h2>
	<form>
		<input type="button" value="GET 방식 요청" onclick="req(this, 'get')" />
		<input type="button" value="POST 방식 요청" onclick="req(this, 'post')" />
	</form>
</body>
</html>