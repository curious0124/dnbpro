package com.dnb.pro.equip.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.dnb.pro.equip.vo.EquipVO;

public interface EquipDAO {

	
	public List selectAllEquipList() throws DataAccessException;
	public EquipVO selectEquipByCode(String eq_name) throws DataAccessException;
}
