<%@page import="net.fullstack10.bbs.BbsDTO"%>
<%@ page import="net.fullstack10.bbs.BbsDAO"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="net.fullstack10.common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="../login/isLogin.jsp" %>
<%
String memberId = session.getAttribute("memberId").toString();
String idx = request.getParameter("no");

BbsDAO dao = new BbsDAO();

// 1. memberId 와 idx 로 조회 -> 로그인 사용자 = 게시글 작성자
// 2. 해당 idx 의 게시글 삭제
BbsDTO dto = dao.getBbsByIdx(idx, memberId);

if (dto != null) {	
	int rtnResult = dao.deleteBbsByIdx(idx);
	if (rtnResult > 0) {
		out.print("<script>");
		out.print("alert('" + idx + " 번 게시글이 삭제되었습니다.');");
		out.print("window.location.replace('list.jsp');");
		out.print("</script>");
		out.close();
	} else {
		out.print("<script>");
		out.print("alert('" + idx + "번 게시글 삭제가 완료되지 않았습니다.');");
		out.print("history.back();");
		out.print("</script>");
		out.close();
	}
} else {
	out.print("<script>");
	out.print("alert('이 글을 삭제할 수 있는 권한이 없습니다.');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}
%>