package com.dnb.pro.mem_manage.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.directory.InvalidAttributeIdentifierException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dnb.pro.mem_manage.vo.Criteria;
import com.dnb.pro.mem_manage.vo.PageMaker;
import com.dnb.pro.mem_manage.vo.SearchCriteria;
import com.dnb.pro.board.vo.ArticleVO;
import com.dnb.pro.mem_manage.controller.mem_manageController;
import com.dnb.pro.mem_manage.service.mem_manageService;
import com.dnb.pro.member.vo.MemberVO;

@Controller("mem_manageController")
@RequestMapping(value = "/mem_manage")
public class mem_manageControllerImpl implements mem_manageController{
	private static final Logger logger = LoggerFactory.getLogger(mem_manageControllerImpl.class);
	@Autowired
	private mem_manageService service;
	@Autowired
	private MemberVO vo;
	
	@Override
	@RequestMapping(value = "/mem_list.do", method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView mem_List(SearchCriteria scri, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		logger.info("info 레벨: viewName = "+viewName);
		logger.debug("debug 레벨: viewName = "+viewName);
		
		ModelAndView mav = new ModelAndView(viewName);
		
		List listMembers = service.listMembers(scri);
		mav.addObject("listMembers",listMembers);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listMemCount(scri));
		mav.addObject("pageMaker", pageMaker);

		
		return mav;
	}
	

	@RequestMapping(value="/modMemAuth.do", method = {RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity modMemAuth(@RequestParam(value = "chbox[]", required=false) List<String> memAuthArr ,@RequestParam(value = "memAuth", required=false) String memAuth, MemberVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
				
		String message = null;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		int result = 0;
		String arrMemId = null;
		for(String i : memAuthArr) {
			arrMemId = i;
			vo.setUser_id(arrMemId);
			vo.setUser_auth(memAuth);
			service.modMem_auth(vo);
		}
		
		//업데이트후 메시지를 전달합니다.
		message = "<script>";
		message += " alert('회원 권한을 수정하셨습니다.');";
		message += " </script>";
		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		return resEnt;
		
	}




}
