package net.fullstack10.bbs;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.fullstack10.common.CommonFileUtil;

/**
 * Servlet implementation class BbsRegistController
 *   
  <servlet>
  	<servlet-name>/bbs/BBSRegist.do</servlet-name>
  	<servlet-class>net.fullstack10.bbs.event</servlet-class>
  	<multipart-config>
  		<location>/Uploads</location>
  		<max-file-size>1024000</max-file-size> <!-- 파일 1개당, -1L : 무제한 -->
  		<max-request-size>10240000</max-request-size> <!-- request 당, 파일이 10개면 10개를 합한값 -->
  		<file-size-threshold>0</file-size-threshold> <!-- 임시디렉토리에 저장할 기준값, 기본값(0: 무조건 임시디렉토리에 저장) -->
  	</multipart-config>
  	
  </servlet>
  <servlet-mapping>
  	<servlet-name>/bbs/BBSRegist.do</servlet-name>
  	<url-pattern>/bbs/Regist.do</url-pattern>
  </servlet-mapping>
 */
@WebServlet("/bbs/regist.do")
@MultipartConfig(
	maxFileSize = 1024*1024*1,
	maxRequestSize = 1024*1024*10
)
public class BbsRegistController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/views/bbs/regist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter wrt = response.getWriter();

		//=======================================================
		// 파일 업로드 처리 루틴
		CommonFileUtil fileUtil = new CommonFileUtil();
		
		// 파일 업로드 디렉토리 설정
		String virtualDir = "/Uploads";
		String saveDir = getServletContext().getRealPath("/Uploads");
		saveDir = "D:\\JAVA10\\JSP\\chap13\\src\\main\\webapp\\Uploads";
		
		// 파일 업로드
		String orgFile = fileUtil.fileUpload(request, saveDir);
		
		// 저장된 파일명 --> 새로운 이름으로 변경
		String newFile = "";
		// 저장된 파일 확장자
		String fileExt = "";
		if ( orgFile != null && !orgFile.isEmpty() ) {
			newFile = fileUtil.fileRename(saveDir, orgFile);
			fileExt = fileUtil.getFileInfo("FILE_EXT", newFile);
		}
		// 파일 업로드 처리 루틴
		//=======================================================


		// request 된 파라미터 처리
		String memberId = request.getParameter("member_id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		// validation 체크 루틴
		if (memberId == null || memberId.length() < 4 || memberId.length() > 20){
			//파일 삭제 루틴 추가 --> fileUtil.fileDelete()
			if ( newFile != null && !newFile.isEmpty() ) { 
				fileUtil.fileDelete(request, saveDir, newFile);
			}
			wrt.print("<script>");
			wrt.print("alert('아이디를 4자리 이상 20자리 이하로 입력하세요.');");
			wrt.print("history.back();");
			wrt.print("</script>");
			wrt.close();
		}
		if (title == null || title.length() < 2 || title.length() > 100){
			//파일 삭제 루틴 추가 --> fileUtil.fileDelete()
			if ( newFile != null && !newFile.isEmpty() ) { 
				fileUtil.fileDelete(request, saveDir, newFile);
			}
			wrt.print("<script>");
			wrt.print("alert('제목을 1자리 이상 100자리 이하로 입력하세요.');");
			wrt.print("history.back();");
			wrt.print("</script>");
			wrt.close();
		}
		if (content == null || content.length() < 2 || content.length() > 1000){
			//파일 삭제 루틴 추가 --> fileUtil.fileDelete()
			if ( newFile != null && !newFile.isEmpty() ) { 
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
		// dto.setFile_path(saveDir);
		dto.setFile_path(virtualDir);
		dto.setFile_name(newFile);
		dto.setFile_ext(fileExt);
		
		// dto 의 내용을 DB 에 등록
		BbsDAO dao = new BbsDAO();
		int rtnResult = dao.setBbsRegist(dto);
		if ( rtnResult < 0 ) {
			//파일 삭제 루틴 추가 --> fileUtil.fileDelete()
			if ( newFile != null && !newFile.isEmpty() ) { 
				fileUtil.fileDelete(request, saveDir, newFile);
			}
		}
		dao.close();

		if ( rtnResult > 0 ) {
			wrt.print("<script>");
			wrt.print("alert('게시물이 등록되었습니다.');");
			wrt.print("window.location.replace('./list.do');");
			wrt.print("</script>");
			wrt.close();
		} else {
			wrt.print("<script>");
			wrt.print("alert('게시물 등록이 완료되지 않았습니다.');");
			wrt.print("history.back();");
			wrt.print("</script>");
			wrt.close();
		}
	}

}
