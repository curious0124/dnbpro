package com.dnb.pro.equip.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.dnb.pro.equip.service.EquipService;
import com.dnb.pro.equip.vo.EquipVO;






@Controller("EquipController")
@RequestMapping(value="/equip")
public class EquipControllerImpl implements EquipController {
	private static final Logger logger = LoggerFactory.getLogger(EquipControllerImpl.class);
	
	 @Autowired
		private EquipService equipService;
		@Autowired
		private EquipVO equipVO;
		
		
		
		@Override
		@RequestMapping(value="/view_Eq_list.do" ,method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView listequips(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = (String)request.getAttribute("viewName");
			
			
			
			List listequips = equipService.listequips();
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("listequips", listequips);
			return mav;
		}
		
		@RequestMapping(value="/view_Eq_detail.do" ,method = RequestMethod.GET)
		public ModelAndView viewequip(@RequestParam("eq_name") String eq_name,
	                                    HttpServletRequest request, HttpServletResponse response) throws Exception{
			String viewName = (String)request.getAttribute("viewName");
			equipVO=equipService.viewequip(eq_name);
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			mav.addObject("equipVO", equipVO);
			return mav;
		}
		
		@Override
		@RequestMapping(value="/admin_Eq_manage_list.do" ,method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView adminlistequips(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = (String)request.getAttribute("viewName");
			
			
			
			List adminequipList = equipService.adminlistequips();
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("adminequipList", adminequipList);
			return mav;
		}
		
		@Override
		@RequestMapping(value="/admin_Eq_manage_classify_list.do" ,method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView catelistequips(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = (String)request.getAttribute("viewName");
		
			List cateList = equipService.catelistequips();
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("cateList", cateList);
			return mav;
		}
		
	
		
		
		@RequestMapping(value="/admin_Eq_manage_classify.do" ,method = RequestMethod.GET)
		public ModelAndView viewecatename(@RequestParam("cate_name") String cate_name,
	                                    HttpServletRequest request, HttpServletResponse response) throws Exception{
			String viewName = (String)request.getAttribute("viewName");
			List cateList=(List) equipService.viewequip(cate_name);
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			mav.addObject("cateList", cateList);
			return mav;
		}
		@Override
		@RequestMapping(value="/addcatename.do" ,method = RequestMethod.POST)
		public ResponseEntity addcatename(@RequestParam("cate_name") String cate_name,
				                    HttpServletRequest request, HttpServletResponse response)  throws Exception{
			response.setContentType("text/html; charset=UTF-8");
			request.setCharacterEncoding("utf-8");
			String message = null;
			ResponseEntity resEntity = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			try {
			    equipService.addcatename(cate_name);
			    message  = "<script>";
			    message +=" alert('분류명 등록을 마쳤습니다.분류 리스트 창으로 이동합니다.');";
			    message += " location.href='"+request.getContextPath()+"/equip/admin_Eq_manage_classify_list.do';";
			    message += " </script>";
			    
			}catch(Exception e) {
				message  = "<script>";
			    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
			    message += " location.href='"+request.getContextPath()+"/equip/admin_Eq_manage_classify.do';";
			    message += " </script>";
				e.printStackTrace();
			}
			resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
			return resEntity;
		}
		
		
		
		@RequestMapping(value = "/deleteCatename.do", method = RequestMethod.POST)
		public ResponseEntity deleteCart(@RequestParam(value = "chbox[]") List<String> caArr, EquipVO equipVO) 
				throws Exception {
	
		 
		    String message = null;
			ResponseEntity resEnt=null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
		 int result = 0;
		 String cateName= new String();
		  for(String i : caArr) {
			  cateName = i;
			  equipVO.setCate_name(cateName);
			  equipService.deleteCatename(equipVO);
		    
		    message = "<script>";
			message += " alert('글 삭제를 완료 했습니다.');";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED); 
			
		  } 
			return resEnt;  
		}
		
		
		@Override
		@RequestMapping(value="/admin_Eq_manage_regist_list.do" ,method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView eqnamelistequips(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = (String)request.getAttribute("viewName");
			
			
			
			List eqnameList = equipService.eqnamelistequips();
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("eqnameList", eqnameList);
			return mav;
		}
		

		
		@RequestMapping(value="/admin_Eq_manage_regist.do" ,method = RequestMethod.GET)
		public ModelAndView catelistequips(@RequestParam("cate_name") String cate_name,  HttpServletRequest request, HttpServletResponse response) throws Exception{
			String viewName = (String)request.getAttribute("viewName");
			List cateList = equipService.catelistequips();
			ModelAndView mav = new ModelAndView(viewName);
     		mav.addObject("cateList", cateList);
		
			return mav;
		}
		
		@RequestMapping(value="/admin_Eq_manage_serial.do" ,method = RequestMethod.GET)
		public ModelAndView eqnamelistserial(@RequestParam("eq_name") String eq_name,  HttpServletRequest request, HttpServletResponse response) throws Exception{
			String viewName = (String)request.getAttribute("viewName");
			List eqnameonlyList = equipService.eqnamelistserial();
			ModelAndView mav = new ModelAndView(viewName);
     		mav.addObject("eqnameonlyList", eqnameonlyList);
		
			return mav;
		}
		
		
		@Override
		@RequestMapping(value="/addeqname.do" ,method = RequestMethod.GET)
		public ResponseEntity addeqname(@ModelAttribute("equipVO") EquipVO equipVO,
				                    HttpServletRequest request, HttpServletResponse response)  throws Exception{
			response.setContentType("text/html; charset=UTF-8");
			request.setCharacterEncoding("utf-8");
			String message = null;
			ResponseEntity resEntity = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			try {
			    equipService.addeqname(equipVO);
			    message  = "<script>";
			    message +=" alert('모델명 등록을 마쳤습니다.모델 리스트 창으로 이동합니다.');";
			    message += " location.href='"+request.getContextPath()+"/equip/admin_Eq_manage_regist_list.do';";
			    message += " </script>";
			    
			}catch(Exception e) {
				message  = "<script>";
			    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
			    message += " location.href='"+request.getContextPath()+"/equip/admin_Eq_manage_regist.do';";
			    message += " </script>";
				e.printStackTrace();
			}
			resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);   
//			System.out.println(equipVO.getEq_thumimg());  
			return resEntity;
		}
		
		
		
		
	
		@Override
		@RequestMapping(value="/addserialname.do" ,method = RequestMethod.GET)
		public ResponseEntity addserialname(@ModelAttribute("equipVO") EquipVO equipVO,
				                    HttpServletRequest request, HttpServletResponse response)  throws Exception{
			response.setContentType("text/html; charset=UTF-8");
			request.setCharacterEncoding("utf-8");
			String message = null;
			ResponseEntity resEntity = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			try {
			    equipService.addserialname(equipVO);
			    message  = "<script>";
			    message +=" alert('시리얼명 등록을 마쳤습니다.장비 리스트 창으로 이동합니다.');";
			    message += " location.href='"+request.getContextPath()+"/equip/admin_Eq_manage_list.do';";
			    message += " </script>";
			    
			}catch(Exception e) {
				message  = "<script>";
			    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
			    message += " location.href='"+request.getContextPath()+"/equip/admin_Eq_manage_serial.do';";
			    message += " </script>";
				e.printStackTrace();
			}
			resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);    
			
//			System.out.println(equipVO.getEq_produc());  
			return resEntity;
		}

		
		
		@RequestMapping(value = "/deleteEqname.do", method = RequestMethod.POST)
		public ResponseEntity deleteEqname(@RequestParam(value = "chbox[]") List<String> eqArr, EquipVO equipVO) 
				throws Exception {
	
		 
		    String message = null;
			ResponseEntity resEnt=null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
		 int result = 0;
		 String eqName= new String();
		  for(String i : eqArr) {
			  eqName = i;
			  equipVO.setEq_name(eqName);
			  equipService.deleteEqname(equipVO);
		    
		    message = "<script>";
			message += " alert('글 삭제를 완료 했습니다.');";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED); 
			
		  } 
//		  System.out.println(equipVO.getEq_name());  
			return resEnt;  
		}
		
		
		@RequestMapping(value = "/deleteSerial.do", method = RequestMethod.POST)
		public ResponseEntity deleteEqSerial(@RequestParam(value = "chbox[]") List<String> seArr, EquipVO equipVO) 
				throws Exception {
	
		 
		    String message = null;
			ResponseEntity resEnt=null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
		 int result = 0;
		 String eqSerial= new String();
		  for(String i : seArr) {
			  eqSerial = i;
			  equipVO.setEq_serial(eqSerial);
			  equipService.deleteEqserial(equipVO);
		    
		    message = "<script>";
			message += " alert('글 삭제를 완료 했습니다.');";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED); 
			
		  } 
//		  System.out.println(equipVO.getEq_name());  
			return resEnt;  
		}
	
		
		@Override
		@RequestMapping(value="/modSerialState.do", method = RequestMethod.POST)
		public ModelAndView modSerialState(@ModelAttribute("eq_state") String eq_state,HttpServletRequest request, HttpServletResponse response) throws Exception{
			request.setCharacterEncoding("utf-8");
			EquipVO equipVO = new EquipVO();

			int result = 0;
			
			result = equipService.modSerialState(eq_state);

			ModelAndView mav = new ModelAndView("redirect:/equip/admin_Eq_manage_list.do");  
			
//			System.out.println(eq_state);  
			return mav;
			
		}
		
		
	
		
		@Override
		@RequestMapping(value="/admin_Eq_manage_serialmod.do", method=RequestMethod.GET)
		public ModelAndView modserialForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			String eq_serial=request.getParameter("eq_serial");

			
			String viewName = (String)request.getAttribute("viewName");
			 equipVO=equipService.selectSerialById(eq_serial);
			 
			 request.setAttribute("eq_state", equipVO);
			ModelAndView mav = new ModelAndView(viewName);
			mav.setViewName(viewName);
			mav.addObject("equipVO", equipVO);
			return mav;
		}

}
