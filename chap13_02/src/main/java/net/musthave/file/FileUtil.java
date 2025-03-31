package net.musthave.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class FileUtil {
	public static String renameFile(HttpServletRequest req, String directory, String filename) {
		String sDirectory = req.getServletContext().getRealPath(directory);
		sDirectory = "D:\\JAVA10\\JSP\\chap13_02\\src\\main\\webapp\\Uploads";
		
		String ext = filename.substring(filename.lastIndexOf("."));
		String now = new SimpleDateFormat("yyyyMMdd_HHmmssS").format(new Date());
		String newFileName = now + ext;
		
		File oldFile = new File(sDirectory + File.separator + filename);
		File newFile = new File(sDirectory + File.separator + newFileName);
		oldFile.renameTo(newFile);
		
		return newFileName;
	}
	
	public static String uploadFile(HttpServletRequest req, String directory) throws ServletException, IOException {
		String sDirectory = req.getServletContext().getRealPath(directory);
		sDirectory = "D:\\JAVA10\\JSP\\chap13_02\\src\\main\\webapp\\Uploads";
		
		Part part = req.getPart("ofile");
		String pHeader = part.getHeader("content-disposition");
		
		String[] pArrHeader = pHeader.split("filename=");
		String orgFileName = pArrHeader[1].trim().replace("\"", "");
		
		if (!orgFileName.isEmpty()) {
			part.write(sDirectory + File.separator + orgFileName);
		}
		
		return orgFileName;
	}
	
	public static ArrayList<String> uploadMultipleFile(HttpServletRequest req, String directory) throws ServletException, IOException {
		String sDirectory = req.getServletContext().getRealPath(directory);
		sDirectory = "D:\\JAVA10\\JSP\\chap13_02\\src\\main\\webapp\\Uploads";
		
		ArrayList<String> arrFileName = new ArrayList<>();
		
		Collection<Part> parts = req.getParts();
		for (Part part : parts) {
			if (!part.getName().equals("ofile"))
				continue;
			
			String pHeader = part.getHeader("content-disposition");
			
			String[] pArrHeader = pHeader.split("filename=");
			String orgFileName = pArrHeader[1].trim().replace("\"", "");
			
			if (!orgFileName.isEmpty()) {
				part.write(sDirectory + File.separator + orgFileName);
			}
			
			arrFileName.add(orgFileName);
		}
		
		return arrFileName;
	}
	
	public static void download(HttpServletRequest req, HttpServletResponse res, 
			String directory, String sfile, String ofile) {
		String sDirectory = req.getServletContext().getRealPath(directory);
		sDirectory = "D:\\JAVA10\\JSP\\chap13_02\\src\\main\\webapp\\Uploads";
		
		try {
			File file = new File(sDirectory, sfile);
			InputStream inStream = new FileInputStream(file);
			
			String client = req.getHeader("User-Agent");
			if (client.indexOf("WOW64") == -1) { // 인터넷 익스플로러에 대한 처리
				ofile = new String(ofile.getBytes("UTF-8"), "ISO-8859-1");
			} else {
				ofile = new String(ofile.getBytes("KSC5601"), "ISO-8859-1");
			}
			
			res.reset();
			res.setContentType("application/octet-stream");
			res.setHeader("Content-Disposition", "attachment; filename=\"" + ofile + "\"");
			res.setHeader("Content-Length", "" + file.length());
			
			OutputStream outStream = res.getOutputStream();
			
			byte b[] = new byte[(int) file.length()];
			int readBuffer = 0;
			while ((readBuffer = inStream.read(b)) > 0) {
				outStream.write(b, 0, readBuffer);
			}
			
			inStream.close();
			outStream.close();
		} catch (FileNotFoundException e) {
			System.out.println("파일을 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("파일 다운로드 중 예외가 발생하였습니다. : " + e.getMessage());
			e.printStackTrace();
		}
	}

	public static void deleteFile(HttpServletRequest req, String directory, String filename) {
		String sDirectory = req.getServletContext().getRealPath(directory);
		File file = new File(sDirectory + File.separator + filename);
		if (file.exists()) {
			file.delete();
		}
	}
}
