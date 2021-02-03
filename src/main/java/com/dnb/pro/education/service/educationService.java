package com.dnb.pro.education.service;

import java.util.List;

import com.dnb.pro.education.vo.educationVO;

public interface educationService {
	public List<educationVO> selectEducationList(educationVO educationVO);
}
