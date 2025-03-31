package net.musthave.file;

import java.util.List;
import java.util.Vector;

import net.fullstack10.common.DBConnPool;

public class MyFileDAO extends DBConnPool {
	public int insertFile(MyFileDTO dto) {
		int rtnResult = 0;
		
		try {
			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO tbl_file_temp ( ");
			sb.append("title, category, ofile, sfile ");
			sb.append(") VALUES ( ");
			sb.append("?, ?, ?, ? ");
			sb.append(") ");
			
			pstm = conn.prepareStatement(sb.toString());
			pstm.setString(1,  dto.getTitle());
			pstm.setString(2,  dto.getCategory());
			pstm.setString(3,  dto.getOfile());
			pstm.setString(4,  dto.getSfile());
			
			rtnResult = pstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("파일 업로드 예외 발생: " + e.getMessage());
		}
		
		return rtnResult;
	}
	
	public int deleteFile(String idx) {
		int rtnResult = 0;
		
		try {
			StringBuilder sb = new StringBuilder();
			sb.append("DELETE FROM tbl_file_temp ");
			sb.append("WHERE idx = ? ");
			
			pstm = conn.prepareStatement(sb.toString());
			pstm.setString(1, idx);
			
			rtnResult = pstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("파일 삭제 중 예외 발생: " + e.getMessage());
			e.printStackTrace();
		}
		
		return rtnResult;
	}
	
	public List<MyFileDTO> getFileList() {
		List<MyFileDTO> fileList = new Vector<MyFileDTO>();
		
		try {
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT * FROM tbl_file_temp ORDER BY idx DESC");
			pstm = conn.prepareStatement(sb.toString());
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				MyFileDTO dto = new MyFileDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setCategory(rs.getString("category"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setPostdate(rs.getTimestamp("postdate").toLocalDateTime());
				
				fileList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("파일 리스트 조회 예외 발생: " + e.getMessage());
		}
		
		return fileList;
	}

	public MyFileDTO getFile(String idx) {
		MyFileDTO dto = new MyFileDTO();
		
		try {
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT * FROM tbl_file_temp ");
			sb.append("WHERE idx = ?");
			
			pstm = conn.prepareStatement(sb.toString());
			pstm.setString(1, idx);
			rs = pstm.executeQuery();
			
			if (rs.next()) {
				dto.setIdx(rs.getInt("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setCategory(rs.getString("category"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setPostdate(rs.getTimestamp("postdate").toLocalDateTime());
			}
		} catch (Exception e) {
			System.out.println("게시물 상세 조회 중 예외 발생: " + e.getMessage());
			e.printStackTrace();
		}
		
		return dto;
	}
}
