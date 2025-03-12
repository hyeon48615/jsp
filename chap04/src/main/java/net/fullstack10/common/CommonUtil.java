package net.fullstack10.common;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CommonUtil {
	public void makeCookie(HttpServletResponse res
			, String name, String value, String domain, String path, int exp) {
		Cookie cookie = new Cookie(name, value);
		if (domain != null) {
			cookie.setDomain(domain);
		}
		if (path != null) {
			cookie.setPath(path);
		}
		cookie.setMaxAge(exp);
		res.addCookie(cookie);
	}
	
	public String getCookieInfo(HttpServletRequest req, String name) {
		String rtnValue = "";
		
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for(Cookie c : cookies) {
				if (name.equals(c.getName())) {
					rtnValue = c.getValue();
					break;
				}
			}
		}
		return rtnValue;
	}
}
