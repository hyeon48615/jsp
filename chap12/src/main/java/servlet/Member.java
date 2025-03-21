package servlet;

import java.io.IOException;

import jakarta.servlet.Servlet;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.fullstack10.member.MemberDAO;
import net.fullstack10.member.MemberDTO;

/**
 * Servlet implementation class Member
 */
@WebServlet(name = "Member", urlPatterns = { "/Member.do"})
public class Member extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberDAO dao;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		
		// application 내장객체
		ServletContext application = this.getServletContext();
		
		// web.xml 에서 연결 정보 조회
		String driver = application.getInitParameter("MariaDriver");
		String dbUrl = application.getInitParameter("MariaURL");
		String dbId = application.getInitParameter("dbId");
		String dbPwd = application.getInitParameter("dbPwd");
		
		String ctx = "java:comp/env";
		String ds = "jdbc_maria";
		
		dao = new MemberDAO(ctx, ds);
		// dao = new MemberDAO();
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String member_id = request.getParameter("member_id");
		String pwd = request.getParameter("pwd");
		
		if (member_id != null && pwd != null) {
			MemberDTO dto = dao.getMemberInfo(member_id, pwd);
			if (dto != null && dto.getName() != null) {
				request.setAttribute("msg", dto.getName() + "님, 안녕하세요.");
			} else {
				request.setAttribute("msg", "회원 정보가 존재하지 않습니다.");
			}
		}
		
		request.getRequestDispatcher("/WEB-INF/views/member.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		dao.close();
		// destroy 에서 dao.close() 한다는 것은 자원을 게속 차지한다는 것 -> 잘못된 코딩
		// 라이프사이클을 위한 예제로, 원래는 dao 사용 후 바로 닫아 주어야 함
	}

}
