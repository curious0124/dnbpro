package com.dnb.pro.equip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import com.dnb.pro.equip.dao.EquipDAO;
import com.dnb.pro.equip.vo.EquipVO;


@Service("equipService")
@Transactional(propagation = Propagation.REQUIRED)
public class EquipServiceImpl implements EquipService{

	@Autowired
	private EquipDAO equipDAO;

	@Override
	public List<EquipVO> listequips() throws Exception {
		List<EquipVO> equipList = equipDAO.selectAllEquipList();
		
		return equipList;
	}
	
	@Override
	public EquipVO viewequip(String eq_name) throws Exception {
		EquipVO equipVO = equipDAO.selectEquipByCode(eq_name);
		return equipVO;
	}
	
	@Override
	public List<EquipVO> adminlistequips() throws Exception {
		List<EquipVO> adminequipList = equipDAO.selectAdminEquipList();
		
		return adminequipList;
	}
	
	
}
