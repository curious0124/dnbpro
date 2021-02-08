package com.dnb.pro.equip.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


import com.dnb.pro.equip.vo.EquipVO;




@Repository("EquipDAO")
public class EquipDAOImpl implements  EquipDAO  {

	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllEquipList() throws DataAccessException {
		List<EquipVO> equipList = equipList = sqlSession.selectList("mapper.equip.selectAllEquipList");
		return equipList;
	}
	
	@Override
	public EquipVO selectEquipByCode(String eq_name) throws DataAccessException {
		return sqlSession.selectOne("mapper.equip.EquipDetail", eq_name);
	}
	
	@Override
	public List selectAdminEquipList() throws DataAccessException {
		List<EquipVO> adminequipList = adminequipList = sqlSession.selectList("mapper.equip.selectAdminEquipList");
		return adminequipList;
	}
	
	@Override
	public List selectCatenameList() throws DataAccessException {
		List<EquipVO> cateList = cateList = sqlSession.selectList("mapper.equip.selectCatenameList");
		return cateList;
	}
	
	@Override
	public int insertCatename(String cate_name) throws DataAccessException{
		int result = sqlSession.insert("mapper.equip.insertCatename",cate_name);
		return result;
		
	}
	
	@Override
	public EquipVO selectCateByCode(String cate_name) throws DataAccessException{
		return sqlSession.selectOne("mapper.equip.selectCateByCode",cate_name);
		
	}
	
	@Override
	public void deleteCatename(String cate_name) throws DataAccessException{
		sqlSession.delete("mapper.equip.deleteCatename",cate_name);
		
	}
}
