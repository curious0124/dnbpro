package com.dnb.pro.mem_manage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.ModelAndView;

import com.dnb.pro.mem_manage.vo.Criteria;
import com.dnb.pro.mem_manage.vo.SearchCriteria;

public interface mem_manageController {
	public ModelAndView mem_List(SearchCriteria scri, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
}
