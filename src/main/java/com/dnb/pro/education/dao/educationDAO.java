package com.dnb.pro.education.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.dnb.pro.education.vo.educationVO;

public interface educationDAO {
	
	public List selectEducationList() throws DataAccessException;
	public educationVO selecteducation(int edu_num) throws DataAccessException;
	public int insertNeweducation(Map educationMap) throws DataAccessException;
	public void updateeducation(Map educationMap) throws DataAccessException;
	public void deleteeducation(educationVO educationVO) throws DataAccessException;
	
	public List eduCateNameList() throws DataAccessException;
	public List<educationVO> selectByCateName(String cate_name) throws DataAccessException;
}
