package net.fullstack10.bbs;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import net.fullstack10.common.CommonDateUtil;
import net.fullstack10.common.DBConnPool;

public class BbsDAO extends DBConnPool {
	private CommonDateUtil dateUtil;

	public BbsDAO() {
		super();
		dateUtil = new CommonDateUtil();
	}
	
	/**
	 * @desc 게시판 글 등록
	 * 
	 * @param member_id String
	 * @param title String
	 * @param content String
	 * @return int
	 * 
	 * @example setBbsRegist(BbsDTO)
	 */
	public int setBbsRegist(BbsDTO dto) {
		//1. DB 연결
		//2. 쿼리 구문 작성
		//3. PreparedStatement 작성
		//4. 쿼리 실행
		//5. 리소스 해지
		
		int result = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO tbl_bbs (");
		sb.append("user_id, title, content, reg_date");
		sb.append(", file_path, file_name, file_ext, file_size");
		sb.append(") VALUES (");
		sb.append("?, ?, ?, now()");
		sb.append(", ?, ?, ?, 0");
		sb.append(")");
		
		try {
			pstm = conn.prepareStatement(sb.toString());
			pstm.setString(1, dto.getUser_id());
			pstm.setString(2, dto.getTitle());
			pstm.setString(3, dto.getContent());
			pstm.setString(4, dto.getFile_path());
			pstm.setString(5, dto.getFile_name());
			pstm.setString(6, dto.getFile_ext());
			result = pstm.executeUpdate();
		} catch(Exception e) {
			System.out.println("게시물 등록 중 에러 발생 : "+ e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * @desc 게시판 글 전체 갯수
	 * 
	 * @param map Map<String, Object>
	 * @return int
	 * 
	 * @example getBbsTotalCount(map)
	 */
	public int getBbsTotalCount(Map<String, Object> map) {
		int total_count = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(*) FROM tbl_bbs ");
		
		if ( map.get("search_category") != null && map.get("search_word") != null ) {
			sb.append(" WHERE "+ map.get("search_category"));
			sb.append(" LIKE '%"+ map.get("search_word") +"%'");
		}
		
		try {
			pstm = conn.prepareStatement(sb.toString());
			rs = pstm.executeQuery();
			rs.next();
			total_count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시물 갯수 조회 에러 : "+ e.getMessage());
		}
		
		return total_count;
	}
	
	/**
	 * @desc 게시판 목록
	 * 
	 * @param map Map<String, Object>
	 * @return List<BbsDTO>
	 * 
	 * @example getBbsList(map)
	 */
	public List<BbsDTO> getBbsList(Map<String, Object> map){
		//1. DB객체
		//2. 쿼리작성
		//3. PreaparedStatement
		//4. 쿼리실행
		//5. 리소스해지
		
		List<BbsDTO> list = new Vector<BbsDTO>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT idx, bbs_ref_idx, bbs_level, sort_order");
		sb.append(" , title, content, user_id, reg_date, read_cnt");
		sb.append(" , file_path, file_name, file_ext, file_size");
		sb.append(" FROM tbl_bbs");

		if ( map.get("search_category") != null && map.get("search_word") != null ) {
			sb.append(" WHERE "+ map.get("search_category"));
			sb.append(" LIKE '%"+ map.get("search_word") +"%'");
		}

		sb.append(" ORDER BY idx DESC");
		
		if ( map.get("page_skip_count") != null && map.get("page_size") != null ) {
			sb.append(" LIMIT "+ map.get("page_skip_count") +", "+ map.get("page_size"));
		}
		
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
				dto.setReg_date(dateUtil.toLocalDateTime(rs.getDate("reg_date")));
				dto.setRead_cnt(rs.getInt("read_cnt"));
				dto.setFile_path(rs.getString("file_path"));
				dto.setFile_name(rs.getString("file_name"));
				dto.setFile_ext(rs.getString("file_ext"));
				dto.setFile_size(rs.getInt("file_size"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시물 리스트 조회 에러 : "+ e.getMessage());
		}
		
		return list;
	}
	
	/**
	 * @desc 게시판 조회
	 * 
	 * @param idx int
	 * @return BbsDTO
	 * 
	 * @example getBbsView(map)
	 */
	public BbsDTO getBbsView(int idx){
		//1. DB객체
		//2. 쿼리작성
		//3. PreaparedStatement
		//4. 쿼리실행
		//5. 리소스해지
		
		BbsDTO dto = new BbsDTO();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT idx, bbs_ref_idx, bbs_level, sort_order");
		sb.append(" , title, content, user_id, reg_date, read_cnt");
		sb.append(" , file_path, file_name, file_ext, file_size");
		sb.append(" FROM tbl_bbs");
		sb.append(" WHERE idx = ? ");
	
		try {
			pstm = conn.prepareStatement(sb.toString());
			pstm.setInt(1, idx);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				dto.setIdx(rs.getInt("idx"));
				dto.setBbs_ref_idx(rs.getInt("bbs_ref_idx"));
				dto.setBbs_level(rs.getInt("bbs_level"));
				dto.setSort_order(rs.getString("sort_order"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setReg_date(dateUtil.toLocalDateTime(rs.getDate("reg_date")));
				dto.setRead_cnt(rs.getInt("read_cnt"));
				dto.setFile_path(rs.getString("file_path"));
				dto.setFile_name(rs.getString("file_name"));
				dto.setFile_ext(rs.getString("file_ext"));
				dto.setFile_size(rs.getInt("file_size"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시물 조회 에러 : "+ e.getMessage());
		}
		
		return dto;
	}
	
	/**
	 * @desc 게시판 글 수정
	 * 
	 * @param dto BbsDTO
	 * @param idx int
	 * @param member_id String
	 * @param title String
	 * @param content String
	 * @return int
	 * 
	 * @example setBbsModify(BbsDTO)
	 */
	public int setBbsModify(BbsDTO dto) {
		//1. DB 연결
		//2. 쿼리 구문 작성
		//3. PreparedStatement 작성
		//4. 쿼리 실행
		//5. 리소스 해지

		
		int result = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE tbl_bbs SET ");
		sb.append(" title=?, content=? ");
		sb.append(" WHERE idx=? ");
		
		try {
			pstm = conn.prepareStatement(sb.toString());
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setInt(3, dto.getIdx());
			result = pstm.executeUpdate();
		} catch(Exception e) {
			System.out.println("게시물 수정 중 에러 발생 : "+ e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * @desc 게시판 글 삭제
	 * 
	 * @param idx int
	 * @return int
	 * 
	 * @example setBbsDelete(idx)
	 */
	public int setBbsDelete(int idx) {
		//1. DB 연결
		//2. 쿼리 구문 작성
		//3. PreparedStatement 작성
		//4. 쿼리 실행
		//5. 리소스 해지
		
		int result = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("DELETE FROM tbl_bbs WHERE idx=? ");
		
		try {
			pstm = conn.prepareStatement(sb.toString());
			pstm.setInt(1, idx);
			result = pstm.executeUpdate();
		} catch(Exception e) {
			System.out.println("게시물 삭제 중 에러 발생 : "+ e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * @desc 게시판 글 삭제
	 * 
	 * @param idxs String
	 * @return int
	 * 
	 * @example setBbsDelete(idxs)
	 */
	public int setBbsDelete(String idxs) {
		//1. DB 연결
		//2. 쿼리 구문 작성
		//3. PreparedStatement 작성
		//4. 쿼리 실행
		//5. 리소스 해지
		
		int result = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("DELETE FROM tbl_bbs WHERE idx IN ("+ idxs +") ");
		System.out.println("sql : "+ sb.toString());
		
		try {
			pstm = conn.prepareStatement(sb.toString());
			result = pstm.executeUpdate();
		} catch(Exception e) {
			System.out.println("게시물 삭제 중 에러 발생 : "+ e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	
}
