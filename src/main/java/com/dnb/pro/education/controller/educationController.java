package com.dnb.pro.education.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface educationController {
	public ModelAndView edu_list(HttpServletRequest request, HttpServletResponse response) throws Exception; 
	public ModelAndView vieweducation(@RequestParam("educationNO") int educationNO,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
}
