package net.fullstack10.common;

import java.io.PrintWriter;

public class BbsPage {
	public static String pagingArea(
			int total_count, int page_no
			, int page_size, int page_block_size
			, String linkUrl) {
		StringBuilder sb = new StringBuilder();
		String tmpLinkURL = (linkUrl!=null&&!linkUrl.isEmpty()?linkUrl:"?");
		
		int total_page = (int)Math.ceil(total_count/(double)page_size);
		total_page = (total_page > 1 ? total_page : 1);
		int page_block_start = (int)Math.floor((page_no-1)/(double)page_size)*page_size +1;
		int page_block_end = (int)Math.ceil(page_no/(double)page_size)*page_size;
		page_block_end = (page_block_end>total_page?total_page:page_block_end);
		
		sb.append((page_no>1? "<a href='"+tmpLinkURL+"&page_no=1'><strong><<</strong></a>&nbsp;&nbsp;" : "<<&nbsp;&nbsp;"));
		sb.append((page_block_start>1? "<a href='"+tmpLinkURL+"&page_no="+(page_block_start-1)+"'><strong><</strong></a>&nbsp;&nbsp;" : "<&nbsp;&nbsp;"));
		for (int i=page_block_start; i<=page_block_end; i++) {
			if ( page_no == i ){
				sb.append("<strong>"+i+"</strong>");
			} else {
				sb.append("<a href='"+tmpLinkURL+"&page_no="+i+"'>"+i+"</a>");
			}
			if (i!=page_block_end) {
				sb.append("&nbsp;|&nbsp;");
			}
		}

		sb.append((total_page>page_block_end? "&nbsp;&nbsp;<a href='"+tmpLinkURL+"&page_no="+(page_block_end+1)+"'><strong>></strong></a>" : "&nbsp;&nbsp;>"));
		sb.append((total_page>page_block_end? "&nbsp;&nbsp;<a href='"+tmpLinkURL+"&page_no="+(total_page)+"'><strong>>></strong></a>" : "&nbsp;&nbsp;>>"));

		return sb.toString();
	}
}
