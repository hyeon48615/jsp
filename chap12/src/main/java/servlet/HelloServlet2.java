package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet2
 */
// @WebServlet("/HelloServlet2")
@WebServlet(name = "/HelloServlet2", urlPatterns = {"/Test2.do", "/Test3.do", "/Test4.do"})
public class HelloServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getRequestDispatcher("/WEB-INF/views/test2.jsp").forward(request, response);
		// response.setContentType("text/html; charset=UTF-8");
		// PrintWriter wrt = response.getWriter();
		// wrt.println("<html>");
		// wrt.println("<head>");
		// wrt.println("</head>");
		// wrt.println("<body>");
		// wrt.println("<p>안녕하세요.</p>");
		// wrt.println("</body>");
		// wrt.println("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
