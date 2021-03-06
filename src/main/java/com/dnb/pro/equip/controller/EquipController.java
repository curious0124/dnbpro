package com.dnb.pro.equip.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dnb.pro.equip.vo.Criteria;
import com.dnb.pro.equip.vo.EquipVO;
import com.dnb.pro.equip.vo.SearchCriteria;

public interface EquipController {

	
	public ModelAndView listequips(SearchCriteria scri,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listcatename(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	public ModelAndView adminlistequips(SearchCriteria scri, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView catelistequips(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	
	public ModelAndView viewecatename(@RequestParam("cate_name") String cate_name,  HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addcatename(String cate_name, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	
	
	public ModelAndView eqnamelistequips(SearchCriteria scri, HttpServletRequest request, HttpServletResponse response) throws Exception;

//	public ResponseEntity addeqname(EquipVO equipVO, HttpServletRequest request, HttpServletResponse response)
//			throws Exception;
	
	public ResponseEntity addserialname(EquipVO equipVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ModelAndView eqnamelistserial( String eq_name, HttpServletRequest request, HttpServletResponse response) throws Exception;
	


	public ModelAndView modserialForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity modSerialState(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;
	

	public ResponseEntity addeqname(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;
	
}
