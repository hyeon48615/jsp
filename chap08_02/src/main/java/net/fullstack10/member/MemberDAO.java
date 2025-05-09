package net.fullstack10.member;

import java.time.LocalDateTime;

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
		MemberDTO dto = new MemberDTO();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT");
		sb.append(" memberId, name, pwd, regDate");
		sb.append(" FROM tbl_member");
		sb.append(" WHERE memberId = ?");
		sb.append(" AND pwd = ?");
		
		try {
			pstm = conn.prepareStatement(sb.toString());
			pstm.setString(1, member_id);
			pstm.setString(2, pwd);
			
			rs = pstm.executeQuery();
			
			if (rs.next()) {
				dto.setMemberId(member_id);
				dto.setPwd(pwd);
				dto.setName(rs.getString("name"));
				dto.setRegDate(dateUtil.toLocalDateTime(rs.getDate("regDate")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	/**
	 * @desc 세션 ID 로 회원정보 조회
	 * 
	 * @param session_id String
	 * @return MemberDTO
	 */
	public MemberDTO getMemberInfoBySessionId(String session_id) {
		MemberDTO dto = new MemberDTO();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT");
		sb.append(" memberId, name, pwd, regDate");
		sb.append(" FROM tbl_member");
		sb.append(" WHERE sessionId = ?");
		sb.append(" AND sessionLimitDate > now()");
		
		try {
			pstm = conn.prepareStatement(sb.toString());
			pstm.setString(1, session_id);
			
			rs = pstm.executeQuery();
			
			if (rs.next()) {
				dto.setMemberId(rs.getString("memberId"));
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
	 * @desc 자동 로그인 세션 ID 및 만료일 저장
	 * 
	 * @param member_id String
	 * @param session_id String
	 * @param session_limit_date LocalDateTime
	 */
	public void saveAutoLogin(String member_id, String session_id, LocalDateTime session_limit_date) {
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE tbl_member SET");
		sb.append(" sessionId = ?");
		sb.append(" , sessionLimitDate = ?");
		sb.append("WHERE memberId = ?");
		
		try {
			pstm = conn.prepareStatement(sb.toString());
			pstm.setString(1, session_id);
			pstm.setTimestamp(2, dateUtil.toTimestamp(session_limit_date));
			pstm.setString(3, member_id);
			
			pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
