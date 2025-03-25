package net.fullstack10.bbs;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.fullstack10.common.CommonDateUtil;
import net.fullstack10.common.CommonUtil;
import net.fullstack10.common.JSFunction;

/**
 * Servlet implementation class BbsViewConrtoller
 */
@WebServlet("/bbs/view.do")
public class BbsViewConrtoller extends HttpServlet {
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

		req.getRequestDispatcher("/WEB-INF/views/bbs/view.jsp").forward(req, res);
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, res);
	}
	
}
