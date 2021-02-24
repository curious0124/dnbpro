package com.dnb.pro.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dnb.pro.banner.service.BannerService;
import com.dnb.pro.cust.service.CustService;



@Controller("mainController")
@EnableAspectJAutoProxy
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private CustService custService;
	// ±‘∫¿¿€æ˜
	@Autowired
	private BannerService BannerService;
	//
	
	@RequestMapping(value = "/main/main.do", method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		List articlesNoticeList = custService.listNoticeArticles2();
		//±‘∫¿
		List bannerList = BannerService.selectBannerImage();
		mav.addObject("bannerList",bannerList);
		
		System.out.println("»Æ¿Œ "+articlesNoticeList);
		mav.addObject("articlesNoticeList",articlesNoticeList);
		return mav;
	}
	@RequestMapping(value = "/main/test.do", method = RequestMethod.GET)
	public ModelAndView test(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
}
