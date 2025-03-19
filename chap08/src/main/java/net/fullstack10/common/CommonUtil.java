package net.fullstack10.common;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CommonUtil {
	public boolean isNumeric(String str) {
		return str != null && !str.isEmpty() && !str.isBlank() && str.matches("[0-9]+");
	}
	
	public int parseInt(String no) {
		return (isNumeric(no) ? Integer.parseInt(no) : 0);
	}
	
	public int parseInt(String no, int def) {
		return (isNumeric(no) ? Integer.parseInt(no) : def);
	}
	
	public void makeCookie(HttpServletResponse res
			, String domain, String path, int exp
			, String cName, String cValue) {

		// 쿠키 생성
		Cookie cookie = new Cookie(cName, cValue);
		if ( domain != null ){
			cookie.setDomain(domain);
		}
		if ( path != null ){
			cookie.setPath(path);
		}
		cookie.setMaxAge(exp);
		res.addCookie(cookie);
	}
	
	public String getCookieInfo(HttpServletRequest req, String cName) {
		String rtnValue = "";
		Cookie[] cookies = req.getCookies();
		if ( cookies != null ) {
			for (Cookie c : cookies){
				if ( cName.equals(c.getName()) ) {
					rtnValue = c.getValue();
					break;
				}
			}
		}
		return rtnValue;
	}

}
