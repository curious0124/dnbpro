package com.dnb.pro.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.transaction.annotation.Transactional;

import com.dnb.pro.member.vo.MemberVO;
import com.dnb.pro.rent.vo.RentVO;

public interface MyPageService {
	public Map<String, List<RentVO>> listMyRent(String user_id) throws DataAccessException;
	
	public Map<String, List<RentVO>> findMyResqInfo(String user_id) throws DataAccessException;
	public Map<String, List<RentVO>> findMyResInfo(String user_id) throws DataAccessException;
	public Map<String, List<RentVO>> findMyReturnInfo(String user_id) throws DataAccessException;
	public Map<String, List<RentVO>> findMyLogInfo(String user_id) throws DataAccessException;
	
	public List<RentVO> listMyRentHistory(Map dateMap) throws DataAccessException;
	public MemberVO  modifyMyInfo(Map userMap) throws DataAccessException;
	public MemberVO myDetailInfo(String user_id) throws DataAccessException;
	
	public void cancelResq(RentVO rentVO) throws DataAccessException;
	public void cancelRes(RentVO rentVO) throws DataAccessException;
	public void cancelReturn(RentVO rentVO) throws DataAccessException;
	public int modMember(MemberVO memberVO) throws DataAccessException;
	public MemberVO selectMemberById(String user_id) throws DataAccessException;
}
