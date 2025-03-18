<%@page import="java.time.LocalDateTime"%>
<%@page import="net.fullstack10.member.MemberDTO"%>
<%@page import="net.fullstack10.member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="net.fullstack10.common.DBConnPool"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="net.fullstack10.common.JDBConnect"%>
<%@page import="net.fullstack10.common.CommonUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
// 파라미터
String member_id = request.getParameter("member_id");
String pwd = request.getParameter("pwd");
String save_id_flag = request.getParameter("save_id_flag");
String auto_login_flag = request.getParameter("auto_login_flag");

// 아이디/비밀번호 체크 validation
if (member_id == null || member_id.length() < 4 || member_id.length() > 20) {
	out.print("<script>");
	out.print("alert('아이디 정보가 올바르지 않습니다.');");
	out.print("window.location.replace('login.jsp');");
	out.print("</script>");
	out.close();
} else if (pwd == null || pwd.length() < 4 || pwd.length() > 20) {
	out.print("<script>");
	out.print("alert('비밀번호 정보가 올바르지 않습니다.');");
	out.print("window.location.replace('login.jsp');");
	out.print("</script>");
	out.close();
}

MemberDAO dao = new MemberDAO();
MemberDTO dto = dao.getMemberInfo(member_id, pwd);

CommonUtil cUtil = new CommonUtil();

// 1. 아이디/비밀번호 체크 로직 성공 여부
// 2. save_id_flag : 아이디 저장 로직 --> 쿠키
// 3. auto_login_flag : 자동 로그인 로직 --> 쿠키 + 세션
if (dto != null && dto.getMemberId() != null) {
	session.setAttribute("memberId", dto.getMemberId());
	session.setAttribute("name", dto.getName());
	
	if (save_id_flag != null && save_id_flag.equals("Y")) {
		cUtil.makeCookie(response, "", "/", 3600, "save_id_flag", save_id_flag);
		cUtil.makeCookie(response, "", "/", 3600, "saved_id", member_id);
	} else {
		cUtil.makeCookie(response, "", "/", 0, "save_id_flag", "");
		cUtil.makeCookie(response, "", "/", 0, "saved_id", "");
	}
	
	if (auto_login_flag != null && auto_login_flag.equals("Y")) {
		cUtil.makeCookie(response, "", "/", 3600, "auto_login_session", session.getId());
		LocalDateTime expiredDate = LocalDateTime.now().plusSeconds(3600);
		dao.saveAutoLogin(member_id, session.getId(), expiredDate);
		// cUtil.makeCookie(response, "", "/", 3600, "auto_login_flag", auto_login_flag);
	} else {
		cUtil.makeCookie(response, "", "/", 0, "auto_login_session", "");
		// cUtil.makeCookie(response, "", "/", 0, "auto_login_flag", "");
	}
} else {
	out.print("<script>");
	out.print("alert('로그인 정보가 올바르지 않습니다.');");
	out.print("window.location.replace('login.jsp');");
	out.print("</script>");
	out.close();
}
dao.close();
response.sendRedirect("login.jsp");
%>