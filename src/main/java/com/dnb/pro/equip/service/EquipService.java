package com.dnb.pro.equip.service;

import java.util.List;

import com.dnb.pro.equip.vo.EquipVO;



public interface EquipService {

	public List listequips() throws Exception;
	public EquipVO viewequip(String eq_name) throws Exception;
	public List adminlistequips() throws Exception;
	public List catelistequips() throws Exception;
	public int addcatename(String cate_name) throws Exception;
	public EquipVO viewecatename(String cate_name) throws Exception;
	public void removecatename(String cate_name) throws Exception;
}
