package com.dnb.pro.education.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.dnb.pro.education.vo.Criteria;
import com.dnb.pro.education.vo.SearchCriteria;
import com.dnb.pro.education.vo.educationVO;

public interface educationDAO {
	
	public List selectEducationList(SearchCriteria scri) throws DataAccessException; //교육 전체 리스트
	public int listeduCount(SearchCriteria scri) throws Exception; //교육 전체 카운트
	
//	public List<educationVO> selectByCateName(SearchCriteria scri, String cate_name) throws DataAccessException; // 교육 카테고리별 리스트
//	public int listCateEduCount(SearchCriteria scri) throws DataAccessException; // 교육 카테고리별 카운트
	
	
	public educationVO selecteducation(int edu_num) throws DataAccessException;
	public int insertNeweducation(Map educationMap) throws DataAccessException;
	public void updateeducation(Map educationMap) throws DataAccessException;
	public void deleteeducation(educationVO educationVO) throws DataAccessException;
	
//	public List eduCateNameList() throws DataAccessException; //교육카테고리 선택
	
	
}
