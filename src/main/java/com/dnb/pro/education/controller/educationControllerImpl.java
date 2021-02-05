package com.dnb.pro.education.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dnb.pro.education.service.educationService;
import com.dnb.pro.education.vo.educationVO;

@Controller("educationController")
@RequestMapping(value = "/education")
public class educationControllerImpl implements educationController {
	private static final Logger logger = LoggerFactory.getLogger(educationControllerImpl.class);

	@Autowired
	private educationService educationService;
	@Autowired
	private educationVO educationVO;

	@Override
	@RequestMapping(value = "/edu_list.do", method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView edu_list(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		logger.info("info 레벨: viewName = "+viewName);
		logger.debug("debug 레벨: viewName = "+viewName);
		
		List educationList = educationService.listeducation();	
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("educationList",educationList);
		return mav;
}
	
	@RequestMapping(value="/edu_detail.do" ,method = RequestMethod.GET)
	public ModelAndView vieweducation(@RequestParam("educationNO") int educationNO,
                                    HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		educationVO=educationService.vieweducation(educationNO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("educationVO", educationVO);
		return mav;
	}
//	
//	@RequestMapping(value = "/edu_detail.do", method = { RequestMethod.GET, RequestMethod.POST})
//	public ModelAndView edu_detail(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		String viewName = (String)request.getAttribute("viewName");
//		logger.info("info 레벨: viewName = "+viewName);
//		logger.debug("debug 레벨: viewName = "+viewName);
//		
//		List educationList = educationService.listeducation();	
//		
//		ModelAndView mav = new ModelAndView(viewName);
//		mav.addObject("educationList",educationList);
//		return mav;
//}

}
