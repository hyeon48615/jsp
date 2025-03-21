package net.fullstack10.common;

public class CommonPageUtil {
	public CommonPageUtil() {}
	public CommonPageUtil(int pageNo, int pageSize, int totalCount, int pageBlockSize) {
		setPagination(pageNo, pageSize, totalCount, pageBlockSize);
	}
	
	private int pageNo; 			// 현재 페이지
	private int pageSize; 			// 한 페이지에 보여줄 데이터 개수
	private int pageSkipCount;		// 스킵한 페이지 개수
	
	private int totalCount; 		// 총 데이터 개수
	private int totalPage;			// 총 페이지 수
	
	private int pageBlockSize;		// 한 번에 보여질 페이지 블럭의 개수
	private int pageBlockStart;		// 페이지 블럭 시작점
	private int pageBlockEnd; 		// 페이지 블럭 끝점
	
	private boolean prevPageFlag;	// 이전 페이지 블럭 존재 여부
	private boolean nextPageFlag;	// 이후 페이지 블럭 존재 여부
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageSkipCount() {
		return pageSkipCount;
	}
	public void setPageSkipCount() {
		this.pageSkipCount = (this.pageNo - 1) * this.pageSize;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage() {
		this.totalPage = (int) Math.ceil(this.totalCount / (float) this.pageSize);
	}
	public int getPageBlockSize() {
		return pageBlockSize;
	}
	public void setPageBlockSize(int pageBlockSize) {
		this.pageBlockSize = pageBlockSize;
	}
	public int getPageBlockStart() {
		return pageBlockStart;
	}
	public void setPageBlockStart() {
		this.pageBlockStart = (int) Math.floor((this.pageNo - 1) / (float) this.pageBlockSize) * this.pageBlockSize + 1;
	}
	public int getPageBlockEnd() {
		return pageBlockEnd;
	}
	public void setPageBlockEnd() {
		this.pageBlockEnd = (int) Math.ceil(this.pageNo / (float) this.pageBlockSize) * this.pageBlockSize;
		this.pageBlockEnd = Math.min(this.pageBlockEnd, this.totalPage);
	}
	public boolean isPrevPageFlag() {
		return prevPageFlag;
	}
	public void setPrevPageFlag() {
		this.prevPageFlag = (this.pageBlockStart > 1);
	}
	public boolean isNextPageFlag() {
		return nextPageFlag;
	}
	public void setNextPageFlag() {
		this.nextPageFlag = (this.pageBlockEnd < this.totalPage);
	}
	
	private void setPagination(int pageNo, int pageSize, int totalCount, int pageBlockSize) {
		this.setPageNo(pageNo);
		this.setPageSize(pageSize);
		this.setPageSkipCount();
		
		this.setTotalCount(totalCount);
		this.setTotalPage();
		
		this.setPageBlockSize(pageBlockSize);
		this.setPageBlockStart();
		this.setPageBlockEnd();
		
		this.setPrevPageFlag();
		this.setNextPageFlag();
	}
	
	public String printPagination(String url) {
		StringBuilder sb = new StringBuilder();
		if (this.pageNo != 1) {
			sb.append("<a href='" + url + "page_no=1' class='btn-page'><<</a>");
		}
		if (this.prevPageFlag) {
			int page = this.pageNo - this.pageBlockSize;
			if (page < 1) page = 1;
			sb.append("<a href='" + url + "page_no=" + page + "' class='btn-page'><</a>");
		}
		for (int i = this.pageBlockStart; i <= this.pageBlockEnd; i++) {
			if (i == this.pageNo) {
				sb.append("<a href='' class='btn-cur-page'>" + i + "</a>");
			} else {
				sb.append("<a href='" + url + "page_no=" + i + "' class='btn-page'>" + i + "</a>");
			}
		}
		if (this.nextPageFlag) {
			int page = this.pageNo + this.pageBlockSize;
			if (page > this.totalPage) page = this.totalPage;
			sb.append("<a href='" + url + "page_no=" + page + "' class='btn-page'>></a>");
		}
		if (this.pageNo != this.totalPage) {
			sb.append("<a href='" + url + "page_no=" + this.totalPage + "' class='btn-page'>>></a>");
		}
		return sb.toString();
	}
}
