package com.dnb.pro.education.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dnb.pro.board.vo.ArticleVO;
import com.dnb.pro.education.dao.educationDAO;
import com.dnb.pro.education.vo.educationVO;

@Service("educationService")
@Transactional(propagation = Propagation.REQUIRED)
public class educationServiceImpl implements educationService {
	@Autowired
	private educationDAO educationDAO;
	
	public List<educationVO> listeducation() throws Exception{
		List<educationVO> educationList = educationDAO.selectEducationList();
		return educationList;
	}
	@Override
	public educationVO vieweducation(int edu_num) throws Exception {
		educationVO educationVO = educationDAO.selecteducation(edu_num);
		return educationVO;
	}
	@Override
	public int addNeweducation(Map educationMap) throws Exception {
		System.out.println("service"+educationMap);
		return educationDAO.insertNeweducation(educationMap);
	}
	@Override
	public void modeducation(Map educationMap) throws Exception {
		educationDAO.updateeducation(educationMap);
		
	}

	@Override
	public void deleteeducation(educationVO educationVO) throws Exception {
		educationDAO.deleteeducation(educationVO);
	}
		
	
	@Override
	public List<educationVO> listEduCateName() throws Exception {
		List<educationVO> eduCateNameList = educationDAO.eduCateNameList();
		return eduCateNameList;
	}	
	@Override
	public List<educationVO> listCateEdu(String cate_name) throws Exception {
		List eduCateList=educationDAO.selectByCateName(cate_name);
		return eduCateList;
	}
}
