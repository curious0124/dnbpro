package com.dnb.pro.rent.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dnb.pro.rent.vo.Criteria;
import com.dnb.pro.rent.vo.SearchCriteria;



public interface RentController {

	
	
	public ModelAndView listlogs(SearchCriteria scri, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView listresqs(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView listres(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listrent(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView listreturn(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView AuthRes(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView CancleResq(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity ResStateupdate(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;
	
	
	
	public ModelAndView CancleRes(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView ReturnRenting(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView ReturnExpressAuth(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
