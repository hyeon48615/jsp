<%@page import="java.sql.PreparedStatement"%>
<%@page import="net.fullstack10.common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
String memberId = request.getParameter("memberId");

if (memberId == null || memberId == "") {
	out.print("<script>");
	out.print("alert('회원 정보가 올바르지 않습니다.');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}

JDBConnect jdbc = new JDBConnect();

String sql = "DELETE FROM tbl_member WHERE memberId = ?";

PreparedStatement psmt = jdbc.conn.prepareStatement(sql);
psmt.setString(1, memberId);

int rtnResult = psmt.executeUpdate();

jdbc.close();

if (rtnResult > 0) {
	out.print("<script>");
	out.print("alert('" + memberId + " 회원이 삭제되었습니다.');");
	out.print("window.location.replace('delete_success.jsp');");
	out.print("</script>");
	out.close();
} else {
	out.print("<script>");
	out.print("alert('회원 삭제가 완료되지 않았습니다.');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}
%>