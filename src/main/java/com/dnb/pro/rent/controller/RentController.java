package com.dnb.pro.rent.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface RentController {

	
	
	public ModelAndView listlogs(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView listresqs(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView listres(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listrent(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView listreturn(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView AuthRes(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView CancleResq(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity ResStateupdate(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;
	
	
	
	public ModelAndView CancleRes(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
