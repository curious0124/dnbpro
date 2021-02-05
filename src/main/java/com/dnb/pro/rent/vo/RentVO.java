package com.dnb.pro.rent.vo;

import java.util.Date;

import org.springframework.stereotype.Component;



	
	
	@Component("rentVO")
	public class RentVO {
       // 예약신청 목록
        private int resq_num;
		private String user_id;
		private String eq_serial;
		private Date resq_start;
		private Date resq_end;
		private Date resq_date;
		
		// 예약 목록
		private int res_num;
		private Date res_start;
		private Date res_end;
		private String res_Status;
		
		//배송반납
		private int return_num;
		private int express_num;
		private Date return_date;
		private String return_Status;
		
		//예약로그
		    private int log_num;
			private String status;
			private String log_maker;
			private Date log_date;
			private String cate_name;
			private String eq_name;
			
			
			public int getResq_num() {
				return resq_num;
			}
			public void setResq_num(int resq_num) {
				this.resq_num = resq_num;
			}
			public String getUser_id() {
				return user_id;
			}
			public void setUser_id(String user_id) {
				this.user_id = user_id;
			}
			public String getEq_serial() {
				return eq_serial;
			}
			public void setEq_serial(String eq_serial) {
				this.eq_serial = eq_serial;
			}
			public Date getResq_start() {
				return resq_start;
			}
			public void setResq_start(Date resq_start) {
				this.resq_start = resq_start;
			}
			public Date getResq_end() {
				return resq_end;
			}
			public void setResq_end(Date resq_end) {
				this.resq_end = resq_end;
			}
			public Date getResq_date() {
				return resq_date;
			}
			public void setResq_date(Date resq_date) {
				this.resq_date = resq_date;
			}
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
			public int getReturn_num() {
				return return_num;
			}
			public void setReturn_num(int return_num) {
				this.return_num = return_num;
			}
			public int getExpress_num() {
				return express_num;
			}
			public void setExpress_num(int express_num) {
				this.express_num = express_num;
			}
			public Date getReturn_date() {
				return return_date;
			}
			public void setReturn_date(Date return_date) {
				this.return_date = return_date;
			}
			public String getReturn_Status() {
				return return_Status;
			}
			public void setReturn_Status(String return_Status) {
				this.return_Status = return_Status;
			}
			public int getLog_num() {
				return log_num;
			}
			public void setLog_num(int log_num) {
				this.log_num = log_num;
			}
			public String getStatus() {
				return status;
			}
			public void setStatus(String status) {
				this.status = status;
			}
			public String getLog_maker() {
				return log_maker;
			}
			public void setLog_maker(String log_maker) {
				this.log_maker = log_maker;
			}
			public Date getLog_date() {
				return log_date;
			}
			public void setLog_date(Date log_date) {
				this.log_date = log_date;
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
		


			
			
			
		
}
