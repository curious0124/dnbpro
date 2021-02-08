package com.dnb.pro.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dnb.pro.member.vo.MemberVO;
import com.dnb.pro.mypage.dao.MyPageDAO;
import com.dnb.pro.rent.vo.RentVO;

@Service("myPageService")
@Transactional(propagation=Propagation.REQUIRED)
public class MyPageServiceImpl implements MyPageService {

	
	@Autowired
	private MyPageDAO myPageDAO;
	
	@Override
	public Map<String, List<RentVO>> listMyRent(String user_id) throws Exception {
		Map<String, List<RentVO>> MapDAO = new HashMap<String, List<RentVO>>();
		
		List<RentVO> resqList= myPageDAO.selectMyResqList(user_id);
		List<RentVO> resList= myPageDAO.selectMyResList(user_id);
		List<RentVO> returnList= myPageDAO.selectMyReturnList(user_id);
		List<RentVO> logList= myPageDAO.selectMyLogList(user_id);
		
		MapDAO.put("resq", resqList);
		MapDAO.put("res", resList);
		MapDAO.put("ret", returnList);
		MapDAO.put("log", logList);
//		System.out.println("resList : " + MapDAO.get(resList));
		return MapDAO;
		
	}

	@Override
	public Map<String, List<RentVO>> findMyResqInfo(String user_id) throws Exception {
		Map<String, List<RentVO>> MapDAO2 = new HashMap<String, List<RentVO>>();
		List<RentVO> resqList= myPageDAO.selectMyResqInfo(user_id);
		
		MapDAO2.put("resq", resqList);
		
		return MapDAO2;
	}
	
	@Override
	public Map<String, List<RentVO>> findMyResInfo(String user_id) throws Exception {
		Map<String, List<RentVO>> MapDAO3 = new HashMap<String, List<RentVO>>();
		List<RentVO> resList= myPageDAO.selectMyResInfo(user_id);
		
		MapDAO3.put("res", resList);
		
		return MapDAO3;
	}

	@Override
	public Map<String, List<RentVO>> findMyReturnInfo(String user_id) throws Exception {
		Map<String, List<RentVO>> MapDAO4 = new HashMap<String, List<RentVO>>();
		List<RentVO> retList= myPageDAO.selectMyReturnInfo(user_id);
		
		MapDAO4.put("ret", retList);
		
		return MapDAO4;
	}

	@Override
	public Map<String, List<RentVO>> findMyLogInfo(String user_id) throws Exception {
		Map<String, List<RentVO>> MapDAO5 = new HashMap<String, List<RentVO>>();
		List<RentVO> logList= myPageDAO.selectMyLogInfo(user_id);
		
		MapDAO5.put("log", logList);
		
		return MapDAO5;
	}

	@Override
	public List<RentVO> listMyRentHistory(Map dateMap) throws Exception {
		return null;
	}

	@Override
	public MemberVO modifyMyInfo(Map userMap) throws Exception {
		return null;
	}

	@Override
	public void cancelRent(String resq_num) throws Exception {
		
	}

	@Override
	public MemberVO myDetailInfo(String user_id) throws Exception {
		return null;
	}

	

	

	
}
