package com.dnb.pro.center.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface CenterController {
	public ModelAndView centerPage(String brd_num,HttpServletRequest request, HttpServletResponse response) throws Exception;
}
