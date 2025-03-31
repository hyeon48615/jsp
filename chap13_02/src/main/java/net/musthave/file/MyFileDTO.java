package net.musthave.file;

import java.time.LocalDateTime;

public class MyFileDTO {
	private int idx;
	private String title;
	private String category;
	private String ofile;
	private String sfile;
	private LocalDateTime postdate;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getOfile() {
		return ofile;
	}
	public void setOfile(String ofile) {
		this.ofile = ofile;
	}
	public String getSfile() {
		return sfile;
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	public LocalDateTime getPostdate() {
		return postdate;
	}
	public void setPostdate(LocalDateTime postdate) {
		this.postdate = postdate;
	}
}
