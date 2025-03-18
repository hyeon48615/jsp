<%@page import="net.fullstack10.common.CommonUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
CommonUtil cUtil = new CommonUtil();

session.removeAttribute("memberId");
session.removeAttribute("name");

session.invalidate();

// cUtil.makeCookie(response, "", "/", 0, "save_id_flag", "");
// cUtil.makeCookie(response, "", "/", 0, "saved_id", "");
cUtil.makeCookie(response, "", "/", 0, "auto_login_flag", "");

response.sendRedirect("login.jsp");
%>