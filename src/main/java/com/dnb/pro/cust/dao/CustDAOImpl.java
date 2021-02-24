package com.dnb.pro.cust.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dnb.pro.board.vo.ArticleVO;
import com.dnb.pro.board.vo.Criteria;

@Repository("custDAO")
public class CustDAOImpl implements CustDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllFaqList(Criteria cri) throws DataAccessException {
		return sqlSession.selectList("mapper.board.selectAllFaqList", cri);
	}

	@Override
	public int listFaqCount(Criteria cri) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.board.listFaqCount",cri);
	}
	
	@Override
	public List selectAllNoticeList() throws DataAccessException {
		List<ArticleVO> articlesNoticeList = sqlSession.selectList("mapper.board.selectAllNoticeList");
		return articlesNoticeList;
	}

	@Override
	public ArticleVO selectNoticeArticle(int board_num) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNoticeArticle", board_num);
	}

	
}
