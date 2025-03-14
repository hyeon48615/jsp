package net.fullstack10.member;

import net.fullstack10.common.CommonDateUtil;
import net.fullstack10.common.DBConnPool;

public class MemberDAO extends DBConnPool {
	private CommonDateUtil dateUtil;
	
	public MemberDAO() {
		super();
		dateUtil = new CommonDateUtil();
	}
	
	public MemberDAO(String context, String datasource) {
		super(context, datasource);
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
		MemberDTO dto = new MemberDTO();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT");
		sb.append(" memberId, name, pwd, regDate");
		sb.append(" FROM tbl_member");
		sb.append(" WHERE memberId = ?");
		
		try {
			pstm = conn.prepareStatement(sb.toString());
			pstm.setString(1, member_id);

			rs = pstm.executeQuery();
			
			if (rs.next()) {
				dto.setMemberId(member_id);
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setRegDate(dateUtil.toLocalDateTime(rs.getDate("regDate")));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	/**
	 * @desc 아이디, 비밀번호로 회원 정보 조회
	 * 
	 * @param member_id String
	 * @param pwd String
	 * @return MemberDTO
	 * 
	 * @example getMemberInfo('user1', '1234')
	 */
	
	public MemberDTO getMemberInfo(String member_id, String pwd) {
		// 아이디, 비밀번호 체크 플래그
		boolean check_id_flag = false;
		boolean check_pwd_flag = false;
		
		MemberDTO dto = new MemberDTO();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT");
		sb.append(" memberId, name, pwd, regDate");
		sb.append(" FROM tbl_member");
		sb.append(" WHERE memberId = ?");
		
		try {
			pstm = conn.prepareStatement(sb.toString());
			pstm.setString(1, member_id);
			pstm.setString(2, pwd);
			
			rs = pstm.executeQuery();
			
			if (rs.next()) {
				check_id_flag = true;
				
				if (pwd.equals(rs.getString("pwd"))) {
					check_pwd_flag = true;
				}
				
				if (check_id_flag && check_pwd_flag) {
					// 수행 결과 -> MemberDTO 변수에 저장
					dto.setMemberId(member_id);
					dto.setPwd(pwd);
					dto.setName(rs.getString("name"));
					dto.setRegDate(dateUtil.toLocalDateTime(rs.getDate("regDate")));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
}
