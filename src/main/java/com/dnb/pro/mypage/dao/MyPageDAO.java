package com.dnb.pro.mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.dnb.pro.member.vo.MemberVO;
import com.dnb.pro.rent.vo.RentVO;


public interface MyPageDAO {
	public List<RentVO> selectMyResqList(String user_id) throws DataAccessException;
	public List<RentVO> selectMyResList(String user_id) throws DataAccessException;
	public List<RentVO> selectMyReturnList(String user_id) throws DataAccessException;
	public List<RentVO> selectMyLogList(String user_id) throws DataAccessException;
	public List selectMyResqInfo(String user_id) throws DataAccessException;
	public List selectMyResInfo(String user_id) throws DataAccessException;
	public List selectMyReturnInfo(String user_id) throws DataAccessException;
	public List selectMyLogInfo(String user_id) throws DataAccessException;
	public List<RentVO> selectMyResqHistoryList(Map dateMap) throws DataAccessException;
	public void updateMyInfo(Map userMap) throws DataAccessException;
	public MemberVO selectMyDetailInfo(String user_id) throws DataAccessException;
	public void updateMyResqCancel(int Resq_num) throws DataAccessException;
}
