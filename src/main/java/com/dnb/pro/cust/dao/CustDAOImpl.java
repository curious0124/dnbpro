package com.dnb.pro.cust.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dnb.pro.board.vo.ArticleVO;

@Repository("custDAO")
public class CustDAOImpl implements CustDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllFaqList() throws DataAccessException {
		List<ArticleVO> articlesList = sqlSession.selectList("mapper.board.selectAllFaqList");
		return articlesList;
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
