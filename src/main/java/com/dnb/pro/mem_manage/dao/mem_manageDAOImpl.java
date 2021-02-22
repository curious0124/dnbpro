package com.dnb.pro.mem_manage.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dnb.pro.mem_manage.vo.Criteria;
import com.dnb.pro.mem_manage.vo.SearchCriteria;
import com.dnb.pro.member.vo.MemberVO;

@Repository
public class mem_manageDAOImpl implements mem_manageDAO {
	@Inject
	SqlSession sql;
	
	@Override
	public List selectAllMemberList(SearchCriteria scri) throws DataAccessException {
		return sql.selectList("mapper.mem_manage.selectAllMemberList",scri);
	
		
	}

	@Override
	public int listMemCount(SearchCriteria scri) throws Exception {
		return sql.selectOne("mapper.mem_manage.listMemCount",scri);
	}
	
//	@public List 

	@Override
	public void updateMem_auth(MemberVO vo) throws DataAccessException {
		sql.update("mapper.mem_manage.updateMem_auth", vo);
		
	}

//	@Override
//	public List listMemAuth() throws DataAccessException {
//		return sql.selectList("mapper.mem_mana.listMemAuth");
//	}
}
