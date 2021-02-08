package com.dnb.pro.mypage.service;

import java.util.List;
import java.util.Map;

import com.dnb.pro.member.vo.MemberVO;
import com.dnb.pro.rent.vo.RentVO;

public interface MyPageService {
	public Map<String, List<RentVO>> listMyRent(String user_id) throws Exception;
	public Map<String, List<RentVO>> findMyResqInfo(String user_id) throws Exception;
	public Map<String, List<RentVO>> findMyResInfo(String user_id) throws Exception;
	public Map<String, List<RentVO>> findMyReturnInfo(String user_id) throws Exception;
	public Map<String, List<RentVO>> findMyLogInfo(String user_id) throws Exception;
	public List<RentVO> listMyRentHistory(Map dateMap) throws Exception;
	public MemberVO  modifyMyInfo(Map userMap) throws Exception;
	public void cancelRent(String resq_num) throws Exception;
	public MemberVO myDetailInfo(String user_id) throws Exception;
}
