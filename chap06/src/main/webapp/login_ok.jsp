<%@page import="net.fullstack10.member.MemberDTO"%>
<%@page import="net.fullstack10.member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="net.fullstack10.common.DBConnPool"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="net.fullstack10.common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
String member_id = request.getParameter("member_id");
String pwd = request.getParameter("pwd");

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

// 아이디/비밀번호 체크 플래그
boolean check_id_flag = false;
boolean check_pwd_flag = false;

/* String name = "";

// 1. JDBConnection 설정
DBConnPool DBPool = new DBConnPool();
// JDBConnect jdbc = new JDBConnect();

// 2. 쿼리 구문 작성
StringBuilder sb = new StringBuilder();
sb.append("SELECT memberId, pwd, name FROM tbl_member");
sb.append(" WHERE memberId = ?");

// 3. PreparedStatement 구문 생성 및 변수 할당
PreparedStatement psmt = DBPool.conn.prepareStatement(sb.toString());
psmt.setString(1, member_id);

// 4. 쿼리 수행
ResultSet rs = psmt.executeQuery();

if (rs.next()) {
	check_id_flag = true;
	
	if (pwd.equals(rs.getString("pwd"))) {
		check_pwd_flag = true;
		
		name = rs.getString("name");
	}
}

// 5. 리소스 해지
DBPool.close();

if (check_id_flag && check_pwd_flag) {
	session.setAttribute("memberId", member_id);
	session.setAttribute("name", name);
} else {
	out.print("<script>");
	out.print("alert('로그인 정보가 올바르지 않습니다.');");
	out.print("window.location.replace('login.jsp');");
	out.print("</script>");
	out.close();
}

response.sendRedirect("login.jsp"); */

	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getMemberInfo(member_id, pwd);
	dao.close();
	
	if (dto != null && dto.getMemberId() != null) {
		session.setAttribute("memberId", dto.getMemberId());
		session.setAttribute("name", dto.getName());
	} else {
		out.print("<script>");
		out.print("alert('로그인 정보가 올바르지 않습니다.');");
		out.print("window.location.replace('login.jsp');");
		out.print("</script>");
		out.close();
	}
	response.sendRedirect("login.jsp");
%>