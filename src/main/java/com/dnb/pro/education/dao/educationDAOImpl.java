package com.dnb.pro.education.dao;

import java.util.ArrayList;
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
	@Override
	public educationVO selecteducation(int edu_num) throws DataAccessException {
		return sqlSession.selectOne("mapper.education.educationdetail", edu_num);
	}

	@Override
	public List eduCateNameList() throws DataAccessException {
		List<educationVO> eduCateNameList = sqlSession.selectList("mapper.education.eduCateNameList");
		return eduCateNameList;
	}

	@Override
	public ArrayList selectByCateName(String cate_name) throws DataAccessException {
		ArrayList list = (ArrayList)sqlSession.selectList("mapper.education.selectByCateName", cate_name);
		return list;
	}
}
