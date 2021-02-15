package com.dnb.pro.equip.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dnb.pro.equip.vo.EquipVO;

public interface EquipController {

	
	public ModelAndView listequips(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewequip(@RequestParam("eq_name") String eq_name, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView adminlistequips(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView catelistequips(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView viewecatename(@RequestParam("cate_name") String cate_name,  HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addcatename(String cate_name, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
//	public ResponseEntity delete_catename(String cate_name, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	public ModelAndView eqnamelistequips(HttpServletRequest request, HttpServletResponse response) throws Exception;
//	public ModelAndView vieweqname(@RequestParam("cate_name") String cate_name,  HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addeqname(EquipVO equipVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	
	public ResponseEntity addserialname(EquipVO equipVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ModelAndView eqnamelistserial( String eq_name, HttpServletRequest request, HttpServletResponse response) throws Exception;

}
