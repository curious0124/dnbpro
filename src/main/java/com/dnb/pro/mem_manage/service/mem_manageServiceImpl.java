package com.dnb.pro.mem_manage.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.dnb.pro.mem_manage.vo.Criteria;
import com.dnb.pro.mem_manage.vo.SearchCriteria;
import com.dnb.pro.mem_manage.dao.mem_manageDAO;
import com.dnb.pro.member.vo.MemberVO;

@Service
public class mem_manageServiceImpl implements mem_manageService{
	@Inject
	mem_manageDAO dao;
	

	@Override
	public List<MemberVO> listMembers(SearchCriteria scri) throws DataAccessException {
		
		return dao.selectAllMemberList(scri);
	}

	@Override
	public int listMemCount(SearchCriteria scri) throws Exception {
		return dao.listMemCount(scri);
	}

	@Override
	public void modMem_auth(MemberVO vo) throws Exception {
		dao.updateMem_auth(vo);
		
	}

//	@Override
//	public List listMemAuth() throws DataAccessException {
//		return dao.listMemAuth();
//	}
	
}
