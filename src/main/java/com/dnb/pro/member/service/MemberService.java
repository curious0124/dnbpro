package com.dnb.pro.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.dnb.pro.member.vo.MemberVO;

public interface MemberService {
	public List listMembers() throws DataAccessException;

	public MemberVO login(MemberVO vo) throws Exception;

	public int register(MemberVO vo) throws Exception;

	public String overlapped(String user_id) throws Exception;
}
