package com.dnb.pro.mypage.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("MyPageVO")
public class MyPageVO {
	private String user_id;
	private String status;
	private String quit_reason;
	private Date quit_date;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getQuit_reason() {
		return quit_reason;
	}
	public void setQuit_reason(String quit_reason) {
		this.quit_reason = quit_reason;
	}
	public Date getQuit_date() {
		return quit_date;
	}
	public void setQuit_date(Date quit_date) {
		this.quit_date = quit_date;
	}
	

}
