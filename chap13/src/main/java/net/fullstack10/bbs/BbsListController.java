package net.fullstack10.bbs;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.fullstack10.common.BbsPage;
import net.fullstack10.common.CommonDateUtil;
import net.fullstack10.common.CommonUtil;

/**
 * Servlet implementation class BbsListController
 */
@WebServlet("/list.do")
public class BbsListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CommonUtil cUtil = new CommonUtil();
	private CommonDateUtil dUtil = new CommonDateUtil();
	private BbsDAO dao = new BbsDAO();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String page_no = (req.getParameter("page_no") != null ? req.getParameter("page_no").trim() : "1");
		String page_size = (req.getParameter("page_size") != null ? req.getParameter("page_size").trim() : "10");
		String page_block_size = (req.getParameter("page_block_size") != null ? req.getParameter("page_block_size").trim() : "10");
		int page_skip_count = 10;
		int total_count = 0;

		String search_category = (req.getParameter("search_category") != null ? req.getParameter("search_category").trim() : "");
		String search_word = (req.getParameter("search_word") != null ? req.getParameter("search_word").trim() : "");
		
		page_no = (cUtil.isNumberic(page_no) && cUtil.parseInt(page_no) > 0 ? page_no : "1");
		page_skip_count = (cUtil.parseInt(page_no)-1) * cUtil.parseInt(page_size);
		
		String queryString = "page_size=" + page_size;
		queryString += "&page_block_size=" + page_block_size;
		queryString += "&search_category=" + search_category;
		queryString += "&search_word=" + search_word; 
		
		Map<String, Object> pMap = new HashMap<>();
		pMap.put("page_no", page_no);
		pMap.put("page_size", page_size);
		pMap.put("page_block_size", page_block_size);
		pMap.put("page_skip_count", page_skip_count);
		
		if (search_category != null && !search_category.isEmpty()
				&& search_word != null && !search_word.isEmpty()) {
			pMap.put("search_category", search_category);
			pMap.put("search_word", search_word);
		}
		
		total_count = dao.getBbsTotalCount(pMap);
		List<BbsDTO> bbsList = dao.getBbsList(pMap);
		
		pMap.put("total_count", total_count);
		pMap.put("bbsList", bbsList);
		
		pMap.put("paging", BbsPage.pagingArea(
				total_count,
				cUtil.parseInt(page_no),
				cUtil.parseInt(page_size),
				cUtil.parseInt(page_block_size),
				"./list.do?" + queryString));
		
		req.setAttribute("map", pMap);
		
		// dao.close();
		
		req.getRequestDispatcher("WEB-INF/views/bbs/list.jsp").forward(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
