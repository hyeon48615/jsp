package net.musthave.file;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileController
 */
@WebServlet("/regist.do")
@MultipartConfig(
		maxFileSize = 1024 * 1024 * 1,
		maxRequestSize = 1024 * 1024 * 10
)
public class FileRegistController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/FileRegist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String oFileName = FileUtil.uploadFile(request, "/Uploads");
			String sFileName = FileUtil.renameFile(request, "/Uploads", oFileName);
			
			String title = request.getParameter("title");
			
			String[] arrCategory = request.getParameterValues("category");
			StringBuilder sb = new StringBuilder();
			sb.append("");
			if (arrCategory != null) {
				for (String s : arrCategory) {
					sb.append(s + ", ");
				}
			}
			
			MyFileDTO dto = new MyFileDTO();
			dto.setTitle(title);
			dto.setCategory(sb.toString());
			dto.setOfile(oFileName);
			dto.setSfile(sFileName);
			
			MyFileDAO dao = new MyFileDAO();
			dao.insertFile(dto);
			dao.close();
			
			response.sendRedirect("./");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "파일 업로드 오류");
			request.getRequestDispatcher("/WEB-INF/FileRegist.jsp").forward(request, response);
		}
	}

}
