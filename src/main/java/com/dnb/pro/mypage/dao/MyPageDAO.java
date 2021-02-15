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
	public List<RentVO> selectMyResqInfo(String user_id) throws DataAccessException;
	public List<RentVO> selectMyResInfo(String user_id) throws DataAccessException;
	public List<RentVO> selectMyReturnInfo(String user_id) throws DataAccessException;
	public List<RentVO> selectMyLogInfo(String user_id) throws DataAccessException;
	
	
	public List<RentVO> selectMyResqHistoryList(Map dateMap) throws DataAccessException;
	
	public void updateMyInfo(Map userMap) throws DataAccessException;
	public MemberVO selectMyDetailInfo(String user_id) throws DataAccessException;
	public int updateUserInfo(MemberVO memberVO) throws DataAccessException;
	public MemberVO selectMemberById(String user_id) throws DataAccessException;
	public int updateMember(MemberVO memberVO) throws DataAccessException;
	
	
	public List<RentVO> MyResqSelectCancel(int resq_num) throws DataAccessException;
	public void MyResqInsertCancel(RentVO rentVO) throws DataAccessException;
	public int MyResqDeleteCancel(int resq_num) throws DataAccessException;
	
	public List<RentVO> MyResSelectCancel(int res_num) throws DataAccessException;
	public void MyResInsertCancel(RentVO rentVO) throws DataAccessException;
	public void MyResDeleteCancel(int res_num) throws DataAccessException;
	
	public List<RentVO> MyReturnSelectCancel(int res_num) throws DataAccessException;
	public void MyReturnInsert1Cancel(RentVO rentVO) throws DataAccessException;
	public int MyReturnInsert2Cancel(RentVO rentVO) throws DataAccessException;
}
