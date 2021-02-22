package com.dnb.pro.equip.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import com.dnb.pro.equip.dao.EquipDAO;
import com.dnb.pro.equip.vo.Criteria;
import com.dnb.pro.equip.vo.EquipVO;



@Service("equipService")
@Transactional(propagation = Propagation.REQUIRED)
public class EquipServiceImpl implements EquipService{

	@Autowired
	private EquipDAO equipDAO;

	
	@Override
	public List<EquipVO> listequips(Criteria cri) throws Exception {
//		List<EquipVO> equipList = equipDAO.selectAllEquipList(cri);
		
		return equipDAO.selectAllEquipList(cri);
	}
	
	@Override
	public int listeqviewpageCount(Criteria cri) throws Exception {
		return equipDAO.listEquipCount(cri);
	}

	
	@Override
	public EquipVO viewequip(String eq_name) throws Exception {
		EquipVO equipVO = equipDAO.selectEquipByCode(eq_name);
		return equipVO;
	}
	
	@Override
	public List<EquipVO> adminlistequips(Criteria cri) throws Exception {
//		List<EquipVO> adminequipList = equipDAO.selectAdminEquipList(cri);
		
		return equipDAO.selectAdminEquipList(cri);
	}
	
	@Override
	public int listserialpageCount(Criteria cri) throws Exception {
		return equipDAO.listEquipCount(cri);
	}
	
	// 분류명가져오기
	@Override
	public List<EquipVO> catelistequips() throws Exception {
		List<EquipVO> cateList = equipDAO.selectCatenameList();
		
		return cateList;
	}
	
	@Override
	public int addcatename(String cate_name) throws Exception {
		int result = equipDAO.insertCatename(cate_name);
		return result;
		

	}
	
	@Override
	public EquipVO viewecatename(String cate_name) throws Exception {
		EquipVO equipVO = equipDAO.selectCateByCode(cate_name);
		return equipVO;
	}
	@Override
	public void deleteCatename(EquipVO equipVO) throws Exception{
		equipDAO.deleteCatename(equipVO);
	
		
	}
	
	@Override
	public List<EquipVO> eqnamelistequips() throws Exception {
		List<EquipVO> eqnameList = equipDAO.selectEqnameList();
		
		return eqnameList;
	}
	
	@Override
	public EquipVO vieweqname() throws Exception {
		EquipVO equipVO = equipDAO.selectEqnameByCode();
		return equipVO;
	}
	
//	@Override
//	public int addeqname(EquipVO equipVO) throws Exception {
//		int result = equipDAO.insertEquiplist(equipVO);
//		return result;
//		
//
//	}
	
	
	@Override
	public int addserialname(EquipVO equipVO) throws Exception {
		int result = equipDAO.insertSeriallist(equipVO);
		return result;
		

	}
	
	
	@Override
	public List<EquipVO> eqnamelistserial() throws Exception {
		List<EquipVO> eqnameonlyList = equipDAO.selectonlyEqnameList();
		
		return eqnameonlyList;
	}
	
	@Override
	public void deleteEqname(EquipVO equipVO) throws Exception{
		equipDAO.deleteEqname(equipVO);
	
		
	}
	
	@Override
	public void deleteEqserial(EquipVO equipVO) throws Exception{
		equipDAO.deleteEqserial(equipVO);
	
		
	}
	
	@Override
	public void modSerialState(Map statemap) throws Exception{
		System.out.println(statemap);
		 equipDAO.updateSerialState(statemap);
		
		
	}
	 
	 @Override
		public EquipVO selectSerialById(String eq_serial) throws DataAccessException {
		 EquipVO equipVO = equipDAO.selectSerialById(eq_serial);
		 return equipVO;
			
		
			
		}

	@Override
	public List seletAbleEquipment(Map<String, Object> selectElement) {
		List ableEquipment = equipDAO.selectAbleEquipment(selectElement);
		return ableEquipment;
	}
	 
	 

	 @Override
		public void addeqname(Map eqnamemap) throws Exception {
			 equipDAO.insertEquiplist(eqnamemap);

			
	
		}
	
}
