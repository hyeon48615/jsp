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
String search_category = request.getParameter("search_category");
search_category = (search_category != null ? search_category : "");
String search_word = request.getParameter("search_word");
search_word = (search_word != null ? search_word : "");
int page_no = cUtil.parseInt(request.getParameter("page_no"), "1");

String rtnParams = "search_category="+search_category;
rtnParams += "&search_word="+search_word;
//rtnParams += "&page_no="+page_no;


if ( idx < 1 ){
	JSFunction.alertLocation(response, "replace", "접근 경로가 올바르지 않습니다", "list.jsp?"+rtnParams); 
}
%>
<%
// dto 의 내용을 DB 에 등록
BbsDAO dao = new BbsDAO();
int rtnResult = dao.setBbsDelete(idx);
dao.close();

if ( rtnResult > 0 ) {
	JSFunction.alertLocation(response, "replace", "게시물이 삭제되었습니다.", "list.jsp?"+rtnParams);
} else {
	JSFunction.alertBack(response, "게시물 삭제가 완료되지 않았습니다.");
}
%>