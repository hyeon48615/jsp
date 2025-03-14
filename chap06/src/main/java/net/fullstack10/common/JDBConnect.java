package net.fullstack10.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletContext;

public class JDBConnect {
	public Connection conn;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	// 기본생성자
	public JDBConnect() {
		try {
			// 1. JDBC 드라이버 로딩
			Class.forName("org.mariadb.jdbc.Driver");
			
			// 2. DB에 연결
			// 2.1 주소 URL 설정 (드라이버:DBMS://주소:포트/DB)
			// 2.2 데이터베이스 접속 아이디
			// 2.3 비밀번호
			String url = "jdbc:mariadb://localhost:3306/fullstack10";
			String id = "root";
			String pwd = "1234";
			
			// 2.4 드라이버 매니저 사용
			conn = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("========================================");
			System.out.println("DB 접속 성공(기본생성자)");
			System.out.println("conn String : " + conn);
			System.out.println("========================================");
			
		} catch (Exception e) {
			e.printStackTrace();
			
			System.out.println("========================================");
			System.out.println("DB 접속 에러(기본 생성자)");
			System.out.println(e.getMessage());
			System.out.println("========================================");
		}
	}
	
	// 두번째 생성자
	public JDBConnect(String driver, String url, String id, String pwd) {
		try {
			// 1. JDBC 드라이버 로딩
			Class.forName(driver);
			
			// 2. DB에 연결
			// 2.1 주소 URL 설정 (드라이버:DBMS://주소:포트/DB)
			// 2.2 데이터베이스 접속 아이디
			// 2.3 비밀번호
			// 2.4 드라이버 매니저 사용
			conn = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("========================================");
			System.out.println("DB 접속 성공(두번째 생성자)");
			System.out.println("conn String : " + conn);
			System.out.println("========================================");
			
		} catch (Exception e) {
			e.printStackTrace();
			
			System.out.println("========================================");
			System.out.println("DB 접속 에러(두번째 생성자)");
			System.out.println(e.getMessage());
			System.out.println("========================================");
		}
	}

	// 세번째 생성자
	public JDBConnect(ServletContext application) {
		try {
			String driver = application.getInitParameter("MariaDriver");
			String url = application.getInitParameter("MariaURL");
			String id = application.getInitParameter("dbId");
			String pwd = application.getInitParameter("dbPwd");
			
			// 1. JDBC 드라이버 로딩
			Class.forName(driver);
			
			// 2. DB에 연결
			// 2.1 주소 URL 설정 (드라이버:DBMS://주소:포트/DB)
			// 2.2 데이터베이스 접속 아이디
			// 2.3 비밀번호
			// 2.4 드라이버 매니저 사용
			conn = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("========================================");
			System.out.println("DB 접속 성공(세번째 생성자)");
			System.out.println("conn String : " + conn);
			System.out.println("========================================");
			
		} catch (Exception e) {
			e.printStackTrace();
			
			System.out.println("========================================");
			System.out.println("DB 접속 에러(세번째 생성자)");
			System.out.println(e.getMessage());
			System.out.println("========================================");
		}
	}
	
	//  연결 해제(리소스 자원 반납)
	public void close() {
		try {
			// 작은 범위에서 큰 범위로 체크하며 연결 해제
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (psmt != null) psmt.close();
			if (conn != null) conn.close();
			
			System.out.println("========================================");
			System.out.println("JDBC 자원 해제");
			System.out.println("========================================");
		} catch (Exception e) {
			e.printStackTrace();
			
			System.out.println("========================================");
			System.out.println(e.getMessage());
			System.out.println("========================================");
		}
	}
}
