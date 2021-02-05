package com.dnb.pro.member.vo;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_identity;
	private String user_addr;
	private String user_phone;
	private String user_fax;
	private String user_email;
	private String user_comp;
	private String comp_addr;
	private String comp_num;
	private String comp_phon;
	private String comp_fax;
	private String comp_email;
	private String user_auth;
	
	public MemberVO() {
		
	}
	
	public MemberVO(String id, String pwd) {
		this.user_id = id;
		this.user_pwd = pwd;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_identity() {
		return user_identity;
	}
	public void setUser_identity(String user_identity) {
		this.user_identity = user_identity;
	}
	public String getUser_addr() {
		return user_addr;
	}
	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_fax() {
		return user_fax;
	}
	public void setUser_fax(String user_fax) {
		this.user_fax = user_fax;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_comp() {
		return user_comp;
	}
	public void setUser_comp(String user_comp) {
		this.user_comp = user_comp;
	}
	public String getComp_addr() {
		return comp_addr;
	}
	public void setComp_addr(String comp_addr) {
		this.comp_addr = comp_addr;
	}
	public String getComp_num() {
		return comp_num;
	}
	public void setComp_num(String comp_num) {
		this.comp_num = comp_num;
	}
	public String getComp_phon() {
		return comp_phon;
	}
	public void setComp_phon(String comp_phon) {
		this.comp_phon = comp_phon;
	}
	public String getComp_fax() {
		return comp_fax;
	}
	public void setComp_fax(String comp_fax) {
		this.comp_fax = comp_fax;
	}
	public String getComp_email() {
		return comp_email;
	}
	public void setComp_email(String comp_email) {
		this.comp_email = comp_email;
	}
	public String getUser_auth() {
		return user_auth;
	}
	public void setUser_auth(String user_auth) {
		this.user_auth = user_auth;
	}

}
