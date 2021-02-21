package com.dnb.pro.banner.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dnb.pro.banner.service.BannerService;
import com.dnb.pro.banner.vo.BannerVO;


@Controller("BannerController")
@RequestMapping(value = "/banner")
public class BannerControllerImpl implements BannerController{
	
	@Autowired
	private BannerService BannerService;
	
	@RequestMapping(value="/banner.do", method = RequestMethod.GET)
	public ModelAndView banner(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.setViewName(viewName);
		
		List bannerList = BannerService.selectBannerImage();
		System.out.println("¿Ü¾ÊµÇ" + bannerList);
		mav.addObject("bannerList",bannerList);
		return mav;
		
	}
}
