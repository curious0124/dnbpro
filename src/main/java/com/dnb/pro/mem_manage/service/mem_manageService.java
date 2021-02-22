package com.dnb.pro.mem_manage.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.dnb.pro.mem_manage.vo.Criteria;
import com.dnb.pro.mem_manage.vo.SearchCriteria;
import com.dnb.pro.member.vo.MemberVO;

public interface mem_manageService {
	public List listMembers(SearchCriteria scri) throws DataAccessException;
	public int listMemCount(SearchCriteria scri) throws Exception;
	
	public void modMem_auth(MemberVO vo) throws Exception;
//	public List listMemAuth() throws DataAccessException;
}
