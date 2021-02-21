package com.dnb.pro.banner.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface BannerController {

	public ModelAndView banner(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
