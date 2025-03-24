package net.fullstack10.login;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.fullstack10.common.CommonUtil;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/Login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/login/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter wrt = response.getWriter();
		
		String memberId = request.getParameter("memberId");
		String pwd = request.getParameter("pwd");
		
		String save_id_flag = request.getParameter("save_id_flag");
		String auto_login_flag = request.getParameter("auto_login_flag");
		
		// validation
		if (memberId == null || memberId.length() < 4 || memberId.length() > 20) {
			wrt.print("<script>");
			wrt.print("alert('아이디는 4자리 이상 20자리 이하로 입력하세요.');");
			wrt.print("history.back();");
			wrt.print("</script>");
			wrt.close();
		}
		
		if (pwd == null || pwd.length() < 4 || pwd.length() > 20) {
			wrt.print("<script>");
			wrt.print("alert('비밀번호는 4자리 이상 20자리 이하로 입력하세요.');");
			wrt.print("history.back();");
			wrt.print("</script>");
			wrt.close();
		}
		
		CommonUtil cUtil = new CommonUtil();
		
	}

}
