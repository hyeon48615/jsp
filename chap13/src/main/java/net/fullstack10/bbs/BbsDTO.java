package net.fullstack10.bbs;

import java.time.LocalDateTime;

public class BbsDTO {
	private int idx;
	private int bbs_ref_idx;
	private int bbs_level;
	private String sort_order;
	private String title;
	private String content;
	private String user_id;
	private LocalDateTime reg_date;
	private int read_cnt;
	private String file_path;
	private String file_name;
	private String file_ext;
	private int file_size;

	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getBbs_ref_idx() {
		return bbs_ref_idx;
	}
	public void setBbs_ref_idx(int bbs_ref_idx) {
		this.bbs_ref_idx = bbs_ref_idx;
	}
	public int getBbs_level() {
		return bbs_level;
	}
	public void setBbs_level(int bbs_level) {
		this.bbs_level = bbs_level;
	}
	public String getSort_order() {
		return sort_order;
	}
	public void setSort_order(String sort_order) {
		this.sort_order = sort_order;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public LocalDateTime getReg_date() {
		return reg_date;
	}
	public void setReg_date(LocalDateTime reg_date) {
		this.reg_date = reg_date;
	}
	public int getRead_cnt() {
		return read_cnt;
	}
	public void setRead_cnt(int read_cnt) {
		this.read_cnt = read_cnt;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_ext() {
		return file_ext;
	}
	public void setFile_ext(String file_ext) {
		this.file_ext = file_ext;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}

	
}
