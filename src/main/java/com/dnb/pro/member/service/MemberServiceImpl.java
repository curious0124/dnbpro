package com.dnb.pro.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dnb.pro.member.dao.MemberDAO;
import com.dnb.pro.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO dao;

	@Override
	public List listMembers() throws DataAccessException {
		List membersList = null;
		membersList = dao.selectAllMemberList();
		return membersList;
	}

	@Override
	public int register(MemberVO vo) throws Exception {
		return dao.register(vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}

	@Override
	public String overlapped(String user_id) throws Exception {
		return dao.selectOverlappedID(user_id);
	}

}