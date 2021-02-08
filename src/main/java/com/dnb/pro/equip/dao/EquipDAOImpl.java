package com.dnb.pro.equip.dao;

import java.util.List;

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
	
}
