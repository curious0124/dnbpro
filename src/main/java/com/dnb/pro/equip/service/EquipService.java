package com.dnb.pro.equip.service;

import java.util.List;
import java.util.Map;

import com.dnb.pro.equip.vo.EquipVO;



public interface EquipService {

	public List listequips() throws Exception;
	public EquipVO viewequip(String eq_name) throws Exception;
	public List adminlistequips() throws Exception;
	public List catelistequips() throws Exception;
	public int addcatename(String cate_name) throws Exception;
	public EquipVO viewecatename(String cate_name) throws Exception;
	public void deleteCatename(EquipVO equipVO) throws Exception;
	public List eqnamelistequips() throws Exception;
	public EquipVO vieweqname() throws Exception;
	public int addeqname(EquipVO equipVO) throws Exception;
	public int addserialname(EquipVO equipVO) throws Exception;
	public List eqnamelistserial() throws Exception;
	public void deleteEqname(EquipVO equipVO) throws Exception;
	public void deleteEqserial(EquipVO equipVO) throws Exception;
	public void modSerialState(Map statemap) throws Exception;
	public EquipVO selectSerialById(String eq_serial) throws Exception;
//	public List statelistequips() throws Exception;
//	public EquipVO selectonecatename(String cate_name) throws Exception;
//	EquipVO vieweqname(String cate_name) throws Exception;
}
