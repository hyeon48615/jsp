<%@page import="java.sql.PreparedStatement"%>
<%@page import="net.fullstack10.common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
String memberId = request.getParameter("member_id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");

// validation 체크 루틴
if (memberId == null || memberId.length() < 4 || memberId.length() > 20) {
	out.print("<script>");
	out.print("alert('아이디를 4자리 이상 20자리 이하로 입력하세요');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}
if (pwd == null || pwd.length() < 4 || pwd.length() > 20) {
	out.print("<script>");
	out.print("alert('비밀번호를 4자리 이상 20자리 이하로 입력하세요');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}
if (name == null || name.length() < 2 || name.length() > 10) {
	out.print("<script>");
	out.print("alert('이름을 2자리 이상 10자리 이하로 입력하세요');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}
%>

<%
JDBConnect jdbc = new JDBConnect();

String sql = "UPDATE tbl_member SET";
sql += " pwd = ?, name = ?";
sql += " WHERE memberId = ?";

PreparedStatement psmt = jdbc.conn.prepareStatement(sql);
psmt.setString(1, pwd);
psmt.setString(2, name);
psmt.setString(3, memberId);

int rtnResult = psmt.executeUpdate();

jdbc.close();

if (rtnResult > 0) {
	out.print("<script>");
	out.print("alert('" + memberId + " 회원 정보가 수정되었습니다.');");
	out.print("window.location.replace('list.jsp');");
	out.print("</script>");
	out.close();
} else {
	out.print("<script>");
	out.print("alert('회원 정보 수정이 완료되지 않았습니다.');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}
%>