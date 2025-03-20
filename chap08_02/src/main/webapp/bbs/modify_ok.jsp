<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="net.fullstack10.bbs.BbsDTO"%>
<%@page import="net.fullstack10.bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="../login/isLogin.jsp" %>
<%
String memberId = session.getAttribute("memberId").toString();
String idx = request.getParameter("no");

BbsDAO dao = new BbsDAO();

//1. memberId 와 idx 로 조회 -> 로그인 사용자 = 게시글 작성자
//2. 해당 idx 의 게시글 수정
if (dao.getBbsByIdx(idx, memberId) != null) {
	BbsDTO dto = new BbsDTO();
	dto.setTitle(request.getParameter("title"));
	dto.setContent(request.getParameter("content").replace("\r\n", "<br>"));
	
	int rtnResult = dao.updateBbsByIdx(idx, dto);
	if (rtnResult > 0) {
		out.print("<script>");
		out.print("alert('" + idx + " 번 게시글이 수정되었습니다.');");
		out.print("window.location.href = 'view.jsp?no=" + idx + "'");
		out.print("</script>");
		out.close();
	} else {
		out.print("<script>");
		out.print("alert('" + idx + "번 게시글 수정이 완료되지 않았습니다.');");
		out.print("history.back();");
		out.print("</script>");
		out.close();
	}
} else {
	out.print("<script>");
	out.print("alert('이 글을 수정할 수 있는 권한이 없습니다.');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}
%>