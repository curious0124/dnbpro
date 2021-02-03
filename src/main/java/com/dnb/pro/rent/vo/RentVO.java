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
		private String Res_Status;
		
		//배송반납
		private int Return_num;
		private int Express_num;
		private Date Return_date;
		private String Return_Status;
		
		//예약로그
	    private int Log_num;
		private String Status;
		private String Log_maker;
		private Date Log_date;
		private Date Cate_name;
		private Date Eq_name;
		
			
			public String getRes_Status() {
				return Res_Status;
			}
			public void setRes_Status(String res_Status) {
				Res_Status = res_Status;
			}
			public int getReturn_num() {
				return Return_num;
			}
			public void setReturn_num(int return_num) {
				Return_num = return_num;
			}
			public int getExpress_num() {
				return Express_num;
			}
			public void setExpress_num(int express_num) {
				Express_num = express_num;
			}
			public Date getReturn_date() {
				return Return_date;
			}
			public void setReturn_date(Date return_date) {
				Return_date = return_date;
			}
			public String getReturn_Status() {
				return Return_Status;
			}
			public void setReturn_Status(String return_Status) {
				Return_Status = return_Status;
			}
			public int getLog_num() {
				return Log_num;
			}
			public void setLog_num(int log_num) {
				Log_num = log_num;
			}
			public String getLog_maker() {
				return Log_maker;
			}
			public void setLog_maker(String log_maker) {
				Log_maker = log_maker;
			}
			public Date getLog_date() {
				return Log_date;
			}
			public void setLog_date(Date log_date) {
				Log_date = log_date;
			}
			public Date getCate_name() {
				return Cate_name;
			}
			public void setCate_name(Date cate_name) {
				Cate_name = cate_name;
			}
			public Date getEq_name() {
				return Eq_name;
			}
			public void setEq_name(Date eq_name) {
				Eq_name = eq_name;
			}
			
		
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
