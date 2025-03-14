<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="net.fullstack10.common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table, thead, tbody, th, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th {
	text-align: center;
	width: 150px;
	height: 40px;
	background-color: #efefef;
}
</style>
</head>
<body>
	<h1>회원 목록</h1>

<%
// 1. JDBC 객체 생성
JDBConnect jdbc = new JDBConnect();
	
// 2. 쿼리 구문 작성
String sql = "SELECT";
sql += " idx, memberId, name, pwd, regDate";
sql += " FROM tbl_member";
sql += " ORDER BY regDate DESC";
sql += " LIMIT 0, 10";
	
/*
StringBuilder sb = new StringBuilder();	// 문자열 길이가 늘어날 때, StringBuilder 사용
sb.append("SELECT ");					// 문자열 100글자가 넘어갈 때, 메모리 오버랩 발생 시작
sb.append(" idx, memberId, name, pwd, regDate");
sb.append(" FROM tbl_member");
sb.append(" ORDER BY regDate DESC");
sb.toString();
*/
	
// 3. PreparedStatement 구문 생성 및 변수 할당
PreparedStatement psmt = jdbc.conn.prepareStatement(sql);	    // 작성하는 프로세스에 따라 시간차 발생 가능
// jdbc.psmt = jdbc.conn.prepareStatement(sql);					// -> 정확한 구문

// 4. 쿼리 수행
ResultSet rs = psmt.executeQuery();
// jdbc.rs = jdbc.psmt.executeQuery();
%>
<form id="frm_member_list">
	<table>
		<thead>
			<tr>
				<th>선택</th>
				<th>아이디</th>
				<th>이름</th>
				<th>비밀번호</th>
				<th>등록일</th>
				<th>삭제</th>
			</tr>
		</thead>
<%
if (rs != null && rs.isBeforeFirst()) {
	while(rs.next()) {
%>
		<tbody>
			<tr>
				<td><input type="checkbox" name="delete_member_id" value="" /></td>
				<td><a href="view.jsp?member_id=<%=rs.getString("memberId") %>" class="memberId"><%=rs.getString("memberId") %></a></td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("pwd") %></td>
				<td><%=rs.getDate("regDate") %></td>
				<td><input type="button" class="btnDeleteRow" value="삭제" /></td>
			</tr>
<%
	}
} else {
%>
			<tr>
				<td colspan="6">등록된 회원 정보가 없습니다.</td>
			</tr>
<%
}
%>
			<tr>
				<td colspan="6">
					<< < 1 | 2 | <b>3</b> | 4 | 5 > >>
				</td>
			</tr>
			<tr>
				<td colspan="6"><input type="button" id="btnRegist" value="회원등록" /> 
					<input type="button" id="btnDelete" value="회원삭제" />
					<input type="button" id="btnDeleteSelect" value="선택삭제" />
				</td>
			</tr>
		</tbody>
	</table>
</form>
<%
// 5. 리소스 해지
jdbc.close();
%>

<script>
document.getElementById("btnRegist").addEventListener("click", () => {
	window.location.href = "regist.jsp";
});

document.querySelectorAll(".btnDeleteRow").forEach(btn => {
	btn.addEventListener("click", (event) => {
		// let memberId = event.target.closest("tr").querySelect(".memberId").text;
		
		// window.location.href = "delete_ok.jsp?memberId=" + memberId;
		// delete -> post 방식으로 할 것!
	});
});
</script>
</body>
</html>