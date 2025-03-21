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
	
	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public Statement getStmt() {
		return stmt;
	}

	public void setStmt(Statement stmt) {
		this.stmt = stmt;
	}

	public PreparedStatement getPsmt() {
		return psmt;
	}

	public void setPsmt(PreparedStatement psmt) {
		this.psmt = psmt;
	}

	public ResultSet getRs() {
		return rs;
	}

	public void setRs(ResultSet rs) {
		this.rs = rs;
	}

	//기본생성자
	public JDBConnect() {
		try {
			//1. JDBC 드라이버 로딩
			Class.forName("org.mariadb.jdbc.Driver");

			//2. DB 에 연결
			//2.1 주소URL 설정 (어떤드라이버:DBMS어떤놈://주소:포트/DB가뭐야?)
			//2.2 데이터베이스 접속 아이디
			//2.3 비밀번호
			String url = "jdbc:mariadb://localhost:3306/fullstack10";
			String id = "root";
			String pwd = "1234";
			
			//2.4 드라이버 매니저 사용
			conn = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("================================");
			System.out.println("DB 접속 성공(기본생성자)");
			System.out.println("conn String : "+ conn);
			System.out.println("================================");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("================================");
			System.out.println("DB 접속 에러(기본생성자)");
			System.out.println(e.getMessage());
			System.out.println("================================");
		}
	}

	//두 번째 생성자
	public JDBConnect(String driver, String url, String id, String pwd) {
		try {
			//1. JDBC 드라이버 로딩
			Class.forName(driver);

			//2. DB 에 연결
			//2.1 주소URL 설정 (어떤드라이버:DBMS어떤놈://주소:포트/DB가뭐야?)
			//2.2 데이터베이스 접속 아이디
			//2.3 비밀번호
			//2.4 드라이버 매니저 사용
			conn = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("================================");
			System.out.println("DB 접속 성공(두 번째 생성자)");
			System.out.println("conn String : "+ conn);
			System.out.println("================================");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("================================");
			System.out.println("DB 접속 에러(두 번째 생성자)");
			System.out.println(e.getMessage());
			System.out.println("================================");
		}
	}

	//세 번째 생성자
	public JDBConnect(ServletContext application) {
		try {
			String driver = application.getInitParameter("MariaDriver");
			String url = application.getInitParameter("MariaURL");
			String id = application.getInitParameter("dbId");
			String pwd = application.getInitParameter("dbPwd");


			//1. JDBC 드라이버 로딩
			Class.forName(driver);

			//2. DB 에 연결
			//2.1 주소URL 설정 (어떤드라이버:DBMS어떤놈://주소:포트/DB가뭐야?)
			//2.2 데이터베이스 접속 아이디
			//2.3 비밀번호
			//2.4 드라이버 매니저 사용
			conn = DriverManager.getConnection(url, id, pwd);
				
			System.out.println("================================");
			System.out.println("DB 접속 성공(세 번째 생성자)");
			System.out.println("conn String : "+ conn);
			System.out.println("================================");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("================================");
			System.out.println("DB 접속 에러(세 번째 생성자)");
			System.out.println(e.getMessage());
			System.out.println("================================");
		}
	}

	// 연결 해제(리소스 자원 반납)
	public void close() {
		try {
			if ( rs != null ) rs.close();
			if ( stmt != null ) stmt.close();
			if ( psmt != null ) psmt.close();
			if ( conn != null ) conn.close();
			
			System.out.println("================================");
			System.out.println("JDBC 자원 해제");
			System.out.println("================================");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("================================");
			System.out.println(e.getMessage());
			System.out.println("================================");
		}
	}
}
