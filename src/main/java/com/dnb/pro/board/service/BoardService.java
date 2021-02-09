package com.dnb.pro.board.service;

import java.util.List;
import java.util.Map;

import com.dnb.pro.board.vo.ArticleVO;

public interface BoardService {

	public List listArticles(int brd_num) throws Exception;

	public ArticleVO viewArticle(int board_num) throws Exception;

	public ArticleVO selectBrdname(int board_num) throws Exception;

	public int addNewArticle(Map articleMap) throws Exception;

	public void modArticle(Map articleMap) throws Exception;

//	public int addNewArticle(Map articleMap) throws Exception;
//
//	public ArticleVO viewArticle(int articleNO) throws Exception;
//
//	public void modArticle(Map articleMap) throws Exception;

}
