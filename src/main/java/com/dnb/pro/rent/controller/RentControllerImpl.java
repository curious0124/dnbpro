package com.dnb.pro.rent.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.dnb.pro.rent.service.RentService;
import com.dnb.pro.rent.vo.RentVO;



@Controller("rentController")
@RequestMapping(value="/rent")
	public class RentControllerImpl implements RentController {

	
	 private static final String ARTICLE_IMAGE_REPO = "C:\\rent\\article_imagefile";
		private static final Logger logger = LoggerFactory.getLogger(RentControllerImpl.class);
	   @Autowired
		private RentService rentService;
		@Autowired
		private RentVO rentVO;
		
		
		@Override
		@RequestMapping(value="/listlogs.do" ,method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView listlogs(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = (String)request.getAttribute("viewName");
			
			
			logger.info("info 레벨: viewName = "+viewName);
			logger.debug("debug 레벨: viewName = "+viewName);
			
			
			List logList = rentService.listlogs();
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("logList", logList);
			return mav;
		}
		
	
		

	
}
