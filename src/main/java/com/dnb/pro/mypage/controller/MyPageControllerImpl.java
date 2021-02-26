package com.dnb.pro.mypage.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dnb.pro.member.vo.MemberVO;
import com.dnb.pro.mypage.service.MyPageService;
import com.dnb.pro.mypage.vo.Criteria;
import com.dnb.pro.mypage.vo.MyPageVO;
import com.dnb.pro.mypage.vo.PageMaker;
import com.dnb.pro.rent.vo.RentVO;


@Controller("myPageController")
@RequestMapping(value="/mypage")
public class MyPageControllerImpl implements MyPageController{

	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private MemberVO memberVO;
	
	@Autowired
	private RentVO rentVO;
	
	@Autowired
	private MyPageVO mypageVO;
	
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
	public ModelAndView myResqDetail(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session=request.getSession();
		MemberVO renter=(MemberVO)session.getAttribute("member");
		
		String user_id= renter.getUser_id();
		
		 Map<String, List<RentVO>> myRentList= myPageService.findMyResqInfo(user_id);
		 mav.addObject("renter", renter);
		mav.addObject("myRentList", myRentList);

		return mav;
	}
	
	@Override
	@RequestMapping(value = "/myResDetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView myResDetail( HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session=request.getSession();
		MemberVO renter=(MemberVO)session.getAttribute("member");
		
		String user_id= renter.getUser_id();
		
		 Map<String, List<RentVO>> myRentList= myPageService.findMyResInfo(user_id);
		 mav.addObject("renter", renter);
		mav.addObject("myRentList", myRentList);

		return mav;
	}

	@Override
	@RequestMapping(value = "/myReturnDetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView myReturnDetail(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session=request.getSession();
		MemberVO renter=(MemberVO)session.getAttribute("member");
		
		String user_id= renter.getUser_id();
		
		 Map<String, List<RentVO>> myRentList= myPageService.findMyReturnInfo(user_id);
		 mav.addObject("renter", renter);
		mav.addObject("myRentList", myRentList);

		return mav;
	}

	@Override
	@RequestMapping(value = "/myLogDetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView myLogDetail(Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session=request.getSession();
		MemberVO renter=(MemberVO)session.getAttribute("member");
		
		String user_id= renter.getUser_id();
		
		Map<String, List<RentVO>> myRentList= myPageService.findMyLogInfo(cri);
		mav.addObject("renter", renter);
		mav.addObject("myRentList", myRentList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myPageService.listCount(cri.getUser_id()));
		mav.addObject("pageMaker", pageMaker);

		return mav;
	}

	@Override
	@RequestMapping(value="/cancelResq.do" ,method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView cancelResq(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		String user_id = member.getUser_id();
		String cate_name = request.getParameter("ResqCate");
		int resq_num =Integer.parseInt(request.getParameter("Resqnum"));
		
		rentVO.setUser_id(user_id);
		rentVO.setCate_name(cate_name);
		rentVO.setResq_num(resq_num);
		
		ModelAndView mav = new ModelAndView();
		myPageService.cancelResq(rentVO);
		
		mav.addObject("message", "cancel_resq");
		mav.setViewName("redirect:/mypage/mypage.do");
		
		return mav;
		
	}

	@Override
	@RequestMapping(value="/cancelRes.do" ,method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView cancelRes(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		String user_id = member.getUser_id();
		String cate_name = request.getParameter("ResCate");
		int res_num =Integer.parseInt(request.getParameter("Resnum"));
		
		rentVO.setUser_id(user_id);
		rentVO.setCate_name(cate_name);
		rentVO.setRes_num(res_num);
		
		System.out.println(rentVO.getUser_id());
		
		ModelAndView mav = new ModelAndView();
		myPageService.cancelRes(rentVO);
		
		mav.addObject("message", "cancel_res");
		mav.setViewName("redirect:/mypage/mypage.do");
		
		return mav;
	}

	@Override
	@RequestMapping(value="/cancelReturn.do" ,method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView cancelReturn(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		String user_id = member.getUser_id();
		String cate_name = request.getParameter("ReturnCate");
		int res_num =Integer.parseInt(request.getParameter("Returnnum"));
		String express_num = request.getParameter("Expressnum");
		
		rentVO.setUser_id(user_id);
		rentVO.setCate_name(cate_name);
		rentVO.setRes_num(res_num);
		rentVO.setExpress_num(express_num);
		
		System.out.println(rentVO.getUser_id());
		System.out.println(rentVO.getExpress_num());
		
		ModelAndView mav = new ModelAndView();
		myPageService.cancelReturn(rentVO);
		
		mav.addObject("message", "cancel_res");
		mav.setViewName("redirect:/mypage/mypage.do");
		
		return mav;
	}


	
	
	@Override
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/modmemberForm.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView modmemberForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		memberVO=(MemberVO)session.getAttribute("member");
		String user_id=memberVO.getUser_id();
		String viewName=(String)request.getAttribute("viewName");
		
		MemberVO memberVO = myPageService.selectMemberById(user_id);
		request.setAttribute("member", memberVO);
		
		if(memberVO.getUser_identity() != null && memberVO.getUser_identity().length() != 0) {
			String identity = memberVO.getUser_identity();
			identity = identity.replace(",", "-");
			memberVO.setUser_identity(identity);
		}
		
		if(memberVO.getUser_addr() != null && memberVO.getUser_addr().length() != 0) {
			String addr = memberVO.getUser_addr();
			addr = addr.replace(",", " ");
			memberVO.setUser_addr(addr);
		}
		
		if(memberVO.getUser_fax() != null && memberVO.getUser_fax().length() != 0) {
			String fax = memberVO.getUser_fax();
			fax = fax.replace(",,", " ");
			fax = fax.replace(",", "-");
			memberVO.setUser_fax(fax);
		}
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("member", memberVO);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/modMember.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView modMember(@ModelAttribute("member") MemberVO member,HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		System.out.println("확인  : "+member.getUser_id()+",   "+member.getUser_pwd());
//		MemberVO memberVO = new MemberVO();
//		bind(request, memberVO);
		int result = 0;
		result = myPageService.modMember(member);
		
		ModelAndView mav = new ModelAndView("redirect:/mypage/mypage.do");
		return mav;
		
	}
	
	@Override
	@RequestMapping(value="/memberRemove.do" ,method = RequestMethod.POST)
	public void removeMember(@RequestParam(value = "cb[]") List<String> cbArr,@RequestParam(value = "pwd") String pwd, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();
//		String viewName=(String)request.getAttribute("viewName");
		
		MemberVO member=(MemberVO)session.getAttribute("member");
		String sessionPass = member.getUser_pwd();
		ModelAndView mav = new ModelAndView();
		String outputPwd="1";
		
		if(!(sessionPass.equals(pwd))) {
			outputPwd="0";
		}else {
		
			String user_id=member.getUser_id();
			String removelist="";
			if(!cbArr.equals(null)) {
				for(String i : cbArr) {
					removelist += i + ", ";
				}
			}
			
			removelist = "";
			Map<String, Object> firemap = new HashMap<String, Object>();
			firemap.put("user_id", user_id);
			firemap.put("removelist", removelist);
			
			myPageService.removeMember(firemap);
		}
		
		PrintWriter output = response.getWriter();
		
		output.print(outputPwd);
	}

	@Override
	@RequestMapping(value="/removeMember.do" ,method = RequestMethod.GET)
	public ModelAndView memberRemove(HttpServletRequest request, HttpServletResponse response) throws Exception {
request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();
		
		String viewName=(String)request.getAttribute("viewName");
		
		MemberVO member=(MemberVO)session.getAttribute("member");
		
		String user_id=member.getUser_id();
		
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@RequestMapping(value="/fireBye.do", method=RequestMethod.GET)
	public ModelAndView fireAlert(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("작동");
		
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/memberRemove");
		return mav;
	}

	@Override
	public ModelAndView listMyOrderHistory(Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
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
