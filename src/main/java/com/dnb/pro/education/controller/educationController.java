package com.dnb.pro.education.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface educationController {
	public ModelAndView edu_list(HttpServletRequest request, HttpServletResponse response) throws Exception; 
	
}
