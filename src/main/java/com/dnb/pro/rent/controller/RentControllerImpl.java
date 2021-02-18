package com.dnb.pro.rent.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
		
	
		@Override
		@RequestMapping(value="/admin_Eq_reserv_apply.do" ,method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView listresqs(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = (String)request.getAttribute("viewName");
			
			
			logger.info("info 레벨: viewName = "+viewName);
			logger.debug("debug 레벨: viewName = "+viewName);
			
			
			List listresqs = rentService.listresqs();
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("listresqs", listresqs);
			return mav;
		}
		
		@Override
		@RequestMapping(value="/admin_Eq_reserv_list.do" ,method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView listres(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = (String)request.getAttribute("viewName");
			
			
			logger.info("info 레벨: viewName = "+viewName);
			logger.debug("debug 레벨: viewName = "+viewName);
			
			
			List listres = rentService.listres();
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("listres", listres);
			return mav;
		}
		

	
		@Override
		@RequestMapping(value="/admin_Eq_rent_list.do" ,method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView listrent(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = (String)request.getAttribute("viewName");
			
			
			logger.info("info 레벨: viewName = "+viewName);
			logger.debug("debug 레벨: viewName = "+viewName);
			
			
			List listrent = rentService.listrent();
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("listrent", listrent);
			return mav;
		}
		
		
		@Override
		@RequestMapping(value="/admin_Eq_return_list.do" ,method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView listreturn(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = (String)request.getAttribute("viewName");
			
			
			logger.info("info 레벨: viewName = "+viewName);
			logger.debug("debug 레벨: viewName = "+viewName);
			
			
			List listreturn = rentService.listreturn();
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("listreturn", listreturn);
			return mav;
		}
		
		@Override
		@RequestMapping(value="/AuthRes.do" ,method = {RequestMethod.POST,RequestMethod.GET})
		public ModelAndView AuthRes(HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			
			HttpSession session = request.getSession();
			
//			MemberVO member = (MemberVO)session.getAttribute("member");
			
//			String user_id = member.getUser_id();
//			String cate_name = request.getParameter("ResCate");
			int resq_num =Integer.parseInt(request.getParameter("Resqnum"));
			
//			rentVO.setUser_id(user_id);
//			rentVO.setCate_name(cate_name);
			rentVO.setResq_num(resq_num);
			
//			System.out.println(rentVO.getUser_id());
			
			ModelAndView mav = new ModelAndView();
			rentService.AuthRes(rentVO);
			
			mav.addObject("message", "Auth_resq");
			mav.setViewName("redirect:/rent/admin_Eq_reserv_apply.do");
			
			return mav;
		}
		
		@Override
		@RequestMapping(value="/CancleResq.do" ,method = {RequestMethod.POST,RequestMethod.GET})
		public ModelAndView CancleResq(HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			
			
			HttpSession session = request.getSession();
			
//			MemberVO member = (MemberVO)session.getAttribute("member");
			
//			String user_id = member.getUser_id();
//			String cate_name = request.getParameter("ResCate");
			
			
			int resq_num =Integer.parseInt(request.getParameter("Resqnum"));
			

			rentVO.setResq_num(resq_num);
			

			
			ModelAndView mav = new ModelAndView();
			rentService.CancleResq(rentVO);
			
			mav.addObject("message", "Cancle_resq");
			mav.setViewName("redirect:/rent/admin_Eq_reserv_apply.do");
			
			return mav;
		}
		
		@Override
		@RequestMapping(value="/CancleRes.do" ,method = {RequestMethod.POST,RequestMethod.GET})
		public ModelAndView CancleRes(HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			
			
			HttpSession session = request.getSession();
			
//			MemberVO member = (MemberVO)session.getAttribute("member");
			
//			String user_id = member.getUser_id();
//			String cate_name = request.getParameter("ResCate");
			
			
			int res_num =Integer.parseInt(request.getParameter("Resnum"));
			

			rentVO.setRes_num(res_num);
			

			
			ModelAndView mav = new ModelAndView();
			rentService.CancleRes(rentVO);
			
			mav.addObject("message", "Cancle_res");
			mav.setViewName("redirect:/rent/admin_Eq_reserv_list.do");
			
			return mav;
		}
		
	
		
		

		@Override
		@RequestMapping(value="/ResStateupdate.do", method = {RequestMethod.POST,RequestMethod.GET})
		public ResponseEntity ResStateupdate(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
			multipartRequest.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");
		
			Map<String,Object> resmap = new HashMap<String, Object>();
			
		
			Enumeration enu=multipartRequest.getParameterNames();
			
			while(enu.hasMoreElements()) {	
				String name = (String)enu.nextElement();
				String value = multipartRequest.getParameter(name);
				resmap.put(name, value);
			}

			String message = null;
			ResponseEntity resEnt=null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	
		try {
			
			 rentService.ResStateupdate(resmap);
			 rentService.ResStateinsertLog(resmap);
			
			//새 글을 추가한 후 메시지를 전달합니다.
			message = "<script>";
			message += " alert('상태 변경을 완료 했습니다.');";
			 message += " location.href='"+multipartRequest.getContextPath()+"/rent/admin_Eq_rent_list.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			}catch(Exception e) {
				
				
				//새 글을 추가한 후 메시지를 전달합니다.
				message = "<script>";
				message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
				
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
				
			}
			 return  resEnt;
			
		}

		
		@Override
		@RequestMapping(value="/ReturnRenting.do" ,method = {RequestMethod.POST,RequestMethod.GET})
		public ModelAndView ReturnRenting(HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			
			
			HttpSession session = request.getSession();
			
//			MemberVO member = (MemberVO)session.getAttribute("member");
			
//			String user_id = member.getUser_id();
//			String cate_name = request.getParameter("ResCate");
			
			
			int res_num =Integer.parseInt(request.getParameter("Resnum"));
			

			rentVO.setRes_num(res_num);
			

			
			ModelAndView mav = new ModelAndView();
			rentService.ReturnRenting(rentVO);
			
			mav.addObject("message", "return_rent");
			mav.setViewName("redirect:/rent/admin_Eq_rent_list.do");
			
			return mav;
		}
		
}
