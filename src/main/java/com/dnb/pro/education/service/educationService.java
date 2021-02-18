package com.dnb.pro.education.service;

import java.util.List;
import java.util.Map;

import com.dnb.pro.education.vo.educationVO;

public interface educationService {

	public List listeducation() throws Exception;
	public educationVO vieweducation(int edu_num) throws Exception;
	public int addNeweducation(Map educationMap) throws Exception;
	public void modeducation(Map educationMap) throws Exception;
	public void deleteeducation(educationVO educationVO) throws Exception;
	
	
	public List listEduCateName() throws Exception;
	public List<educationVO> listCateEdu(String cate_name) throws Exception;
}