package com.dnb.pro.cust.controller;

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

import com.dnb.pro.board.vo.ArticleVO;
import com.dnb.pro.cust.service.CustService;
import com.dnb.pro.member.vo.MemberVO;


@Controller("custController")
@RequestMapping(value = "/cust")
public class CustControllerImpl implements CustController{
private static final Logger logger = LoggerFactory.getLogger(CustControllerImpl.class);
	
	private static final String CURR_IMAGE_REPO_PATH = "C:\\board\\article_image";
	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	
	@Autowired
	private CustService custService;
	@Autowired
	private ArticleVO articleVO;
	@Autowired
	private MemberVO memberVO;
	
	@Override
	@RequestMapping(value="/cust_faq.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView cust_faq(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		logger.info("info ����: viewName = "+viewName);
		logger.debug("debug ����: viewName = "+viewName);
		
		List articlesList = custService.listArticles();
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("articlesList",articlesList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/cust_notice.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView cust_notice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		logger.info("info ����: viewName = "+viewName);
		logger.debug("debug ����: viewName = "+viewName);
		
		List articlesNoticeList = custService.listNoticeArticles();
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("articlesNoticeList",articlesNoticeList);
		return mav;
	}
	
	@RequestMapping(value="/viewNoticeArticle.do", method = RequestMethod.GET)
	public ModelAndView viewNoticeArticle(@RequestParam("board_num") int board_num, HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		articleVO = custService.viewNoticeArticle(board_num); 
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("article",articleVO);	
		return mav;
		
	}

}