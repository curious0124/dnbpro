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
	
	public List selectEqnameList() throws DataAccessException;
	public EquipVO selectEqnameByCode() throws DataAccessException;
//	public int insertEquiplist(EquipVO equipVO) throws DataAccessException;
	public EquipVO selectCateByCode2(String cate_name) throws DataAccessException;
	public int insertSeriallist(EquipVO equipVO) throws DataAccessException;
	
	public List selectonlyEqnameList() throws DataAccessException;

	
	
	public void deleteCatename(EquipVO equipVO) throws DataAccessException;
	public void deleteEqname(EquipVO equipVO) throws DataAccessException;
	public void deleteEqserial(EquipVO equipVO) throws DataAccessException;
	
	public void updateSerialState(Map statemap) throws DataAccessException;

	public EquipVO selectSerialById(String eq_serial) throws DataAccessException;


	
	public void insertEquiplist(Map eqnamemap) throws DataAccessException;

//	public List selectStateList() throws DataAccessException;
	public List selectAbleEquipment(Map<String, Object> selectElement);

}
