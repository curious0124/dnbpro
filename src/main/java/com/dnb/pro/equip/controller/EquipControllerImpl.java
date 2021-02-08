package com.dnb.pro.equip.controller;

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
		
	
}
