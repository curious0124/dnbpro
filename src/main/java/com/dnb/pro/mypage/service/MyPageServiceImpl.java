package com.dnb.pro.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dnb.pro.member.vo.MemberVO;
import com.dnb.pro.mypage.dao.MyPageDAO;
import com.dnb.pro.mypage.vo.MyPageVO;
import com.dnb.pro.rent.vo.RentVO;

@Service("myPageService")
@Transactional(propagation=Propagation.REQUIRED)
public class MyPageServiceImpl implements MyPageService {

	
	@Autowired
	private MyPageDAO myPageDAO;
	
	@Override
	public Map<String, List<RentVO>> listMyRent(String user_id) throws DataAccessException {
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
	public Map<String, List<RentVO>> findMyResqInfo(String user_id) throws DataAccessException {
		Map<String, List<RentVO>> MapDAO2 = new HashMap<String, List<RentVO>>();
		List<RentVO> resqList= myPageDAO.selectMyResqInfo(user_id);
		
		MapDAO2.put("resq", resqList);
		
		return MapDAO2;
	}
	
	@Override
	public Map<String, List<RentVO>> findMyResInfo(String user_id) throws DataAccessException {
		Map<String, List<RentVO>> MapDAO3 = new HashMap<String, List<RentVO>>();
		List<RentVO> resList= myPageDAO.selectMyResInfo(user_id);
		
		MapDAO3.put("res", resList);
		
		return MapDAO3;
	}

	@Override
	public Map<String, List<RentVO>> findMyReturnInfo(String user_id) throws DataAccessException {
		Map<String, List<RentVO>> MapDAO4 = new HashMap<String, List<RentVO>>();
		List<RentVO> retList= myPageDAO.selectMyReturnInfo(user_id);
		
		MapDAO4.put("ret", retList);
		
		return MapDAO4;
	}

	@Override
	public Map<String, List<RentVO>> findMyLogInfo(String user_id) throws DataAccessException {
		Map<String, List<RentVO>> MapDAO5 = new HashMap<String, List<RentVO>>();
		List<RentVO> logList= myPageDAO.selectMyLogInfo(user_id);
		
		MapDAO5.put("log", logList);
		
		return MapDAO5;
	}
	
	
	
	@Override
	public void cancelResq(RentVO rentVO) throws DataAccessException {
		int resq_num = rentVO.getResq_num();
		List<RentVO> list = myPageDAO.MyResqSelectCancel(resq_num);
		
		RentVO vo = list.get(0);
		
		String cate_name =rentVO.getCate_name();
		vo.setCate_name(cate_name);
		myPageDAO.MyResqInsertCancel(vo);
		myPageDAO.MyResqDeleteCancel(resq_num);
	}

	@Override
	public void cancelRes(RentVO rentVO) throws DataAccessException {
		int res_num = rentVO.getRes_num();
		List<RentVO> list = myPageDAO.MyResSelectCancel(res_num);
		
		RentVO vo = list.get(0);
		String cate_name = rentVO.getCate_name();
		vo.setCate_name(cate_name);
		
		myPageDAO.MyResInsertCancel(vo);
		myPageDAO.MyResDeleteCancel(res_num);
	}

	@Override
	public void cancelReturn(RentVO rentVO) throws DataAccessException {
		
		int res_num = rentVO.getRes_num();
		List<RentVO> list = myPageDAO.MyReturnSelectCancel(res_num);
		
		RentVO vo = list.get(0);
		String cate_name = rentVO.getCate_name();
		vo.setCate_name(cate_name);
		String express_num = rentVO.getExpress_num();
		vo.setExpress_num(express_num);
		
		myPageDAO.MyReturnInsert1Cancel(vo);
		myPageDAO.MyReturnInsert2Cancel(vo);
	}
	
	
	
	
	
	@Override
	public MemberVO myDetailInfo(String user_id) throws DataAccessException {
		return myPageDAO.selectMyDetailInfo(user_id);
	}
	
	

	@Override
	public List<RentVO> listMyRentHistory(Map dateMap) throws DataAccessException {
		return null;
	}

	@Override
	public MemberVO modifyMyInfo(Map userMap) throws DataAccessException {
		return null;
	}
	
	@Override
	public MemberVO selectMemberById(String user_id) throws DataAccessException {
		return myPageDAO.selectMemberById(user_id);
	}

	@Override
	public int modMember(MemberVO memberVO) throws DataAccessException {
		return myPageDAO.updateMember(memberVO);
	}

	@Override
	public void removeMember(Map<String, Object> firemap) throws DataAccessException {
		myPageDAO.removeMember((String)firemap.get("user_id"));
		myPageDAO.addQuit(firemap);
	}

	
	
	

	
}
