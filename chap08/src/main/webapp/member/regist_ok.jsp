<%@page import="java.sql.PreparedStatement"%>
<%@page import="net.fullstack10.common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
String memberId = request.getParameter("member_id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");

// validation 체크 루틴
if (memberId == null || memberId.length() < 4 || memberId.length() > 20) {
	out.print("<script>");
	out.print("alert('아이디를 4자리 이상 20자리 이하로 입력하세요');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}
if (pwd == null || pwd.length() < 4 || pwd.length() > 20) {
	out.print("<script>");
	out.print("alert('비밀번호를 4자리 이상 20자리 이하로 입력하세요');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}
if (name == null || name.length() < 2 || name.length() > 10) {
	out.print("<script>");
	out.print("alert('이름을 2자리 이상 10자리 이하로 입력하세요');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}
%>

<%
// 1. JDBC 객체 생성
JDBConnect jdbc = new JDBConnect();

// 2. 쿼리 구문 작성
String sql = "INSERT INTO tbl_member(memberId, pwd, name) values (?, ?, ?)";

// 3. PreparedStatement 구문 생성 및 변수 할당
PreparedStatement psmt = jdbc.conn.prepareStatement(sql);
// jdbc.psmt = jdbc.conn.prepareStatement(sql);
psmt.setString(1, memberId);
psmt.setString(2, pwd);
psmt.setString(3, name);

// 4. 쿼리 수행
int rtnResult = psmt.executeUpdate();	// executeUpdate() -> insert, update, delete
// out.print(rtnResult + " 행이 입력되었습니다.");	// 서버 동작이 끝난 후, 클라이언트에 출력
// jdbc.close();								// response.sendRedirect()는 서버 동작으로 먼저 처리되어
												// out.print()가 무시됨											
// response.sendRedirect("list.jsp");

/* jdbc.close();

if (rtnResult > 0) {
	out.print("<script>");
	out.print("alert('" + rtnResult + " 행이 입력되었습니다.');");
	out.print("window.location.replace('list.jsp');");
	out.print("</script>");
	out.close();
} else {
	out.print("<script>");
	out.print("alert('회원 등록이 완료되지 않았습니다.');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
} */

if (rtnResult > 0) {
	request.getRequestDispatcher("regist_success.jsp").forward(request, response);	// URL 변경하지 않고, 화면만 이동. 즉, 제어권은 넘어가지 않음
	// response.sendRedirect("regist_success.jsp");									// 클라이언트에게 페이지 이동 요청. URL 변경. Status Code = 302
}
%>