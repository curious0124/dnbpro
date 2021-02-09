package com.dnb.pro.center.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dnb.pro.board.vo.ArticleVO;
import com.dnb.pro.center.service.CenterService;

@Controller("centerController")
@RequestMapping(value="/center")
public class CenterControllerImpl implements CenterController {
	
	@Autowired
	private CenterService centerService;
	
	@Autowired
	private ArticleVO articleVO;
	
	@Override
	@RequestMapping(value="/center.do", method = RequestMethod.GET)
	public ModelAndView centerPage(@RequestParam(value="brd_num", required = false) String brd_num,HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		String viewName=(String)request.getAttribute("viewName");
		Map<String, List<ArticleVO>> centerList = centerService.listCenter(brd_num);
		ModelAndView mav = new ModelAndView();
	    mav.setViewName(viewName);
		mav.addObject("centerList", centerList);
		
		return mav;
		
	}
	
	
}
