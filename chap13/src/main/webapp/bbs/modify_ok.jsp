<%@page import="net.fullstack10.common.JSFunction"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="net.fullstack10.common.CommonDateUtil"%>
<%@page import="net.fullstack10.common.CommonUtil"%>
<%@page import="net.fullstack10.bbs.BbsDTO"%>
<%@page import="net.fullstack10.bbs.BbsDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="net.fullstack10.common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
CommonUtil cUtil = new CommonUtil();
CommonDateUtil dUtil = new CommonDateUtil();

int idx = cUtil.parseInt(request.getParameter("idx"));
String memberId = request.getParameter("member_id");
String title = request.getParameter("title");
String content = request.getParameter("content");

String rtnParam = URLEncoder.encode(request.getRequestURI(), "UTF-8");


if ( idx < 1 ){
	JSFunction.alertLocation(response, "replace", "접근 경로가 올바르지 않습니다", "list.jsp?"+rtnParam); 
}

// validation 체크 루틴
if (memberId == null || memberId.length() < 4 || memberId.length() > 20){
	JSFunction.alertBack(response, "아이디를 4자리 이상 20자리 이하로 입력하세요.");
}
if (title == null || title.length() < 2 || title.length() > 100){
	JSFunction.alertBack(response, "제목을 1자리 이상 1000자리 이하로 입력하세요.");
}
if (content == null || content.length() < 2 || content.length() > 1000){
	JSFunction.alertBack(response, "글 내용을 1자리 이상 1000자리 이하로 입력하세요.");
// 	out.print("<script>");
// 	out.print("alert('글 내용을 1자리 이상 1000자리 이하로 입력하세요.');");
// 	out.print("history.back();");
// 	out.print("</script>");
// 	out.close();
}
%>
<%
// 게시물 내용 BbsDTO 객체에 할당
BbsDTO dto = new BbsDTO();
dto.setIdx(idx);
dto.setUser_id(memberId);
dto.setTitle(title);
dto.setContent(content);

// dto 의 내용을 DB 에 등록
BbsDAO dao = new BbsDAO();
int rtnResult = dao.setBbsModify(dto);
dao.close();

if ( rtnResult > 0 ) {
	JSFunction.alertLocation(response, "replace", "게시물이 수정되었습니다.", "list.jsp?"+rtnParam);
// 	out.print("<script>");
// 	out.print("alert('게시물이 등록되었습니다.');");
// 	out.print("window.location.replace('list.jsp');");
// 	out.print("</script>");
// 	out.close();
} else {
	JSFunction.alertBack(response, "게시물 수정이 완료되지 않았습니다.");
// 	out.print("<script>");
// 	out.print("alert('게시물 등록이 완료되지 않았습니다.');");
// 	out.print("history.back();");
// 	out.print("</script>");
// 	out.close();
}
%>