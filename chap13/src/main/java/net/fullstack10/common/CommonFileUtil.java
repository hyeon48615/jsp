package net.fullstack10.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class CommonFileUtil {

	// 파일명/확장자 리턴
	public String getFileInfo(String sType, String fileName) {
		String rtnResult = "";
		switch (sType) {
		case "FILE_NAME":
			rtnResult = fileName.substring(0, fileName.lastIndexOf("."));
			break;
		case "FILE_EXT":
			rtnResult = fileName.substring(fileName.lastIndexOf(".") + 1);
			break;
		case "FILE_SIZE":
			break;
		default:
		}

		return rtnResult;
	}

	// 파일명 변경
	public String fileRename(String sDir, String fileName) {
		// 원본 파일 -> 확장자 추출
		String fileExt = fileName.substring(fileName.lastIndexOf("."));

		// 날짜+시간 을 이용한 임시 파일명 생성
		String now = new SimpleDateFormat("yyyyMMdd_HHmmssS").format(new Date());

		// 임시파일명+확장자 -> 새로운 파일명 생성
		String newFileName = now + fileExt;

		// 기존 파일명 --> 새로운 파일명으로 변경
		File oldFile = new File(sDir + File.separator + fileName);
		File newFile = new File(sDir + File.separator + newFileName);
		oldFile.renameTo(newFile);

		// 새로운 파일명으로 반환
		return newFileName;
	}

	// 파일 사이즈
	public Long getFileSize(String sDir, String fileName) {
		File file = new File(sDir + File.separator + fileName);
		return (file != null ? file.getTotalSpace() : 0);
	}

	// 파일 업로드
	public String fileUpload(HttpServletRequest req, String sDir) throws ServletException, IOException {
		// Part 객체를 이용하여 서버로 전송된 파일 정보 처리
		Part part = req.getPart("file1");

		// Part 객체의 헤더값 참조 -> content-disposition 조회
		String pHeader = part.getHeader("content-disposition");
		// --> form-data; name="attatchFile"; filename="파일명.xxx"
		System.out.println("partHeader : " + pHeader);

		// 헤더에서 추출한 파일명 처리
		String[] pArrHeader = pHeader.split("filename=");
		String orgFileName = pArrHeader[1].trim().replace("\"", "");

		if (!orgFileName.isEmpty()) {
			part.write(sDir + File.separator + orgFileName);
		}
		return orgFileName;
	}

	// 파일 삭제
	public void fileDelete(HttpServletRequest req, String sDir, String fileName) {
		// String Dir = req.getServletContext().getRealPath(sDir);
		String Dir = sDir;
		File file = new File(Dir + File.separator + fileName);
		if (file.exists()) {
			file.delete();
		}
	}

	// multiple 파일 업로드
	public List<String> multiFileUpload(HttpServletRequest req, String sDir) throws ServletException, IOException {
		// 파일 젖아용 컬렉션
		List<String> arrFileName = new ArrayList<>();
		
		// Part 객체를 컬렉션에 담아서 사용
		Collection<Part> parts = req.getParts();
		
		for(Part part : parts) {
			if (part.getName().equals("files"))
				continue;
			
			// Part 객체의 헤더값 참조 -> content-disposition 조회
			String pHeader = part.getHeader("content-disposition");
			// --> form-data; name="attatchFile"; filename="파일명.xxx"
			System.out.println("partHeader : " + pHeader);

			// 헤더에서 추출한 파일명 처리
			String[] pArrHeader = pHeader.split("filename=");
			String orgFileName = pArrHeader[1].trim().replace("\"", "");

			if (!orgFileName.isEmpty()) {
				part.write(sDir + File.separator + orgFileName);
			}
			
			arrFileName.add(orgFileName);
		}
		
		return arrFileName;
	}
}
