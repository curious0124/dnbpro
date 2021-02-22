package com.dnb.pro.member.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;

import com.dnb.pro.member.vo.MemberVO;

public interface MemberService {
	public List listMembers() throws DataAccessException;

	public MemberVO login(MemberVO vo) throws Exception;

	public int register(MemberVO vo) throws Exception;

	public String overlapped(String user_id) throws Exception;
	
	public String find_id(HttpServletResponse response, String user_email) throws Exception;

	public void send_mail(MemberVO member, String div) throws Exception;

	public void find_pw(HttpServletResponse response, MemberVO vo) throws Exception;

}
