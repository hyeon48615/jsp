package net.fullstack10.bbs;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import net.fullstack10.common.CommonDateUtil;
import net.fullstack10.common.DBConnPool;

public class BbsDAO extends DBConnPool {
	
	public BbsDAO() {
		super();
	}
	
	/**
	 * @desc 게시판 글 등록
	 * 
	 * @param member_id String
	 * @param title String
	 * @param content String
	 * 
	 * @return int
	 */
	public int setBbsRegist(BbsDTO dto) {
		// 1. DB 연결
		// 2. 쿼리 구문 작성
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO tbl_bbs(user_id, title, content, reg_date)");
		sb.append("VALUES (?, ?, ?, now())");
		
		// 3. PreparedStatement 작성
		try {
			pstm = conn.prepareStatement(sb.toString());
			pstm.setString(1, dto.getUser_id());
			pstm.setString(2, dto.getTitle());
			pstm.setString(3, dto.getContent());
			
			return pstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 등록 중 에러 발생 : " + e.getMessage());
			e.printStackTrace();
		}
		// 4. 쿼리 실행
		// 5. 리소스 해지
		
		return 0;
	}
	
	/**
	 * @desc 게시판 글 전체 개수
	 * 
	 * @param param Map<String, Object>
	 * 
	 * @return int
	 */
	public int getBbsTotalCount(Map<String, Object> map) {
		int total_count = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(*) FROM tbl_bbs");
		
		if (map.get("search_category") != null && map.get("search_word") != null) {
			map = convertCategoryToColumn(map);
			sb.append(" WHERE " + map.get("search_category"));
			sb.append(" Like '%" + map.get("search_word") + "%'");
		}
		
		try {
			pstm = conn.prepareStatement(sb.toString());
			rs = pstm.executeQuery();
			rs.next();
			total_count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시물 개수 조회 에러 : " + e.getMessage());
		}
		
		return total_count;
	}
	 
	/**
	 * @desc 게시판 목록
	 * 
	 * @param map Map<String, Object>
	 * 
	 * @return List<BbsDto>
	 */
	public List<BbsDTO> getBbsList(Map<String, Object> map) {
		List<BbsDTO> list = new Vector<BbsDTO>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT idx, bbs_ref_idx, bbs_level, sort_order");
		sb.append(", title, content, user_id, reg_date, read_cnt");
		sb.append(", file_path, file_name, file_ext, file_size");
		sb.append(" FROM tbl_bbs");
		
		if (map.get("search_category") != null && map.get("search_word") != null) {
			map = convertCategoryToColumn(map);
			sb.append(" WHERE " + map.get("search_category"));
			sb.append(" Like '%" + map.get("search_word") + "%'");
		}
		
		sb.append(" ORDER BY idx DESC");
		
		if (map.get("page_skip_count") != null && map.get("page_size") != null) {
			sb.append(" LIMIT " + map.get("page_skip_count") + ", " + map.get("page_size"));
		}
		
		// System.out.println("SQL query: " + sb.toString());
		
		try {
			pstm = conn.prepareStatement(sb.toString());
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				BbsDTO dto = new BbsDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setBbs_ref_idx(rs.getInt("bbs_ref_idx"));
				dto.setBbs_level(rs.getInt("bbs_level"));
				dto.setSort_order(rs.getString("sort_order"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setReg_date(CommonDateUtil.toLocalDateTime(rs.getDate("reg_date")));
				dto.setRead_cnt(rs.getInt("read_cnt"));
				dto.setFile_path(rs.getString("file_path"));
				dto.setFile_name(rs.getString("file_name"));
				dto.setFile_ext(rs.getString("file_ext"));
				dto.setFile_size(rs.getInt("file_size"));
				
				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시물 리스트 조회 에러 : " + e.getMessage());
		}
		
		return list;
	}
	
	/**
	 * @desc idx로 게시글 조회
	 * 
	 * @param idx String
	 * 
	 * @return BbsDto
	 */
	public BbsDTO getBbsByIdx(String idx) {
		BbsDTO dto = new BbsDTO();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT idx, bbs_ref_idx, bbs_level, sort_order");
		sb.append(", title, content, user_id, reg_date, read_cnt");
		sb.append(", file_path, file_name, file_ext, file_size");
		sb.append(" FROM tbl_bbs");
		sb.append(" WHERE idx = ?");
		
		try {
			pstm = conn.prepareStatement(sb.toString());
			pstm.setString(1, idx);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				dto.setIdx(rs.getInt("idx"));
				dto.setBbs_ref_idx(rs.getInt("bbs_ref_idx"));
				dto.setBbs_level(rs.getInt("bbs_level"));
				dto.setSort_order(rs.getString("sort_order"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setReg_date(CommonDateUtil.toLocalDateTime(rs.getDate("reg_date")));
				dto.setRead_cnt(rs.getInt("read_cnt"));
				dto.setFile_path(rs.getString("file_path"));
				dto.setFile_name(rs.getString("file_name"));
				dto.setFile_ext(rs.getString("file_ext"));
				dto.setFile_size(rs.getInt("file_size"));
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("[idx:"+ idx + "] 게시물 조회 에러 : " + e.getMessage());
		}
		
		return dto;
	}
	
	/**
	 * @desc idx, user_id 로 게시글 조회
	 * 
	 * @param idx String
	 * @param user_id String
	 * 
	 * @return BbsDto
	 */
	public BbsDTO getBbsByIdx(String idx, String user_id) {
		BbsDTO dto = new BbsDTO();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT idx, bbs_ref_idx, bbs_level, sort_order");
		sb.append(", title, content, user_id, reg_date, read_cnt");
		sb.append(", file_path, file_name, file_ext, file_size");
		sb.append(" FROM tbl_bbs");
		sb.append(" WHERE idx = ?");
		sb.append(" AND user_id = ?");
		
		try {
			pstm = conn.prepareStatement(sb.toString());
			pstm.setString(1, idx);
			pstm.setString(2, user_id);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				dto.setIdx(rs.getInt("idx"));
				dto.setBbs_ref_idx(rs.getInt("bbs_ref_idx"));
				dto.setBbs_level(rs.getInt("bbs_level"));
				dto.setSort_order(rs.getString("sort_order"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setReg_date(CommonDateUtil.toLocalDateTime(rs.getDate("reg_date")));
				dto.setRead_cnt(rs.getInt("read_cnt"));
				dto.setFile_path(rs.getString("file_path"));
				dto.setFile_name(rs.getString("file_name"));
				dto.setFile_ext(rs.getString("file_ext"));
				dto.setFile_size(rs.getInt("file_size"));
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("[idx:" + idx + ", user_id:" + user_id + "] 게시물 조회 에러 : " + e.getMessage());
		}
		
		return dto;
	}
	
	/**
	 * @desc idx 로 게시글 삭제
	 * 
	 * @param idx String
	 * 
	 * @return int
	 */
	public int deleteBbsByIdx(String idx) {
		StringBuilder sb = new StringBuilder();
		sb.append("DELETE FROM tbl_bbs");
		sb.append(" WHERE idx = ?");
		
		try {
			pstm = conn.prepareStatement(sb.toString());
			pstm.setString(1, idx);
			return pstm.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("[idx:" + idx + "] 게시물 삭제 에러 : " + e.getMessage());
		}
		
		return 0;
	}
	
	/**
	 * @desc idx 로 게시글 수정
	 * 
	 * @param idx String
	 * @param map Map<String, Object>
	 * 
	 * @return int
	 */
	public int updateBbsByIdx(String idx, BbsDTO dto) {
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE tbl_bbs SET");
		sb.append(" title = ?");
		sb.append(", content = ?");
		sb.append(" WHERE idx = ?");
		
		try {
			pstm = conn.prepareStatement(sb.toString());
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setString(3, idx);
			
			return pstm.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("[idx:" + idx + "] 게시물 수정 에러 : " + e.getMessage());
		}
		
		return 0;
	}
	
	/**
	 * @desc 게시글 조회수 증가
	 * 
	 * @param idx String
	 * 
	 * @return int
	 */
	public int updateVisitCount(String idx) {
		BbsDTO dto = new BbsDTO();
		
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE tbl_bbs SET");
		sb.append(" read_cnt = read_cnt + 1");
		sb.append(" WHERE idx = ?");
		
		try {
			pstm = conn.prepareStatement(sb.toString());
			pstm.setString(1, idx);
			
			return pstm.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("["+ idx + "] 게시물 조회 에러 : " + e.getMessage());
		}
		
		return 0;
	}
	
	// search_category 값을 칼럼명으로 바꿔주는 함수
	private Map<String, Object> convertCategoryToColumn(Map<String, Object> map) {
		// map.replace("search_category", "title", "title");
		// map.replace("search_category", "content", "content");
		map.replace("search_category", "member_id", "user_id");
		
		return map;
	}
}
