<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="net.fullstack10.common.CommonUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#pop {
	border:1px solid blue;
	width:400px;
	padding:0px 20px 20px 0px;
}
</style>
</head>
<body>
<%
String popCheck = "block";

// Cookie[] cookies = request.getCookies();
// if ( cookies != null ) {
// 	for (Cookie c : cookies){
// 		String name = c.getName();
// 		String val = c.getValue();
		
// 		if ( name.equals("popup_close") ) {
// 			if ( val.equals("on") ) {
// 				popCheck = "none";
// 			}
// 		}
// 	}
// }
// ==> CommonUtil 사용으로 변경
CommonUtil cUtil = new CommonUtil();
String popupClose = cUtil.getCookieInfo(request, "popup_close");
out.print("<script>console.log('popupClose : "+popupClose+"');</script>");

popCheck = (popupClose != null && popupClose != "" ? "none" : "block");
%>
<h1>쿠키 테스트</h1>

<div id="pop" style="display:<%=popCheck %>">
	<h2 align="center">공지사항</h2>
	<div align="right">
		<form name="frmCookie" id="frmCookie">
			<input type="checkbox" name="check" id="check" value="Y" />
			하루 동안 열지 않음
			<input type="button" value="닫기" id="btnClose" />
		</form>
	</div>
</div>

<hr>

<div id="popup2" style="display:block">
	<h2>공지사항 팝업창 열기</h2>
	<div>
		<input type="button" id="openPopup" value="팝업창보이기" />
		<!-- 클릭하면 쿠키를 삭제하고, 팝업창이 보여지도록 코드를 작성하세요. -->
	</div>
</div>




<script>
// 자바스크립트에서 이벤트를 적용하는 방법
// 1. 인라인 속성에 onclick = "함수" 형태로 적용
// 2. 객체.onclick = 함수;
// 객체.onclick = ()=>{};
// 3. 객체.addEventListener(이벤트, 함수);


// let check = document.getElementById("check");
// check.addEventListener("click", function(){
// 	console.log("check");
// });

let btnClose = document.getElementById("btnClose");
// 닫기 버튼을 클릭했을 때, 
// id 가 pop 인 div 를 보이지 않게 하는 코드를 작성하세요.
btnClose.addEventListener("click", function(){
	let check = document.getElementById("check");
	let frm = document.getElementById("frmCookie");
	console.log("check : "+ check.value);

	if ( check.checked == true ){
		frm.action = "Cookie2Add.jsp";
		frm.method = "post";
		frm.submit();
	}
});

let openPopup = document.getElementById("openPopup");
openPopup.addEventListener("click", function(){
	let pop = document.getElementById("pop");
	let check = document.getElementById("check");
	let frm = document.getElementById("frmCookie");
	console.log("check : "+ check.value);

	check.checked = false;
	
	frm.action = "Cookie2Add.jsp";
	frm.method = "post";
	frm.submit();
});


</script>
</body>
</html>