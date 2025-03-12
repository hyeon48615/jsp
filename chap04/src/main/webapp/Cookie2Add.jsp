<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="net.fullstack10.common.CommonUtil" %>
<%!
// public void makeCookie(HttpServletRequest req, HttpServletResponse res
// 			, String domain, String path, int exp
// 			, String cName, String cValue) {
// 	// 쿠키 삭제
// 	Cookie cookie = new Cookie(cName, cValue);
// 	if ( domain != null ){
// 		cookie.setDomain(domain);
// 	}
// 	if ( path != null ){
// 		cookie.setPath(path);
// 	}
// 	cookie.setMaxAge(exp);
// 	res.addCookie(cookie);
// }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String popup_flag = request.getParameter("check");
out.print("check "+ popup_flag);

CommonUtil cUtil = new CommonUtil();

if ( popup_flag != null && popup_flag.equals("Y") ) {
	// 쿠키 저장
// 	Cookie cookie = new Cookie("popup_close", "on");
// 	cookie.setPath("/");
// 	cookie.setMaxAge(10);
// 	response.addCookie(cookie);
//	cUtil.makeCookie(response, "", "/", 10, "popup_close", "on");

	out.println("쿠키 : 창 열지 않기 설정");
	out.println("<script>console.log('쿠키 창 열지 않기 설정 : "+ popup_flag +"')");
} else {
	// 쿠키 삭제
// 	Cookie cookie = new Cookie("popup_close", "off");
// 	cookie.setPath("/");
// 	cookie.setMaxAge(0);
// 	response.addCookie(cookie);

	out.println("쿠키 : 창 열기 설정");
	out.println("<script>console.log('쿠키 창 열기 설정 : "+ popup_flag +"')");

	cUtil.makeCookie(response, "", "/", 0, "popup_close", "");

}

response.sendRedirect("CookieEx2.jsp");
%>
</body>
</html>