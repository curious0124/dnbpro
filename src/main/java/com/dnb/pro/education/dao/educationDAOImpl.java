package com.dnb.pro.education.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


import com.dnb.pro.education.vo.Criteria;
import com.dnb.pro.education.vo.SearchCriteria;
import com.dnb.pro.education.vo.educationVO;



@Repository("educationDAO")
public class educationDAOImpl implements educationDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectEducationList(SearchCriteria scri) throws DataAccessException { //���� ��ü ����Ʈ
		List<educationVO> educationList = sqlSession.selectList("mapper.education.selectEducationList",scri);
		return educationList;
	}
	@Override
	public int listeduCount(SearchCriteria scri) throws Exception { //���� ��ü ī��Ʈ
		return sqlSession.selectOne("mapper.education.listeduCount", scri);
	}
	
//	@Override
//	public ArrayList selectByCateName(SearchCriteria scri, String cate_name) throws DataAccessException { //���� ī�װ��� ����Ʈ
//		ArrayList list = (ArrayList)sqlSession.selectMap("mapper.education.selectByCateName", scri, cate_name);
//		return list;
//	}
//	@Override
//	public int listCateEduCount(SearchCriteria scri) throws DataAccessException { // ���� ī�װ��� ī��Ʈ
//		return sqlSession.selectOne("mapper.education.listCateEduCount", scri);
//	}
	
	@Override
	public educationVO selecteducation(int edu_num) throws DataAccessException {
		return sqlSession.selectOne("mapper.education.educationdetail", edu_num);
	}
	
	@Override
	public int insertNeweducation(Map educationMap) throws DataAccessException {
		int educationNO = selectNeweducationNO();	//�� �ۿ� ���� �۹�ȣ�� �����ɴϴ�.
		System.out.println("DAO : "+educationMap);                                                                                                                                                                                                                                      
		sqlSession.insert("mapper.education.insertNeweducation",educationMap);
		return educationNO;
	}
	private int selectNeweducationNO() throws DataAccessException{
		return sqlSession.selectOne("mapper.education.selectNeweducationNO");
	}
	@Override
	public void updateeducation(Map educationMap) throws DataAccessException {
		System.out.println("educationMap"+educationMap);
		String img = (String) educationMap.get("edu_thuming");
		if(img != null && img.length() != 0) {
			sqlSession.update("mapper.education.updateeducationNewimg",educationMap);
		}
		sqlSession.update("mapper.education.updateeducation",educationMap);
		
	}

	@Override
	public void deleteeducation(educationVO educationVO) throws DataAccessException {
		sqlSession.update("mapper.education.deleteeducation",educationVO);
	}
		
		

//	@Override
//	public List eduCateNameList() throws DataAccessException { //���� ī�װ� ����
//		List<educationVO> eduCateNameList = sqlSession.selectList("mapper.education.eduCateNameList");
//		return eduCateNameList;
//	}
	

	
}
