<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<h3>include 된 페이지에서 파라미터 확인</h3>
<%=request.getParameter("addr1") %>
<br>
<%=request.getParameter("addr2") %>