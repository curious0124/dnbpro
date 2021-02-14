package com.dnb.pro.equip.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

@Component("equipVO")
public class EquipVO {

	//분류
	private String cate_name;
	
	//모델정보
	
	private String eq_name;
	private String eq_img;
	private String eq_spec;
	private String eq_thumimg;
	private String eq_ma;
	
	//장비리스트
	private String eq_serial;
	private Date eq_produc;
	private Date eq_regist;
	private String eq_state;
	
	//예약
	private int res_num;
	private Date res_start;
	private Date res_end;
	private String res_Status;
	private String user_id;
	
	
	
	
	public int getRes_num() {
		return res_num;
	}
	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}
	public Date getRes_start() {
		return res_start;
	}
	public void setRes_start(Date res_start) {
		this.res_start = res_start;
	}
	public Date getRes_end() {
		return res_end;
	}
	public void setRes_end(Date res_end) {
		this.res_end = res_end;
	}
	public String getRes_Status() {
		return res_Status;
	}
	public void setRes_Status(String res_Status) {
		this.res_Status = res_Status;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public String getEq_name() {
		return eq_name;
	}
	public void setEq_name(String eq_name) {
		this.eq_name = eq_name;
	}
	public String getEq_img() {
		return eq_img;
	}
	public void setEq_img(String eq_img) {
		this.eq_img = eq_img;
	}
	public String getEq_spec() {
		return eq_spec;
	}
	public void setEq_spec(String eq_spec) {
		this.eq_spec = eq_spec;
	}
	public String getEq_thumimg() {
		return eq_thumimg;
	}
	public void setEq_thumimg(String eq_thumimg) {
		this.eq_thumimg = eq_thumimg;
	}
	public String getEq_ma() {
		return eq_ma;
	}
	public void setEq_ma(String eq_ma) {
		this.eq_ma = eq_ma;
	}
	public String getEq_serial() {
		return eq_serial;
	}
	public void setEq_serial(String eq_serial) {
		this.eq_serial = eq_serial;
	}
	public Date getEq_produc() {
		return eq_produc;
	}
	public void setEq_produc(Date eq_produc) {
		this.eq_produc = eq_produc;
	}
	public Date getEq_regist() {
		return eq_regist;
	}
	public void setEq_regist(Date eq_regist) {
		this.eq_regist = eq_regist;
	}
	public String getEq_state() {
		return eq_state;
	}
	public void setEq_state(String eq_state) {
		this.eq_state = eq_state;
	}
	
}
