package com.dnb.pro.education.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.dnb.pro.education.vo.Criteria;
import com.dnb.pro.education.vo.SearchCriteria;
import com.dnb.pro.education.vo.educationVO;

public interface educationDAO {
	
	public List selectEducationList(SearchCriteria scri) throws DataAccessException; //���� ��ü ����Ʈ
	public int listeduCount(SearchCriteria scri) throws Exception; //���� ��ü ī��Ʈ
	
//	public List<educationVO> selectByCateName(SearchCriteria scri, String cate_name) throws DataAccessException; // ���� ī�װ��� ����Ʈ
//	public int listCateEduCount(SearchCriteria scri) throws DataAccessException; // ���� ī�װ��� ī��Ʈ
	
	
	public educationVO selecteducation(int edu_num) throws DataAccessException;
	public int insertNeweducation(Map educationMap) throws DataAccessException;
	public void updateeducation(Map educationMap) throws DataAccessException;
	public void deleteeducation(educationVO educationVO) throws DataAccessException;
	
//	public List eduCateNameList() throws DataAccessException; //����ī�װ� ����
	
	
}
