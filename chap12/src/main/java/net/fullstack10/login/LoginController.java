package net.fullstack10.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.fullstack10.common.CommonUtil;
import net.fullstack10.member.MemberDAO;
import net.fullstack10.member.MemberDTO;

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
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getRequestDispatcher("WEB-INF/views/login/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// doGet(request, response);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter wrt = response.getWriter();
		
		String member_id = request.getParameter("member_id");
		String pwd = request.getParameter("pwd");
		String save_id_flag = request.getParameter("save_id_flag");
		String auto_login_flag = request.getParameter("auto_login_flag");

		// 아이디/비밀번호 체크 validation
		if (member_id == null || member_id.length() < 4 || member_id.length() > 20) {
			wrt.print("<script>");
			wrt.print("alert('아이디 정보가 올바르지 않습니다.');");
			wrt.print("window.location.replace('./Login.do');");
			wrt.print("</script>");
			wrt.close();
		} else if (pwd == null || pwd.length() < 4 || pwd.length() > 20) {
			wrt.print("<script>");
			wrt.print("alert('비밀번호 정보가 올바르지 않습니다.');");
			wrt.print("window.location.replace('./Login.do');");
			wrt.print("</script>");
			wrt.close();
		}

		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMemberInfo(member_id, pwd);

		CommonUtil cUtil = new CommonUtil();

		// 1. 아이디/비밀번호 체크 로직 성공 여부
		// 2. save_id_flag : 아이디 저장 로직 --> 쿠키
		// 3. auto_login_flag : 자동 로그인 로직 --> 쿠키 + 세션
		HttpSession session = request.getSession();
		if (dto != null && dto.getMemberId() != null) {
			session.setAttribute("memberId", dto.getMemberId());
			session.setAttribute("name", dto.getName());
			
			if (save_id_flag != null && save_id_flag.equals("Y")) {
				cUtil.makeCookie(response, "", "/", 3600, "save_id_flag", save_id_flag);
				cUtil.makeCookie(response, "", "/", 3600, "saved_id", member_id);
			} else {
				cUtil.makeCookie(response, "", "/", 0, "save_id_flag", "");
				cUtil.makeCookie(response, "", "/", 0, "saved_id", "");
			}
			
			if (auto_login_flag != null && auto_login_flag.equals("Y")) {
				cUtil.makeCookie(response, "", "/", 3600, "auto_login_session", session.getId());
				LocalDateTime expiredDate = LocalDateTime.now().plusSeconds(3600);
				dao.saveAutoLogin(member_id, session.getId(), expiredDate);
				// cUtil.makeCookie(response, "", "/", 3600, "auto_login_flag", auto_login_flag);
			} else {
				cUtil.makeCookie(response, "", "/", 0, "auto_login_session", "");
				// cUtil.makeCookie(response, "", "/", 0, "auto_login_flag", "");
			}
		} else {
			wrt.print("<script>");
			wrt.print("alert('로그인 정보가 올바르지 않습니다.');");
			wrt.print("window.location.replace('./Login.do');");
			wrt.print("</script>");
			wrt.close();
		}
		dao.close();

		Object redirectURL = session.getAttribute("redirectUrl");
		if (redirectURL != null) {
			session.removeAttribute("redirectUrl");
			response.sendRedirect(redirectURL.toString());
		} else {
			response.sendRedirect("./Login.do");
		}
	}

}
