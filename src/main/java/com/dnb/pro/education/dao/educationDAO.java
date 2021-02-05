package com.dnb.pro.education.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.dnb.pro.education.vo.educationVO;

public interface educationDAO {
	
	public List selectEducationList() throws DataAccessException;
	public educationVO selecteducation(int edu_num) throws DataAccessException;
}
