package com.dnb.pro.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dnb.pro.board.service.BoardService;
import com.dnb.pro.board.vo.ArticleVO;

@Controller("boardController")
@RequestMapping(value="/board")
public class BoardControllerImpl implements BoardController {
private static final Logger logger = LoggerFactory.getLogger(BoardControllerImpl.class);
	
	private static final String CURR_IMAGE_REPO_PATH = "C:\\board\\article_image";
	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private ArticleVO articleVO;
	

	@RequestMapping(value = "/test2.do", method = {RequestMethod.GET, RequestMethod.POST})


	

	public ModelAndView test2(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	@RequestMapping(value = "/admin_index.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView admin_index(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	@Override
	@RequestMapping(value="/admin_board_list.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView admin_board_list(@RequestParam("brd_num") int brd_num, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		logger.info("info ����: viewName = "+viewName);
		logger.debug("debug ����: viewName = "+viewName);
		
		List articlesList = boardService.listArticles(brd_num);	
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("articlesList",articlesList);
		return mav;

	}
	
	@RequestMapping(value = "/admin_board_articleForm.do", method = RequestMethod.GET)
	public ModelAndView admin_board_articleForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/viewArticle.do", method = RequestMethod.GET)
	public ModelAndView viewArticle(@RequestParam("board_num") int board_num, //��ȸ�� �� ��ȣ ��������
									HttpServletRequest request,
									HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		articleVO = boardService.viewArticle(board_num); 	//��ȸ�� �� ������ articleVO�� �����Ѵ�.
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("article",articleVO);		
		return mav;
	}
	
	
//	@Override
//	@RequestMapping(value="/addNewArticle.do" ,method = {RequestMethod.POST,RequestMethod.GET})
//	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest,
//			HttpServletResponse response) throws Exception{
//multipartRequest.setCharacterEncoding("utf-8");
//
//		int result = 0;
//		result = boardService.addNewArticle(article);
//		ModelAndView mav = new ModelAndView("redirect:/board/admin_board_list.do?brd_name="+article.getBrd_name());
//		return mav;
//	}
	
	
	
}
