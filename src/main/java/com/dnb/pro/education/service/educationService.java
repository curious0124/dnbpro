package com.dnb.pro.education.service;

import java.util.List;
import java.util.Map;

import com.dnb.pro.education.vo.Criteria;
import com.dnb.pro.education.vo.educationVO;
import com.dnb.pro.education.vo.SearchCriteria;

public interface educationService {
	
	public List<educationVO> listeducation(SearchCriteria scri) throws Exception; //������ü���� ����Ʈ
	public int listeduCount(SearchCriteria scri) throws Exception; // ������ü ����Ʈ ī��Ʈ
	
//	public List<educationVO> listCateEdu(SearchCriteria scri, String cate_name) throws Exception; //ī�װ��� ����Ʈ
//	public int listCateEduCount(SearchCriteria scri) throws Exception; //���� ī�װ��� ī��Ʈ

//	/* public List listeducation(Criteria cri) throws Exception; */
	public educationVO vieweducation(int edu_num) throws Exception;
	public int addNeweducation(Map educationMap) throws Exception;
	public void modeducation(Map educationMap) throws Exception;
	public void deleteeducation(educationVO educationVO) throws Exception;
	
	
//	public List listEduCateName() throws Exception; // ī�װ� selectBox 
	
	
	
	
	
	
	
	
}