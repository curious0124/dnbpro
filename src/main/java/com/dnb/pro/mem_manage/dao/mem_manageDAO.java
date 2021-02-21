package com.dnb.pro.mem_manage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.dnb.pro.mem_manage.vo.Criteria;
import com.dnb.pro.mem_manage.vo.SearchCriteria;
import com.dnb.pro.member.vo.MemberVO;

public interface mem_manageDAO {
	public List selectAllMemberList(SearchCriteria scri) throws DataAccessException;
	public int listMemCount(SearchCriteria scri) throws Exception;
	
	public void updateMem_auth(MemberVO vo) throws DataAccessException;
//	public List listMemAuth() throws DataAccessException;
	
}
