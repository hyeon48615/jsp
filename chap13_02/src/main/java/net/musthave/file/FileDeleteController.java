package net.musthave.file;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class FileDeleteController
 */
@WebServlet("/delete.do")
public class FileDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		
		MyFileDAO dao = new MyFileDAO();
		MyFileDTO dto = dao.getFile(idx);
		int result = dao.deleteFile(idx);
		dao.close();
		
		if (result > 0) {
			String filename = dto.getSfile();
			FileUtil.deleteFile(request, "/Uploads", filename);
		}
		
		response.sendRedirect("./list.do");
	}

}
