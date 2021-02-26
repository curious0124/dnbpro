package com.dnb.pro.cust.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dnb.pro.board.vo.ArticleVO;
import com.dnb.pro.mem_manage.vo.Criteria;
import com.dnb.pro.mem_manage.vo.SearchCriteria;

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
	public List selectAllNoticeList(SearchCriteria scri) throws DataAccessException {
		List<ArticleVO> articlesNoticeList = sqlSession.selectList("mapper.board.selectAllNoticeList",scri);
		return articlesNoticeList;
	}
	
	@Override
	public int listNoticeCount(SearchCriteria scri) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.listNoticeCount",scri);
	}

	@Override
	public ArticleVO selectNoticeArticle(int board_num) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNoticeArticle", board_num);
	}

	//ÆË¾÷
	@Override
	public List selectAllNoticeList2() throws DataAccessException {
		List<ArticleVO> articlesNoticeList = sqlSession.selectList("mapper.board.selectAllNoticeList2");
		return articlesNoticeList;
	}

	

	
}
