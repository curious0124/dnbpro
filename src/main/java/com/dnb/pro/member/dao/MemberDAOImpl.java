package com.dnb.pro.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
		String result = sql.selectOne("mapper.member.selectOverlappedID", user_id);
		return result;
	}
	

	// ���̵� ã��
	@Override
	public String find_id(String user_email) throws DataAccessException {
		return sql.selectOne("mapper.member.find_id", user_email);
	}
	
	// ��й�ȣ ã��
	@Override
	@Transactional
	public int update_pw(MemberVO vo) throws DataAccessException{
		return sql.update("mapper.member.update_pw", vo);
	}


}