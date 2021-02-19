package com.dnb.pro.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dnb.pro.member.vo.MemberVO;
import com.dnb.pro.mypage.vo.MyPageVO;
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
	public List<RentVO> selectMyResqInfo(String user_id) throws DataAccessException {
		List<RentVO> myResqList=sqlSession.selectList("mapper.mypage.selectMyResqResult",user_id);
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
		List myReturnList=(List)sqlSession.selectList("mapper.mypage.selectMyReturnResult",user_id);
		return myReturnList;
	}
	////반납
	public List selectMyLogInfo(String user_id) throws DataAccessException {
		List myLogList=(List)sqlSession.selectList("mapper.mypage.selectMyLogResult",user_id);
		return myLogList;
	}
	
////취소 메서드
	@Override
	public List<RentVO> MyResqSelectCancel(int resq_num) throws DataAccessException{
		List<RentVO> rentVO=sqlSession.selectList("mapper.mypage.MyResqSelectCancel",resq_num);
		return rentVO;
	}
	
	@Override
	public void MyResqInsertCancel(RentVO rentVO) throws DataAccessException {
		sqlSession.insert("mapper.mypage.MyResqInsertCancel",rentVO);
		
	}
	@Override
	public int MyResqDeleteCancel(int resq_num) throws DataAccessException {
		return sqlSession.delete("mapper.mypage.MyResqDeleteCancel",resq_num);
		
	}
	
	@Override
	public List<RentVO> MyResSelectCancel(int res_num) throws DataAccessException{
		List<RentVO> rentVO = sqlSession.selectList("mapper.mypage.MyResSelectCancel",res_num);
		return rentVO;
	}
	
	@Override
	public void MyResInsertCancel(RentVO rentVO) throws DataAccessException {
		sqlSession.insert("mapper.mypage.MyResInsertCancel",rentVO);
		
	}
	@Override
	public void MyResDeleteCancel(int res_num) throws DataAccessException {
		sqlSession.delete("mapper.mypage.MyResDeleteCancel",res_num);
		
	}
	
	@Override
	public List<RentVO> MyReturnSelectCancel(int res_num) throws DataAccessException{
		List<RentVO> rentVO = sqlSession.selectList("mapper.mypage.MyReturnSelect1Cancel",res_num);
		return rentVO;
	}
	
	@Override
	public void MyReturnInsert1Cancel(RentVO rentVO) throws DataAccessException {
		sqlSession.insert("mapper.mypage.MyReturnInsert1Cancel",rentVO);
		
	}
	@Override
	public int MyReturnInsert2Cancel(RentVO rentVO) throws DataAccessException {
		return sqlSession.insert("mapper.mypage.MyReturnInsert2Cancel",rentVO);
		
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
	public int updateUserInfo(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.update("mapper.mypage.updateMember",memberVO);
		return result;
	}
	
	@Override
	public MemberVO selectMemberById(String user_id) throws DataAccessException {
		MemberVO result = (MemberVO) sqlSession.selectOne("mapper.mypage.selectMemberById", user_id);
		return result;
	}
	@Override
	public int updateMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.update("mapper.mypage.updateMember",memberVO);
		return result;
	}
	@Override
	public void removeMember(String user_id) throws DataAccessException {
		sqlSession.delete("mapper.mypage.removeMember",user_id);
		
	}
	@Override
	public void addQuit(Map<String, Object> firemap) throws DataAccessException {
		sqlSession.insert("mapper.mypage.addQuit",firemap);
	}

	

}
