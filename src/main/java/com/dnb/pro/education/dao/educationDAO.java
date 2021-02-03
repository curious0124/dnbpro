package com.dnb.pro.education.dao;

import java.util.List;

import com.dnb.pro.education.vo.educationVO;

public interface educationDAO {

	List<educationVO> selectEducationList (educationVO educationVO) throws Exception;
	educationVO selecteducationByCode(educationVO educationVO) throws Exception;	
}
