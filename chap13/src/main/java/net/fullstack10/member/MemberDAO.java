package net.fullstack10.member;

import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

import net.fullstack10.common.CommonDateUtil;
import net.fullstack10.common.DBConnPool;

public class MemberDAO extends DBConnPool {
	private CommonDateUtil dateUtil;

	public MemberDAO() {
		super();
		dateUtil = new CommonDateUtil();
	}
	
	public MemberDAO(String ct, String ds) {
		super(ct, ds);
		dateUtil = new CommonDateUtil();
	}
	
	
	/**
	 * @desc 아이디로 회원 정보 조회
	 * 
	 * @param member_id String
	 * @return MemberDTO
	 * 
	 * @example getMemberInfo('user1')
	 */
	public MemberDTO getMemberInfo(String member_id) {
		// 조회한 회원 정보를 저장할 객체
		MemberDTO dto = new MemberDTO();

		//1. DB 객체 설정 --> 생성자 호출시에 반영

		//2. 쿼리 구문 작성
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT");
		sb.append(" memberId, name, pwd, regDate ");
		sb.append(" FROM tbl_member");
		sb.append(" WHERE memberId = ?");

		try {
			//3. PreparedStatement 구문 생성 및 변수 할당
			pstm = conn.prepareStatement(sb.toString());
			pstm.setString(1, member_id);

			//4. 쿼리 수행
			rs = pstm.executeQuery();
			if (rs.next()) {
				//5. 수행 결과 --> MemberDTO 변수에 저장
				dto.setMemberId(member_id);
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setRegDate(dateUtil.toLocalDateTime(rs.getDate("regDate")));
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("==================================");
			System.out.println("회원 정보 조회 실패");
			System.out.println("member_id : "+ member_id);
			System.out.println(e.getMessage());
			System.out.println("==================================");
		}
		
		return dto;
	}

	/**
	 * @desc 아이디, 비밀번호 로 회원 정보 조회
	 * 
	 * @param member_id String
	 * @param pwd String
	 * @return MemberDTO
	 * 
	 * @example getMemberInfo('user1')
	 */
	public MemberDTO getMemberInfo(String member_id, String pwd) {
		// 아이디/비밀번호 체크 플래그
		boolean check_id_flag = false;
		boolean check_pwd_flag = false;

		// 조회한 회원 정보를 저장할 객체
		MemberDTO dto = new MemberDTO();

		//1. DB 객체 설정 --> 생성자 호출시에 반영

		//2. 쿼리 구문 작성
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT");
		sb.append(" memberId, name, pwd, regDate ");
		sb.append(" FROM tbl_member");
		sb.append(" WHERE memberId = ?");
		System.out.println("회원 정보 조회 STEP0");

		try {
			//3. PreparedStatement 구문 생성 및 변수 할당
			pstm = conn.prepareStatement(sb.toString());
			pstm.setString(1, member_id);

			System.out.println("회원 정보 조회 STEP1");

			//4. 쿼리 수행
			rs = pstm.executeQuery();
			System.out.println("회원 정보 조회 STEP2");
			if (rs.next()) {
				System.out.println("회원 정보 조회 STEP3");
				check_id_flag = true;
				
				if (pwd.equals(rs.getString("pwd"))) {
					System.out.println("회원 정보 조회 STEP4");

					check_pwd_flag = true;
				}
				
				if ( check_id_flag && check_pwd_flag ) {
					System.out.println("회원 정보 조회 STEP5");

					//5. 수행 결과 --> MemberDTO 변수에 저장
					dto.setMemberId(member_id);
					dto.setPwd(pwd);
					dto.setName(rs.getString("name"));
					dto.setRegDate(dateUtil.toLocalDateTime(rs.getDate("regDate")));
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("==================================");
			System.out.println("회원 정보 조회 실패");
			System.out.println("member_id : "+ member_id +", pwd : "+ pwd);
			System.out.println(e.getMessage());
			System.out.println("==================================");
		}
		
		return dto;
	}
}
