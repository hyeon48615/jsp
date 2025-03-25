package net.fullstack10.bbs;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.fullstack10.common.CommonDateUtil;
import net.fullstack10.common.CommonFileUtil;
import net.fullstack10.common.CommonUtil;
import net.fullstack10.common.JSFunction;

/**
 * Servlet implementation class BbsRegistController
 */
@WebServlet("/bbs/modify.do")
@MultipartConfig(
	maxFileSize = 1024*1024*1,
	maxRequestSize = 1024*1024*10
)
public class BbsModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CommonUtil cUtil = new CommonUtil();
	private CommonDateUtil dUtil = new CommonDateUtil();
	private BbsDAO dao = new BbsDAO();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//========================================================
		//리스트에서 사용하는 파라미터 처리
		String page_no = (req.getParameter("page_no") != null ? 
				req.getParameter("page_no").trim() : "1");
		String page_size = (req.getParameter("page_size") != null ? 
				req.getParameter("page_size").trim() : "10");
		String page_block_size = 
				(req.getParameter("page_block_size") != null ? 
						req.getParameter("page_block_size").trim() : "10");
		int page_skip_count = 10;

		String search_category = 
				(req.getParameter("search_category") != null ? 
						req.getParameter("search_category").trim() : "");
		String search_word = 
				(req.getParameter("search_word") != null ? 
						req.getParameter("search_word").trim() : "");

		page_no = (cUtil.isNumberic(page_no) ? page_no : "1");
		page_no = (cUtil.parseInt(page_no) > 0 ? page_no : "1");
		page_skip_count = 
				(cUtil.parseInt(page_no)-1)*cUtil.parseInt(page_size);
		
		String queryString = "page_size="+ page_size;
		queryString += "&page_block_size="+ page_block_size;
		queryString += "&search_category="+ search_category;
		queryString += "&search_word="+ search_word;

		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("page_no", page_no);
		pMap.put("page_size", page_size);
		pMap.put("page_block_size", page_block_size);
		pMap.put("page_skip_count", page_skip_count);
		pMap.put("search_category", search_category);
		pMap.put("search_word", search_word);

		//String rtnParam = URLEncoder.encode(request.getRequestURI(), "UTF-8");
		//리스트에서 사용하는 파라미터 처리
		//========================================================

		// 게시글 인덱스
		String idx = req.getParameter("idx");
		idx = (cUtil.parseInt(idx) > 0 ? idx : "0");
		
		if ( cUtil.parseInt(idx) < 1 ){
			JSFunction.alertLocation(res, "replace", "접근 경로가 올바르지 않습니다", "./list.do?"+queryString); 
		}
		
		pMap.put("idx", idx);

		BbsDTO dto = dao.getBbsView(cUtil.parseInt(idx));

		pMap.put("dto", dto);

		req.setAttribute("map", pMap);

		req.getRequestDispatcher("/WEB-INF/views/bbs/modify.jsp").forward(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter wrt = res.getWriter();


		// request 된 파라미터 처리
		int idx = cUtil.parseInt(req.getParameter("idx"), "0");
		String memberId = req.getParameter("member_id");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String prev_file_delete_flag = req.getParameter("prev_file_delete_flag");
		prev_file_delete_flag = (prev_file_delete_flag !=null ? prev_file_delete_flag : "");
		// validation 체크 루틴
		// 게시글 인덱스
		if ( idx < 1 ){
			JSFunction.alertBack(res, "접근 경로가 올바르지 않습니다"); 
		}
		if (memberId == null || memberId.length() < 4 || memberId.length() > 20){
			JSFunction.alertBack(res, "아이디를 4자리 이상 20자리 이하로 입력하세요."); 
		}
		if (title == null || title.length() < 2 || title.length() > 100){
			JSFunction.alertBack(res, "제목을 1자리 이상 100자리 이하로 입력하세요."); 
		}
		if (content == null || content.length() < 2 || content.length() > 1000){
			JSFunction.alertBack(res, "글 내용을 1자리 이상 1000자리 이하로 입력하세요."); 
		}

		//=======================================================
		// 파일 업로드 처리 루틴
		CommonFileUtil fileUtil = new CommonFileUtil();
		
		// 파일 업로드 디렉토리 설정
		String virtualDir = "/Uploads";
		String saveDir = getServletContext().getRealPath("/Uploads");
		saveDir = "D:\\java10\\JSP\\chap14\\src\\main\\webapp\\Uploads";
		
		// 파일 업로드
		String orgFile = fileUtil.fileUpload(req, saveDir);
		
		// 저장된 파일명 --> 새로운 이름으로 변경
		String newFile = "";
		// 저장된 파일 확장자
		String fileExt = "";
		// 파일 용량
		long fileSize = 0L;
		
		if ( orgFile != null && !orgFile.isEmpty() ) {
			newFile = fileUtil.fileRename(saveDir, orgFile);
			fileExt = fileUtil.getFileInfo("FILE_EXT", newFile);
			fileSize = fileUtil.getFileSize(saveDir, newFile);
		}
		// 파일 업로드 처리 루틴
		//=======================================================
		// 수정 전의 정보 할당
		BbsDTO prevDto = new BbsDTO();
		
		// 게시물 내용 BbsDTO 객체에 할당
		BbsDTO dto = new BbsDTO();
		dto.setIdx(idx);
		dto.setUser_id(memberId);
		dto.setTitle(title);
		dto.setContent(content);

		// 파일 정보 추가
		//dto.setFile_path(saveDir);
		if ( newFile != null && !newFile.isEmpty() ) {
			dto.setFile_path(virtualDir);
			dto.setFile_name(newFile);
			dto.setFile_ext(fileExt);
			dto.setFile_size(fileSize);
		}
		
		// dto 의 내용을 DB 에 등록
		BbsDAO dao = new BbsDAO();
		
		// 수정 전 정보 할당
		if ( ( newFile != null && !newFile.isEmpty() ) 
				|| ( prev_file_delete_flag.equals("Y") )
		) { 
			prevDto = dao.getBbsView(idx);
			System.out.println("prevDto : "+ prevDto.getFile_name());
		}		
		// 수정 처리
		int rtnResult = dao.setBbsModify(dto, prev_file_delete_flag);
		//수정 실패시 업로드된 파일 삭제 루틴
		if ( rtnResult < 0 ) {
			//파일 삭제 루틴 추가 --> fileUtil.fileDelete()
			if ( newFile != null && !newFile.isEmpty() ) { 
				fileUtil.fileDelete(req, saveDir, newFile);
			}
		}
		// 수정 성공시에 파일 삭제 플래그 존재시 파일 삭제 루틴
		else {
			if ( prevDto != null ) {
				System.out.println("prevDto delete : "+ prevDto.getFile_name());

				fileUtil.fileDelete(req, saveDir, prevDto.getFile_name());
			}
		}
		dao.close();

		if ( rtnResult > 0 ) {
			JSFunction.alertLocation(res, "게시물이 수정되었습니다.", "./list.do");
		} else {
			JSFunction.alertBack(res, "게시물 수정이 완료되지 않았습니다."); 
		}
		//res.sendRedirect("./list.do");
	}

}
