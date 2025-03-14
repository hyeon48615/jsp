<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="net.fullstack10.common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	table, thead, tbody, th, tr, td {
		border : 1px solid black;
		border-collapse : collapse;
	}
	th {
		text-align : center;
		min-width : 120px;
		height : 20px;
		background-color : #efefef;
	}
	.input_col {
		width : 400px;
		height : 40px;
	}
	.align_center {
		text-align : center;
	}
</style>

</head>
<body>
<h1>회원 정보 조회</h1>
<%
String member_id = request.getParameter("member_id");

if (member_id == null || member_id == "") {
	out.print("<script>");
	out.print("alert('회원 정보가 올바르지 않습니다.');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}

String name = "";
String pwd = "";
Timestamp regDate = null;

// 1. JDBC 객체 생성
JDBConnect jdbc = new JDBConnect();

// 2. 쿼리 구문 작성
String sql = "SELECT";
sql += " memberId, pwd, name, regDate";
sql += " FROM tbl_member";
sql += " WHERE memberId = ?";

// 3. PreparedStatement 구문 생성 및 변수 할당
PreparedStatement psmt = jdbc.conn.prepareStatement(sql);
psmt.setString(1, member_id);

// 4. 쿼리 실행
ResultSet rs = psmt.executeQuery();
if (rs.next()) {
	name = rs.getString("name");
	pwd = rs.getString("pwd");
	regDate = rs.getTimestamp("regDate");
}

// 5. 리소스 해지
jdbc.close();
%>
<form id="frm_member_info">
	<input type="hidden" name="memberId" id="memberId" value="<%=member_id %>" />
	<table>
		<tbody>
			<tr>
				<th>아이디 : </th>
				<td class="input_col"><%=member_id %></td>
			</tr>
			<tr>
				<th>비밀번호 : </th>
				<td class="input_col"><%=pwd %></td>
			</tr>
			<tr>
				<th>이름 : </th>
				<td class="input_col"><%=name %></td>
			</tr>
			<tr>
				<th>등록일 : </th>
				<td class="input_col"><%=regDate %></td>
			</tr>
			<tr>
				<td colspan="2" class="align_center">
					<input type="submit" id="btnModify" value="회원수정" />
					<input type="submit" id="btnDelete" value="회원삭제" />
					<input type="button" id="btnClose" value="닫기" />
				</td>
			</tr>
		</tbody>
	</table>
</form>

<script>
document.getElementById("btnModify").addEventListener("click", () => {
	event.preventDefault();
    event.stopPropagation();
    
    window.location.href = "modify.jsp?member_id=<%=member_id %>";
});

document.getElementById("btnDelete").addEventListener("click", () => {
	event.preventDefault();
    event.stopPropagation();
    
    let frm = document.getElementById("frm_member_info");
    frm.action = "delete_ok.jsp";
    frm.method = "post";
    frm.submit();
});

document.getElementById("btnClose").addEventListener("click", () => {
	history.back();
});
</script>
</body>
</html>