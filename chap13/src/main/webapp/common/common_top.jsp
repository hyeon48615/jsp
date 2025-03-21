<%@page import="java.net.URLEncoder"%>
<%@page import="net.fullstack10.common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
final String __BASE_URL = "/chap13";
String __SESSION_USER_ID = (session.getAttribute("memberId")!=null? session.getAttribute("memberId").toString():"");
final boolean __LOGIN_FLAG = (__SESSION_USER_ID!=null && !__SESSION_USER_ID.isEmpty());

if ( !__LOGIN_FLAG ) {
	//request.getRequestURI();
	//request.getHeader("referer");
	String nowURI = request.getRequestURI();
	String[] accAllowList = {"/chap13/bbs/list.jsp"};
	String rtn_url = "";
	boolean check_flag = true;
	for ( String url : accAllowList ){
//		System.out.println("nowURI : "+ nowURI);
//		System.out.println("url : "+ url);
		if ( nowURI != null && nowURI.equals(url) ) {
//	 		String rtn_url = request.getHeader("referer");
//	 		if ( rtn_url != null && !rtn_url.isEmpty() && !rtn_url.isBlank() ) {
//	 			rtn_url = URLEncoder.encode(rtn_url, "UTF-8");
//	 		}
			check_flag = false;
			break;
		}
	}

// 	if ( check_flag ) {
// 		rtn_url = URLEncoder.encode(nowURI, "UTF-8");
//		JSFunction.alertLocation(response, "replace", "로그인 하신 후 사용 가능 합니다.", __BASE_URL+"/login/login.jsp?rtn_url="+rtn_url); 
//	}
}

%>

<link rel="stylesheet" href="<%=__BASE_URL %>/css/common.css" >

<div id="top_menu">
<%if (!__LOGIN_FLAG) {%>
<input type="button" name="btn_login" id="btn_login" value="로그인" />
<%} else { %>
<input type="button" name="btn_logout" id="btn_logout" value="로그아웃" />
<%} %>
</div>

<script>
const btnLogin = document.querySelector("#btn_login");
if (btnLogin != null){
	document.querySelector("#btn_login").addEventListener("click", 
			function(e){location.href="<%=__BASE_URL%>/login/login.jsp";}
	, false);
}
const btnLogOut = document.querySelector("#btn_logout");
if (btnLogOut != null){
	document.querySelector("#btn_logout").addEventListener("click", function(e){
		location.href="<%=__BASE_URL%>/login/logout_ok.jsp";
	}, false);
}
</script>
