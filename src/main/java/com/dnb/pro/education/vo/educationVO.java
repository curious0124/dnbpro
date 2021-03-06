package com.dnb.pro.education.vo;

import java.sql.Date;
import org.springframework.stereotype.Component;

@Component("educationVO")
public class educationVO {
	private int edu_num;
	private String eq_name;
	private String edu_title;
	private String edu_content;
	private Date edu_pub_date;
	private String edu_writer;
	private String edu_thuming;
	private String cate_name;
	
	
	
	public int getEdu_num() {
		return edu_num;
	}
	public void setEdu_num(int edu_num) {
		this.edu_num = edu_num;
	}
	public String getEdu_title() {
		return edu_title;
	}
	public void setEdu_title(String edu_title) {
		this.edu_title = edu_title;
	}
	public String getEdu_content() {
		return edu_content;
	}
	public void setEdu_content(String edu_content) {
		this.edu_content = edu_content;
	}
	public Date getEdu_pub_date() {
		return edu_pub_date;
	}
	public void setEdu_pub_date(Date edu_pub_date) {
		this.edu_pub_date = edu_pub_date;
	}
	public String getEdu_writer() {
		return edu_writer;
	}
	public void setEdu_writer(String edu_writer) {
		this.edu_writer = edu_writer;
	}
	public String getEdu_thuming() {
		return edu_thuming;
	}
	public void setEdu_thuming(String edu_thuming) {
		this.edu_thuming = edu_thuming;
	}
	public String getEq_name() {
		return eq_name;
	}
	public void setEq_name(String eq_name) {
		this.eq_name = eq_name;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}

	
	
}


