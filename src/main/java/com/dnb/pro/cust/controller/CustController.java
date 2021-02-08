package com.dnb.pro.cust.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface CustController {
	public ModelAndView cust_faq(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
