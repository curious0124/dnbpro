package com.dnb.pro.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.dnb.pro.board.vo.ArticleVO;

public interface BoardDAO {

	public List selectAllArticlesList(int brd_num) throws DataAccessException;

	public ArticleVO selectArticle(int board_num) throws DataAccessException;

	public ArticleVO selectBoardName(int brd_num) throws DataAccessException;

	public int insertNewArticle(Map articleMap) throws DataAccessException;

	public void updateArticle(Map articleMap) throws DataAccessException;

//	public int insertNewArticle(Map articleMap) throws DataAccessException;
//
//	public ArticleVO selectArticle(int articleNO) throws DataAccessException;
//
//	public void updateArticle(Map articleMap) throws DataAccessException;

//	public Object updateArticle(Map articleMap) throws DataAccessException;

}
