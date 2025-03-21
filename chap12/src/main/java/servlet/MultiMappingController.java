package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class MultiMappingController
 */
// @WebServlet("/MultiMappingController")
@WebServlet("*.bbs")
public class MultiMappingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		String uri = request.getRequestURI();
		String reqStr = uri.substring(uri.lastIndexOf("/"));
		setTitle(request, reqStr);
		
		request.setAttribute("uri", uri);
		request.setAttribute("reqStr", reqStr);
		
		request.getRequestDispatcher("WEB-INF/views/MultiMapping.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	void setTitle(HttpServletRequest req, String reqStr) {
		if (reqStr.equalsIgnoreCase("/free.bbs")) {
			req.setAttribute("rtnTitle", "<h2>자유게시판</h2>");
		}
		else if (reqStr.equalsIgnoreCase("/event.bbs")) {
			req.setAttribute("rtnTitle", "<h2>이벤트게시판</h2>");
		}
		else if (reqStr.equalsIgnoreCase("/image.bbs")) {
			req.setAttribute("rtnTitle", "<h2>이미지게시판</h2>");
		}
	}

}
