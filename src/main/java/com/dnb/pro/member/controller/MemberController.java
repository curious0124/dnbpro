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
import org.springframework.ui.Model;
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

	@RequestMapping(value = { "/", "/main.do" }, method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/member/addMember.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addMember(@ModelAttribute("vo") MemberVO vo, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		logger.info("post register");
		response.setContentType("html/text;charset=utf-8");
		int result = 0;
		result = service.register(vo);
		ModelAndView mav = new ModelAndView("redirect:/main/main.do");
		return mav;
	}

	@RequestMapping(value = "/member/login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		vo = service.login(member);
		
		
		
		if (vo != null) {
			if(!vo.getUser_auth().equals("블랙리스트")) {
				HttpSession session = request.getSession();
				session.setAttribute("member", vo);
				session.setAttribute("isLogOn", true);
				String action = (String) session.getAttribute("action");
				session.removeAttribute("action");
				
				if (action != null) {
					mav.setViewName("redirect:" + action);
				} else {
					mav.setViewName("redirect:/main/main.do");
				}
				
			}
			else {
				rAttr.addAttribute("result", 2);
				mav.setViewName("redirect:/member/loginForm.do");
			}
			

		} else {
			rAttr.addAttribute("result", 1);
			mav.setViewName("redirect:/member/loginForm.do");
		}
		return mav;
	}

	@RequestMapping(value = "/member/logout.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}

	@RequestMapping(value = "/member/*.do", method = { RequestMethod.GET, RequestMethod.POST })
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

	@RequestMapping(value = "/member/overlapped.do", method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("user_id") String user_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;
		System.out.println(user_id);

		String result = service.overlapped(user_id);
		System.out.println(result);
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	

	/*아이디 찾기*/
	
	@RequestMapping(value = "/member/find_id_form.do")
	public String find_id_form() throws Exception{
		return "/member/find_id_form";
	}
	
	@RequestMapping(value = "/member/find_id.do", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("user_email") String user_email, Model md) throws Exception{
		md.addAttribute("user_id", service.find_id(response, user_email));
		System.out.println("md : " + md);
		return "/member/find_id";
	}
	
	/*비밀번호 찾기*/
	
	@RequestMapping(value = "/member/find_pw_form.do")
	public String find_pw_form() throws Exception{
		return "/member/find_pw_form";
	}
	
	@RequestMapping(value = "/member/find_pw.do", method = RequestMethod.POST)
	public void find_pw(@ModelAttribute MemberVO vo, HttpServletResponse response) throws Exception{
		service.find_pw(response, vo);
	}
	
}