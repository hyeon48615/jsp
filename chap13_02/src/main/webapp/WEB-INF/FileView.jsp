<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 상세 보기</h2>
	
	<form id="frmView" name="frmView" method="post">
		<input type="hidden" name="idx" value="${ dto.idx }" />
		
		<table border="1">
			<tr>
				<td>번호</td>
				<td>${ dto.idx }</td>
				<td>작성일</td>
				<td>${ dto.postdate }</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td colspan="3">${ dto.category }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3">${ dto.title }</td>
			</tr>
			<c:if test="${ not empty dto.ofile and isImage eq true }">
				<tr>
					<td>미리보기</td>
					<td colspan="3">
						<!-- ${pageContext.request.contextPath} or Web.xml 에 param 등록하여 사용 -->
						<img src="/chap13_02/Uploads/${ dto.sfile }" style="width: 120px;" />
					</td>
				</tr>
			</c:if>
			<tr>
				<td>첨부파일</td>
				<td colspan="3">
					${ dto.ofile }&nbsp;
					<a href="<c:url value='./download.do'>
			                 	<c:param name='oName' value='${ dto.ofile }'/>
			                    <c:param name='sName' value='${ dto.sfile }'/>
			                 </c:url>">[다운로드]
			        </a>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="button" id="btnModify" value="수정" />
					<input type="button" id="btnDelete" value="삭제" />
					<input type="button" id="btnList" value="목록" />
				</td>
			</tr>
		</table>
	</form>
	
	<script>
		document.getElementById("btnModify").addEventListener("click", () => {
			const frm = document.getElementById("frmView");
			frm.action = "./modify.do";
			frm.submit();
		});
		
		document.getElementById("btnDelete").addEventListener("click", () => {
			const frm = document.getElementById("frmView");
			frm.action = "./delete.do";
			frm.submit();
		});
		
		document.getElementById("btnList").addEventListener("click", () => {
			window.location.href = "./list.do";
		});
	</script>
</body>
</html>