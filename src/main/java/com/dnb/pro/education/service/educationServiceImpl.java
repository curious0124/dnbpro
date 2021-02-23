package com.dnb.pro.education.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dnb.pro.education.dao.educationDAO;
import com.dnb.pro.education.vo.Criteria;
import com.dnb.pro.education.vo.educationVO;
import com.dnb.pro.education.vo.SearchCriteria;

@Service("educationService")
@Transactional(propagation = Propagation.REQUIRED)
public class educationServiceImpl implements educationService {
	@Autowired
	private educationDAO educationDAO;
	
	@Override
	public List<educationVO> listeducation(SearchCriteria scri) throws Exception{ // ���� ��ü ����Ʈ 
		List<educationVO> educationList = educationDAO.selectEducationList(scri);
		return educationList;
	}
	@Override
	public int listeduCount(SearchCriteria scri) throws Exception { // ���� ��ü ī��Ʈ
		return educationDAO.listeduCount(scri);
	}
	
//	@Override
//	public List<educationVO> listCateEdu(SearchCriteria scri, String cate_name) throws Exception { //����ī�װ��� ����Ʈ
//		List eduCateList=educationDAO.selectByCateName(scri, cate_name);
//		return eduCateList;
//	}
//	
//	@Override
//	public int listCateEduCount(SearchCriteria scri) throws Exception { //����ī�װ��� ī��Ʈ
//		
//		return educationDAO.listCateEduCount(scri);
//	}
	
	
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
		
	
//	@Override
//	public List<educationVO> listEduCateName() throws Exception { //���� ī�װ� ����
//		List<educationVO> eduCateNameList = educationDAO.eduCateNameList();
//		return eduCateNameList;
//	}	
	
}
