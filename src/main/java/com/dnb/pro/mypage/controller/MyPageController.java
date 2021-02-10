package com.dnb.pro.mypage.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dnb.pro.member.vo.MemberVO;

public interface MyPageController {
	public ModelAndView myPageMain(@RequestParam(required = false,value="message")  String message,HttpServletRequest request, HttpServletResponse response)  throws Exception ;
	public ModelAndView myResqDetail(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView myResDetail(@RequestParam("user_id")  String user_id,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView myReturnDetail(@RequestParam("user_id")  String user_id,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView myLogDetail(@RequestParam("user_id")  String user_id,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView cancelResq(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView cancelRes(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView cancelReturn(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView modMember(MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listMyOrderHistory(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ResponseEntity modifyMyInfo(@RequestParam("attribute")  String attribute,
					            @RequestParam("value")  String value,
					            HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView modmemberForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
