package com.dnb.pro.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dnb.pro.member.vo.MemberVO;
import com.dnb.pro.mypage.service.MyPageService;
import com.dnb.pro.rent.vo.RentVO;


@Controller("myPageController")
@RequestMapping(value="/mypage")
public class MyPageControllerImpl implements MyPageController{

	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private MemberVO memberVO;
	
	@Override
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public ModelAndView myPageMain(String message, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session=request.getSession();
		session=request.getSession();
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		memberVO=(MemberVO)session.getAttribute("member");
		String user_id=memberVO.getUser_id();
	
		
		Map<String, List<RentVO>> myRentList=myPageService.listMyRent(user_id);
		
		mav.addObject("message", message);
		mav.addObject("myRentList", myRentList);

		return mav;
	}
	
	@Override
	@RequestMapping(value = "/myResqDetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView myResqDetail(@RequestParam(required = false, value="user_id") String user_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session=request.getSession();
		MemberVO renter=(MemberVO)session.getAttribute("memberInfo");
		
		 Map<String, List<RentVO>> myRentList= myPageService.findMyResqInfo(user_id);
		 mav.addObject("renter", renter);
		mav.addObject("myRentList", myRentList);

		return mav;
	}
	
	@Override
	@RequestMapping(value = "/myResDetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView myResDetail(@RequestParam(required = false, value="user_id") String user_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session=request.getSession();
		MemberVO renter=(MemberVO)session.getAttribute("memberInfo");
		
		 Map<String, List<RentVO>> myRentList= myPageService.findMyResInfo(user_id);
		 mav.addObject("renter", renter);
		mav.addObject("myRentList", myRentList);

		return mav;
	}

	@Override
	@RequestMapping(value = "/myReturnDetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView myReturnDetail(@RequestParam(required = false, value="user_id") String user_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session=request.getSession();
		MemberVO renter=(MemberVO)session.getAttribute("memberInfo");
		
		 Map<String, List<RentVO>> myRentList= myPageService.findMyReturnInfo(user_id);
		 mav.addObject("renter", renter);
		mav.addObject("myRentList", myRentList);

		return mav;
	}

	@Override
	@RequestMapping(value = "/myLogDetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView myLogDetail(@RequestParam(required = false, value="user_id") String user_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session=request.getSession();
		MemberVO renter=(MemberVO)session.getAttribute("memberInfo");
		
		 Map<String, List<RentVO>> myRentList= myPageService.findMyLogInfo(user_id);
		 mav.addObject("renter", renter);
		mav.addObject("myRentList", myRentList);

		return mav;
	}

	

	@Override
	public ModelAndView cancelMyRent(String order_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView listMyOrderHistory(Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResponseEntity modifyMyInfo(String attribute, String value, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	



	

}
