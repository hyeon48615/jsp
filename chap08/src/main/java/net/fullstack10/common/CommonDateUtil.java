package net.fullstack10.common;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;

public class CommonDateUtil {
	public CommonDateUtil() {}
	
	// LocalDate 타입 --> Date 타입으로 변환
	// LocalDateTime 타입 --> DateTime 타입으로 변환
	// Date 타입 --> LocalDate 타입으로 변환
			
	// Date 타입 --> LocalDateTime 으로 변환
	public LocalDateTime toLocalDateTime(Date date) {
		return date == null ? null :
				Instant.ofEpochMilli(date.getTime()).atZone(ZoneId.systemDefault()).toLocalDateTime();
	}
	
	// Date 타입 --> LocalDateTime 문자열로 변환
}
