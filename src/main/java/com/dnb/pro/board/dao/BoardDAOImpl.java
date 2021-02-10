package com.dnb.pro.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dnb.pro.board.vo.ArticleVO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllArticlesList(int brd_num) throws DataAccessException {
		List<ArticleVO> articlesList = sqlSession.selectList("mapper.board.selectAllArticlesList",brd_num);
		return articlesList;
	}

	@Override
	public ArticleVO selectArticle(int board_num) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectArticle",board_num);
	}

	@Override
	public ArticleVO selectBoardName(int brd_num) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectBoardName",brd_num);
	}

	@Override
	public int insertNewArticle(Map articleMap) throws DataAccessException {
		int articleNO = selectNewArticleNO();	//새 글에 대한 글번호를 가져옵니다.
		System.out.println("DAO : "+articleMap);
		sqlSession.insert("mapper.board.insertNewArticle",articleMap);
		return articleNO;
	}
	private int selectNewArticleNO() throws DataAccessException{
		return sqlSession.selectOne("mapper.board.selectNewArticleNO");
	}

	@Override
	public void updateArticle(Map articleMap) throws DataAccessException {
		System.out.println("DAO!!!!!!!!!!!"+articleMap);
		String img = (String) articleMap.get("board_img");
		if(img != null && img.length() != 0) {
			sqlSession.update("mapper.board.updateArticleNewimg",articleMap);
		}
		sqlSession.update("mapper.board.updateArticle",articleMap);
		
	}

	@Override
	public void deleteArticle(ArticleVO articleVO) throws DataAccessException {
		sqlSession.update("mapper.board.deleteArticle",articleVO);
		
	}

//	@Override
//	public int insertNewArticle(Map articleMap) throws  DataAccessException{
//		int articleNO = selectNewArticleNO();	//새 글에 대한 글번호를 가져옵니다.
//		articleMap.put("articleNO", articleNO);
//		sqlSession.insert("mapper.board.insertNewArticle",articleMap);
//		return articleNO;
//	}
//	
//	private int selectNewArticleNO() throws DataAccessException{
//		return sqlSession.selectOne("mapper.board.selectNewArticleNO");
//	}
//
//	@Override
//	public ArticleVO selectArticle(int articleNO) throws DataAccessException {
//		
//		return sqlSession.selectOne("mapper.board.selectArticle",articleNO);
//	}
//
//	@Override
//	public void updateArticle(Map articleMap) throws DataAccessException {
//		sqlSession.update("mapper.board.updateArticle", articleMap);
//	}

}
