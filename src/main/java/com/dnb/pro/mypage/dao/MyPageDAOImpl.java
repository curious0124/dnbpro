package com.dnb.pro.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dnb.pro.member.vo.MemberVO;
import com.dnb.pro.rent.vo.RentVO;

@Repository("myPageDAO")
public class MyPageDAOImpl implements MyPageDAO {
	
	@Autowired
	private SqlSession sqlSession;
//
	////마이페이지 예약관련 4가지
	@Override
	public List<RentVO> selectMyResqList(String user_id) throws DataAccessException {
		List<RentVO> ResqList=(List)sqlSession.selectList("mapper.mypage.selectMyResqList",user_id);
		System.out.println("Resqlist : " + sqlSession.selectList("mapper.mypage.selectMyResqList",user_id));
		return ResqList;
	}
//	
	@Override
	public List<RentVO> selectMyResList(String user_id) throws DataAccessException {
		List<RentVO> ResList=(List)sqlSession.selectList("mapper.mypage.selectMyResList",user_id);
		return ResList;
	}
//
	@Override
	public List<RentVO> selectMyReturnList(String user_id) throws DataAccessException {
		List<RentVO> ReturnList=(List)sqlSession.selectList("mapper.mypage.selectMyReturnList",user_id);
		return ReturnList;
	}
//
	@Override
	public List<RentVO> selectMyLogList(String user_id) throws DataAccessException {
		List<RentVO> LogList=(List)sqlSession.selectList("mapper.mypage.selectMyLogList",user_id);
		return LogList;
	} 

	
	//// 예약 신청 상세페이지
	@Override
	public List selectMyResqInfo(String user_id) throws DataAccessException {
		List myResqList=(List)sqlSession.selectList("mapper.mypage.selectMyResqResult",user_id);
		return myResqList;
	}
	////예약중 상세페이지
	@Override
	public List selectMyResInfo(String user_id) throws DataAccessException {
		List myResList=(List)sqlSession.selectList("mapper.mypage.selectMyResResult",user_id);
		return myResList;
	}
	////대여중 상세페이지
	@Override
	public List selectMyReturnInfo(String user_id) throws DataAccessException {
		List myResList=(List)sqlSession.selectList("mapper.mypage.selectMyReturnResult",user_id);
		return myResList;
	}
	////반납
	public List selectMyLogInfo(String user_id) throws DataAccessException {
		List myResList=(List)sqlSession.selectList("mapper.mypage.selectMyLogResult",user_id);
		return myResList;
	}
	
	
	
	
	@Override
	public List<RentVO> selectMyResqHistoryList(Map dateMap) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void updateMyInfo(Map userMap) throws DataAccessException {
		// TODO Auto-generated method stub
		
	}
	@Override
	public MemberVO selectMyDetailInfo(String user_id) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMyResqCancel(int Resq_num) throws DataAccessException {
		// TODO Auto-generated method stub
		
	}

	

}
