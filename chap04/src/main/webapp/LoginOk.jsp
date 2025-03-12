<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="net.fullstack10.common.CommonUtil" %>
<%
// 1. 파라미터를 요청
// 2. 파라미터 값에 따른 쿠키 저장 프로세스 처리
// 3. CookieLogin.jsp (혹은 다른 URL) 이동
String user_id = request.getParameter("user_id");
String pwd = request.getParameter("pwd");
String save_id_flag = request.getParameter("save_id_flag");

CommonUtil cUtil = new CommonUtil();

out.print("<script>console.log('user_id : "+ user_id +"');</script>");
out.print("<script>console.log('pwd "+ pwd +"');</script>");
out.print("<script>console.log('save_id_flag "+ save_id_flag +"');</script>");

if ( user_id != null && user_id.equals("user01") && pwd != null && pwd.equals("1234") ) {
	if ( save_id_flag != null && save_id_flag.equals("Y") ) {
		out.print("<script>console.log('쿠키 저장');</script>");
		// 쿠키 저장
		// 아이디 저장 여부 설정
		cUtil.makeCookie(response, "", "/", 10, "save_id_flag", save_id_flag);
		// 아이디 저장
		cUtil.makeCookie(response, "", "/", 10, "saved_id", user_id);
	} else {
		// 아이디 저장 여부 삭제
		cUtil.makeCookie(response, "", "/", -1442, "save_id_flag", "");
		// 아이디 저장 삭제
		cUtil.makeCookie(response, "", "/", -1442, "saved_id", "");
	}

	out.print("<script>console.log('로그인에 성공했습니다.');</script>");
} else {
	out.print("<script>console.log('로그인 정보가 올바르지 않습니다.');</script>");
}

response.sendRedirect("CookieLogin.jsp");
%>
