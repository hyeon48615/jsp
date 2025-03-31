package net.musthave.file;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * Servlet implementation class FileViewController
 */
@WebServlet("/view.do")
public class FileViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		
		MyFileDAO dao = new MyFileDAO();
		MyFileDTO dto = dao.getFile(idx);
		dao.close();
		
		String ext = null, filename = dto.getSfile();
		if(filename != null) {
			ext = filename.substring(filename.lastIndexOf(".")+1);
		}
		String[] mimes = { "png", "jpg", "gif" };
		List<String> mimeList = Arrays.asList(mimes);
		
		boolean isImage = false;
		if(mimeList.contains(ext)) {
			isImage = true;
		}
		
		request.setAttribute("dto", dto);
		request.setAttribute("isImage", isImage);
		request.getRequestDispatcher("/WEB-INF/FileView.jsp").forward(request, response);
	}

}
