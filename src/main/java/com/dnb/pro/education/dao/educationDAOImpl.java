package com.dnb.pro.education.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dnb.pro.education.vo.educationVO;




@Repository("educationDAO")
public class educationDAOImpl implements educationDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectEducationList() throws DataAccessException {
		List<educationVO> educationList = sqlSession.selectList("mapper.education.selectEducationList");
		return educationList;
	}
	}

//import java.util.List;
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.dnb.pro.education.vo.educationVO;
//@Service("educationDAO")
//public class educationDAOImpl implements educationDAO{
//	
//	@Autowired
//	private SqlSession sqlSession;
//
//	@Override
//	public List<educationVO> selectEducationList(educationVO educationVO) throws Exception {
//		List<educationVO> educationList=(List)sqlSession.selectList("mappers.education.selectEducationList",educationVO);
//		return educationList;
//	}
//
//	@Override
//	public educationVO selecteducationByCode(educationVO educationVO) throws Exception {
//		List<educationVO> educationnum=(List)sqlSession.selectList("mappers.education.selectEducationList",educationVO);
//		return null;
//	}
//
//}
