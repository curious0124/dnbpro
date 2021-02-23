package com.dnb.pro.education.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dnb.pro.education.vo.Criteria;
import com.dnb.pro.education.vo.SearchCriteria;

public interface educationController {
	public ModelAndView edu_list(SearchCriteria scri, HttpServletRequest request, HttpServletResponse response) throws Exception; //±³À°
	public ModelAndView vieweducation(@RequestParam("educationNO") int educationNO,
            HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView edu_admin_list(SearchCriteria scri, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addNeweducaion(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception; 

//	public ModelAndView edu_cate_list(SearchCriteria scri, @RequestParam("cate_name") String cate_name, HttpServletRequest request, HttpServletResponse response) throws Exception; 
}
