package com.dnb.pro.rent.vo;

import java.util.Date;

import org.springframework.stereotype.Component;



	
	
	@Component("rentVO")
	public class RentVO {
       // 예약신청 목록
        private int Resq_num;
		private String User_id;
		private String Eq_serial;
		private Date Resq_start;
		private Date Resq_end;
		private Date Resq_date;
		
		// 예약 목록
		private int Res_num;
		private String Res_start;
		private Date Res_end;
		private String Status;
		public int getResq_num() {
			return Resq_num;
		}
		public void setResq_num(int resq_num) {
			Resq_num = resq_num;
		}
		public String getUser_id() {
			return User_id;
		}
		public void setUser_id(String user_id) {
			User_id = user_id;
		}
		public String getEq_serial() {
			return Eq_serial;
		}
		public void setEq_serial(String eq_serial) {
			Eq_serial = eq_serial;
		}
		public Date getResq_start() {
			return Resq_start;
		}
		public void setResq_start(Date resq_start) {
			Resq_start = resq_start;
		}
		public Date getResq_end() {
			return Resq_end;
		}
		public void setResq_end(Date resq_end) {
			Resq_end = resq_end;
		}
		public Date getResq_date() {
			return Resq_date;
		}
		public void setResq_date(Date resq_date) {
			Resq_date = resq_date;
		}
		public int getRes_num() {
			return Res_num;
		}
		public void setRes_num(int res_num) {
			Res_num = res_num;
		}
		public String getRes_start() {
			return Res_start;
		}
		public void setRes_start(String res_start) {
			Res_start = res_start;
		}
		public Date getRes_end() {
			return Res_end;
		}
		public void setRes_end(Date res_end) {
			Res_end = res_end;
		}
		public String getStatus() {
			return Status;
		}
		public void setStatus(String status) {
			Status = status;
		}
	
		
}
