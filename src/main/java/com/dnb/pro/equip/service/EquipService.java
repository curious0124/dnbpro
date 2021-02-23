package com.dnb.pro.equip.service;

import java.util.List;
import java.util.Map;

import com.dnb.pro.equip.vo.Criteria;
import com.dnb.pro.equip.vo.EquipVO;
import com.dnb.pro.rent.vo.RentVO;




public interface EquipService {

	public List listequips(Criteria cri) throws Exception;
	public int listeqviewpageCount(Criteria cri) throws Exception;
	
	
	public EquipVO viewequip(String eq_name) throws Exception;
	
	public List adminlistequips(Criteria cri) throws Exception;
	public int listserialpageCount(Criteria cri) throws Exception;
	
	public List catelistequips() throws Exception;
	public int addcatename(String cate_name) throws Exception;
	public EquipVO viewecatename(String cate_name) throws Exception;
	public void deleteCatename(EquipVO equipVO) throws Exception;
	public List eqnamelistequips() throws Exception;
	public EquipVO vieweqname() throws Exception;
//	public int addeqname(EquipVO equipVO) throws Exception;
	public int addserialname(EquipVO equipVO) throws Exception;
	public List eqnamelistserial() throws Exception;
	public void deleteEqname(EquipVO equipVO) throws Exception;
	public void deleteEqserial(EquipVO equipVO) throws Exception;
	public void modSerialState(Map statemap) throws Exception;
	public EquipVO selectSerialById(String eq_serial) throws Exception;

	
	public void addeqname(Map eqnamemap) throws Exception;

//	public List statelistequips() throws Exception;
//	public EquipVO selectonecatename(String cate_name) throws Exception;
//	EquipVO vieweqname(String cate_name) throws Exception;
	public List seletAbleEquipment(Map<String, Object> selectElement);
	
	//선택한 장비와 수량의 이용가능한 시리얼을 가져온다.
	public List selectAbleSerial(RentVO rentVO) throws Exception;

}
