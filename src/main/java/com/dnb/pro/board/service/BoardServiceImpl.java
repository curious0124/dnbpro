package com.dnb.pro.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dnb.pro.board.dao.BoardDAO;
import com.dnb.pro.board.vo.ArticleVO;

@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;
	
	public List<ArticleVO> listArticles(int brd_num) throws Exception{
		List<ArticleVO> articlesList = boardDAO.selectAllArticlesList(brd_num);
		return articlesList;
	}

	@Override
	public ArticleVO viewArticle(int board_num) throws Exception {
		ArticleVO articleVO = boardDAO.selectArticle(board_num);
		return articleVO;
	}

	@Override
	public ArticleVO selectBrdname(int brd_num) throws Exception {
		ArticleVO articleVO = boardDAO.selectBoardName(brd_num);
		return articleVO;
	}

	@Override
	public int addNewArticle(Map articleMap) throws Exception {
		System.out.println("service"+articleMap);
		return boardDAO.insertNewArticle(articleMap);
	}

	@Override
	public void modArticle(Map articleMap) throws Exception {
		boardDAO.updateArticle(articleMap);
		
	}

	@Override
	public void deleteArticle(ArticleVO articleVO) throws Exception {
		boardDAO.deleteArticle(articleVO);
		
	}
}
