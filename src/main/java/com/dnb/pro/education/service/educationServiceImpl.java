package com.dnb.pro.education.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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
}
