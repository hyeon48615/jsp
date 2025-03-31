package net.musthave.file;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileListController
 */
@WebServlet("/list.do")
public class FileListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MyFileDAO dao = new MyFileDAO();
		List<MyFileDTO> fileList = dao.getFileList();
		dao.close();
		
		request.setAttribute("fileList", fileList);
		request.getRequestDispatcher("/WEB-INF/FileList.jsp").forward(request, response);
	}
}
