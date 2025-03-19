<%@page import="net.fullstack10.member.MemberDTO"%>
<%@page import="net.fullstack10.member.MemberDAO"%>
<%@page import="net.fullstack10.common.CommonUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../basic.css" rel="stylesheet" type="text/css">

<style>
	table {
		width: 100%;
	}
	
	table, thead, tbody, th, tr, td {
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	th {
		text-align: center;
		min-width: 120px;
		height: 20px;
		background-color: #efefef;
	}
	
	.input_col {
		min-width: 400px;
		height: 40px;
	}
	
	.input_box {
		width: 400px;
		height: 30px;
		margin: 2px 0px 2px 4px;
	}
	
	.input_box_id {
		width: 300px;
		margin-right: 5px;
	}
	
	.align_center {
		text-align: center;
	}
	.login_th {
		min-width: 400px;
		height: 40px;
	}
	.login_btn {
		position: relative;
		height: 40px;
	}
	#auto_login_checkbox {
		position: absolute;
		left: 10px;
	}
</style>
</head>
<body>
<%
CommonUtil cUtil = new CommonUtil();
String save_id_flag = cUtil.getCookieInfo(request, "save_id_flag");
String saved_id = cUtil.getCookieInfo(request, "saved_id");
// String auto_login_flag = cUtil.getCookieInfo(request, "auto_login_flag");
String auto_login_session = cUtil.getCookieInfo(request, "auto_login_session");

if (auto_login_session != null) {
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getMemberInfoBySessionId(auto_login_session);
	dao.close();
	
	if (dto != null && dto.getMemberId() != null) {
		session.setAttribute("memberId", dto.getMemberId());
		session.setAttribute("name", dto.getName());
	}
}
%>
	<div class="container">
		<form name="frmLogin" id="frmLogin" method="post">
		<% if (session.getAttribute("memberId") == null) { %>
			<h1>로그인</h1>
			<table>
				<tbody>
					<tr>
						<th>아이디</th>
						<td class="input_col">
							<input type="text" class="input_box input_box_id" name="member_id" id="member_id" value="<%=saved_id %>" maxlength="20" autofocus /> 
							<input type="checkbox" name="save_id_flag" id="save_id_flag" value="Y" <%=(save_id_flag != null && save_id_flag.equals("Y") ? "checked" : "") %> /> 아이디 저장
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td class="input_col">
							<input type="password" class="input_box" name="pwd" id="pwd" value="" maxlength="20" />
						</td>
					</tr>
					<tr>
						<td colspan="2" class="align_center login_btn">
							<span id="auto_login_checkbox"><input type="checkbox" name="auto_login_flag" id="auto_login_flag" value="Y" /> 자동 로그인</span>
							<input type="submit" id="btnLogin" value="로그인" /> 
							<input type="button" id="btnCancel" value="취소" />
						</td>
					</tr>
				</tbody>
			</table>

			<script>
				// 로그인
				const btnLogin = document.getElementById("btnLogin");
				btnLogin.addEventListener("click", (e) => {
					e.preventDefault();
				    e.stopPropagation();
				    
				    const frm = document.querySelector("#frmLogin");
					const memberId = frm.member_id.value;
					const pwd = frm.pwd.value;
					
				    if (memberId == null || memberId.length < 4 || memberId.length > 20 ) {
				    	alert('아이디를 4자리 이상 20자리 이하로 입력하세요.');
				    	frm.member_id.focus();
				    	return;
				    }
					if (pwd == null || pwd.length < 4 || pwd.length > 20 ) {
						alert('비밀번호를 4자리 이상 20자리 이하로 입력하세요.');
						frm.pwd.focus();
				    	return;
					}
					
					frm.action = "login_ok.jsp";
					frm.method = "post";
					frm.submit();
				});
				
				//로그인 취소
				const btnCancel = document.getElementById("btnCancel");
				btnCancel.addEventListener("click", (e)=>{
					e.preventDefault();
					e.stopPropagation();
					
				 	const frm = document.querySelector("#frmLogin");
				 	frm.member_id.value = "";
				 	frm.pwd.value = "";
	
					// const els = document.querySelectorAll("input[type='text'], input[type='password']");
					// els.forEach((el)=>{
					//  	el.value = "";
					// });
				});
			</script>
		<% } else { %>
			<table>
				<tbody>
					<tr>
						<th class="login_th"><%=session.getAttribute("memberId")%> 님, 안녕하세요.</th>
					</tr>
					<tr>
						<td colspan="2" class="align_center login_btn">
							<input type="submit" id="btnLogout" value="로그아웃" /> 
							<input type="button" id="btnGotoMyPage"  value="마이페이지" />
							<input type="button" id="btnGotoBbsList" value="게시판목록" />
						</td>
					</tr>
				</tbody>
			</table>
			
			<script>
				// 로그아웃
				const btnLogout = document.getElementById("btnLogout");
				btnLogout.addEventListener("click", (e) => {
					e.preventDefault();
				    e.stopPropagation();
				    
				    const frm = document.querySelector("#frmLogin");
					const confirm_flag = confirm("로그아웃 하시겠습니까?");
					if (confirm_flag) {
						frm.action = "logout_ok.jsp";
						frm.method = "post";
						frm.submit();
					}
				});
				
				//게시판 목록으로 이동
				const btnGotoBbsList = document.getElementById("btnGotoBbsList");
				btnGotoBbsList.addEventListener("click", (e)=>{
					e.preventDefault();
					e.stopPropagation();
					
				 	window.location.href = "/chap08/bbs/list.jsp";
				});
			</script>
		<% } %>
		</form>
	</div>
</body>
</html>