package com.dnb.pro.equip.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface EquipController {

	
	public ModelAndView listequips(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewequip(@RequestParam("eq_name") String eq_name,
            HttpServletRequest request, HttpServletResponse response) throws Exception;

}