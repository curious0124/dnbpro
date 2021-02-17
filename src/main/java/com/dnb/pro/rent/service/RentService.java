package com.dnb.pro.rent.service;

import java.util.List;
import java.util.Map;

import com.dnb.pro.rent.vo.RentVO;

public interface RentService {

	
	public List listlogs() throws Exception;
	
	public List listresqs() throws Exception;
	
	public List listres() throws Exception;
	
	public List listrent() throws Exception;
	
	public List listreturn() throws Exception;
	
	public void AuthRes(RentVO rentVO) throws Exception;
	
	public void CancleResq(RentVO rentVO) throws Exception;
	
}
