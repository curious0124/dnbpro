package com.dnb.pro.equip.service;

import java.util.List;

import com.dnb.pro.equip.vo.EquipVO;



public interface EquipService {

	public List listequips() throws Exception;
	public EquipVO viewequip(String eq_name) throws Exception;
	public List adminlistequips() throws Exception;
}
