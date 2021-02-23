package com.dnb.pro.cust.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.dnb.pro.board.vo.Criteria;

public interface CustController {
	public ModelAndView cust_faq(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView cust_notice(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
