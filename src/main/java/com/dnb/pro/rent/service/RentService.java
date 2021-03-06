package com.dnb.pro.rent.service;

import java.util.List;
import java.util.Map;

import com.dnb.pro.rent.vo.Criteria;
import com.dnb.pro.rent.vo.RentVO;
import com.dnb.pro.rent.vo.SearchCriteria;

public interface RentService {

	
	public List listlogs(SearchCriteria scri) throws Exception;
	
	public List listresqs() throws Exception;
	
	public List listres() throws Exception;
	
	public List listrent() throws Exception;
	
	public List listreturn() throws Exception;
	
	public void AuthRes(RentVO rentVO) throws Exception;
	
	public void CancleResq(RentVO rentVO) throws Exception;
	
	public void ResStateupdate(Map resmap) throws Exception;
	public void ResStateinsertLog(Map resmap) throws Exception;
	
	
	public void CancleRes(RentVO rentVO) throws Exception;
	
	public void ReturnRenting(RentVO rentVO) throws Exception;
	
	
	public void ReturnExpressAuth(RentVO rentVO) throws Exception;
	
	
	public int listlogpageCount(SearchCriteria scri) throws Exception;
//	public List<RentVO> listpagelogs(Criteria cri) throws Exception;

	public void insertAskRent(RentVO rentVO) throws Exception;
	
	public List selectResoverlap(RentVO rentVO) throws Exception;
	
}
