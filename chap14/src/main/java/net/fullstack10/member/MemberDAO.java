package net.fullstack10.member;

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
	
	
}
