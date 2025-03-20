<%@page import="net.fullstack10.bbs.BbsDAO"%>
<%@page import="net.fullstack10.bbs.BbsDTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="net.fullstack10.common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
String memberId = request.getParameter("memberId");
String title = request.getParameter("title");
String content = request.getParameter("content");

// validation 체크 루틴
if (memberId == null || memberId.length() < 4 || memberId.length() > 20) {
	out.print("<script>");
	out.print("alert('아이디를 4자리 이상 20자리 이하로 입력하세요');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}
if (title == null || title.length() < 1 || title.length() > 100) {
	out.print("<script>");
	out.print("alert('제목을 1자리 이상 100자리 이하로 입력하세요');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}
if (content == null || content.length() < 1|| content.length() > 1000) {
	out.print("<script>");
	out.print("alert('내용을 1자리 이상 1000자리 이하로 입력하세요');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}
%>

<%
BbsDTO dto = new BbsDTO();
dto.setUser_id(memberId);
dto.setTitle(title);
dto.setContent(content.replace("\r\n", "<br>"));

BbsDAO dao = new BbsDAO();
int rtnResult = dao.setBbsRegist(dto);
dao.close();

if (rtnResult > 0) {
	out.print("<script>");
	out.print("alert('게시물이 등록되었습니다.');");
	out.print("window.location.replace('list.jsp');");
	out.print("</script>");
	out.close();
} else {
	out.print("<script>");
	out.print("alert('게시물 등록이 완료되지 않았습니다.');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}
%>