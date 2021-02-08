package com.dnb.pro.member.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dnb.pro.member.service.MemberService;
import com.dnb.pro.member.vo.MemberVO;



@Controller
@RequestMapping
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	@Inject
	MemberVO vo;
	
	
	@RequestMapping(value = { "/", "/main.do" }, method = {RequestMethod.GET ,RequestMethod.POST})
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	
//	@RequestMapping(value = "/member/listMembers.do", method = {RequestMethod.GET ,RequestMethod.POST})
//	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		request.setCharacterEncoding("utf-8");
//		response.setContentType("html/text;charset=utf-8");
//		String viewName = (String) request.getAttribute("viewName");
//		List membersList = service.listMembers();
//		ModelAndView mav = new ModelAndView(viewName);
//		mav.addObject("membersList", membersList);
//		return mav;
//	}
	
	/* GET 회원가입 ??*/
//	@RequestMapping(value = "/member/register", method = RequestMethod.GET)
//	public void getRegister(MemberVO vo) throws Exception {
//		logger.info("get register");
//	}
	
	/* POST 회원가입 ??*/
//	@RequestMapping(value = "/member/addmember.do", method = {RequestMethod.GET, RequestMethod.POST})
//	public ModelAndView postRegister(MemberVO vo) throws Exception {
//		logger.info("post register");
//		
//		service.register(vo);
//		ModelAndView mav = new ModelAndView("redirect:/main/main.do");
//		return mav;
//	}
//	
	
	
	@RequestMapping(value="/member/addMember.do" ,method = {RequestMethod.GET ,RequestMethod.POST})
	public ModelAndView addMember(@ModelAttribute("vo") MemberVO vo,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		logger.info("post register");
		response.setContentType("html/text;charset=utf-8");
		int result = 0;
		result = service.register(vo);
		ModelAndView mav = new ModelAndView("redirect:/main/main.do");
		return mav;
	}
	
	
	@RequestMapping(value = "/member/login.do", method = {RequestMethod.GET ,RequestMethod.POST})
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		vo = service.login(member);
		if (vo != null) {
			
				HttpSession session = request.getSession();
				session.setAttribute("member", vo);
				session.setAttribute("isLogOn", true);
				// mav.setViewName("redirect:/member/listMembers.do");
				String action = (String) session.getAttribute("action");
				session.removeAttribute("action");
				if (action != null) {
					mav.setViewName("redirect:" + action);
				} else {
					mav.setViewName("redirect:/main/main.do");
				}
			

		} else {
			rAttr.addAttribute("result", "loginFailed");
			mav.setViewName("redirect:/member/loginForm.do");
		}
		return mav;
	}
	
	@RequestMapping(value = "/member/logout.do", method = {RequestMethod.GET ,RequestMethod.POST})
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}
	
	@RequestMapping(value = "/member/*.do", method = {RequestMethod.GET ,RequestMethod.POST})
	private ModelAndView form(@RequestParam(value = "result", required = false) String result,
			@RequestParam(value = "action", required = false) String action, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName(viewName);
		return mav;
	}

	/* 중복확인 */

	@RequestMapping(value="/member/overlapped.do" ,method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("user_id") String user_id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		System.out.println(user_id);
		
		String result = service.overlapped(user_id);
		System.out.println(result);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
}