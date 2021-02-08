package com.dnb.pro.equip.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.dnb.pro.equip.vo.EquipVO;

public interface EquipDAO {

	
	public List selectAllEquipList() throws DataAccessException;
	public EquipVO selectEquipByCode(String eq_name) throws DataAccessException;
	public List selectAdminEquipList() throws DataAccessException;
	public List selectCatenameList() throws DataAccessException;
	public int insertCatename(String cate_name) throws DataAccessException;
	public EquipVO selectCateByCode(String cate_name) throws DataAccessException;
	public void deleteCatename(String cate_name) throws DataAccessException;
//	public List selecAmount(int) throws DataAccessException;
	
}
