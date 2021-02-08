package com.dnb.pro.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dnb.pro.member.vo.MemberVO;



@Repository
public class MemberDAOImpl implements MemberDAO {
//	@Autowired
//	private SqlSession sqlSession;

	@Inject
	SqlSession sql;

	
	@Override
	public List selectAllMemberList() throws DataAccessException {
		List<MemberVO> membersList = null;
		membersList = sql.selectList("mapper.member.selectAllMemberList");
		return membersList;
	}

	@Override
	public int register(MemberVO vo) throws Exception {
		return sql.insert("mapper.member.register", vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {

		return sql.selectOne("mapper.member.login", vo);
	}
	
	@Override
	public String selectOverlappedID(String user_id) throws DataAccessException {
		String result =  sql.selectOne("mapper.member.selectOverlappedID",user_id);
		return result;
	}

}