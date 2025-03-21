package net.fullstack10.bbs;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.fullstack10.common.CommonFileUtil;

/**
 * Servlet implementation class BbsRegistController
 */
@WebServlet("/BbsRegist.do")
public class BbsRegistController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter wrt = response.getWriter();
		
		CommonFileUtil fileUtil = new CommonFileUtil();
		
		// 파일 업로드 디렉토리 설정
		String saveDir = getServletContext().getRealPath("/Uploads");
		
		// 파일 업로드
		String orgFile = fileUtil.fileUpload(request, saveDir);
		
		// 저장된 파일명 -> 새로운 이름으로 변경
		String newFile = "";
		String fileExt = "";
		if (orgFile != null && !orgFile.isEmpty()) {
			newFile = fileUtil.fileRename(saveDir, orgFile);
			fileExt = fileUtil.getFileInfo("FILE_EXT", newFile);
		}
		
		// request 파라미터
		String memberId = request.getParameter("member_id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		// validation 체크 루틴
		if (memberId == null || memberId.length() < 4 || memberId.length() > 20) {
			if (newFile != null && !newFile.isEmpty()) {
				fileUtil.fileDelete(request, saveDir, newFile);
			}
			
			wrt.print("<script>");
			wrt.print("alert('아이디를 4자리 이상 20자리 이하로 입력하세요.');");
			wrt.print("history.back();");
			wrt.print("</script>");
			wrt.close();
		}
		if (title == null || title.length() < 2 || title.length() > 100) {
			if (newFile != null && !newFile.isEmpty()) {
				fileUtil.fileDelete(request, saveDir, newFile);
			}
			
			wrt.print("<script>");
			wrt.print("alert('제목을 1자리 이상 100자리 이하로 입력하세요.');");
			wrt.print("history.back();");
			wrt.print("</script>");
			wrt.close();
		}
		if (content == null || content.length() < 2 || content.length() > 1000) {
			if (newFile != null && !newFile.isEmpty()) {
				fileUtil.fileDelete(request, saveDir, newFile);
			}
			
			wrt.print("<script>");
			wrt.print("alert('글 내용을 1자리 이상 1000자리 이하로 입력하세요.');");
			wrt.print("history.back();");
			wrt.print("</script>");
			wrt.close();
		}

		// 게시물 내용 BbsDTO 객체에 할당
		BbsDTO dto = new BbsDTO();
		dto.setUser_id(memberId);
		dto.setTitle(title);
		dto.setContent(content);
		
		// 파일 정보 추가
		dto.setFile_path(saveDir);
		dto.setFile_name(newFile);
		dto.setFile_ext(fileExt);

		// dto 의 내용을 DB 에 등록
		BbsDAO dao = new BbsDAO();
		int rtnResult = dao.setBbsRegist(dto);
		dao.close();

		if ( rtnResult > 0 ) {
			wrt.print("<script>");
			wrt.print("alert('게시물이 등록되었습니다.');");
			wrt.print("window.location.replace('list.jsp');");
			wrt.print("</script>");
			wrt.close();
		} else {
			if (newFile != null && !newFile.isEmpty()) {
				fileUtil.fileDelete(request, saveDir, newFile);
			}
			
			wrt.print("<script>");
			wrt.print("alert('게시물 등록이 완료되지 않았습니다.');");
			wrt.print("history.back();");
			wrt.print("</script>");
			wrt.close();
		}
	}

}
