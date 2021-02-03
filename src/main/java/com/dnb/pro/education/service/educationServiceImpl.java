package com.dnb.pro.education.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dnb.pro.education.dao.educationDAO;
import com.dnb.pro.education.vo.educationVO;

@Service
public class educationServiceImpl {
	@Autowired
	private educationDAO dao;

	public List<educationVO> selectEducationList(educationVO educationVO) throws Exception {
		return dao.selectEducationList(educationVO);
	}
}
