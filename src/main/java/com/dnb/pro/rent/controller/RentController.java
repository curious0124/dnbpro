package com.dnb.pro.rent.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface RentController {

	
	
	public ModelAndView listlogs(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView listresqs(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
