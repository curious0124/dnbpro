package com.dnb.pro.equip.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.dnb.pro.equip.vo.Criteria;
import com.dnb.pro.equip.vo.EquipVO;
import com.dnb.pro.equip.vo.SearchCriteria;
import com.dnb.pro.rent.vo.RentVO;



public interface EquipDAO {

	
	public List selectAllEquipList(SearchCriteria scri) throws DataAccessException;
	public int listEquipCount(SearchCriteria scri) throws Exception;
	
	public EquipVO selectEquipByCode(String eq_name) throws DataAccessException;
	
	public List selectAdminEquipList(SearchCriteria scri) throws DataAccessException;
	public int listSerialCount(SearchCriteria scri) throws Exception;
	
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
	
//	선택한 장비와 수량의 이용가능한 시리얼을 가져온다.
	public List selectAbleSerial(RentVO rentVO) throws DataAccessException;

}
