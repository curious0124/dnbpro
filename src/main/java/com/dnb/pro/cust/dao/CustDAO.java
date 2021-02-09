package com.dnb.pro.cust.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.dnb.pro.board.vo.ArticleVO;

public interface CustDAO {
	public List selectAllFaqList() throws DataAccessException;
	public List selectAllNoticeList() throws DataAccessException;
	public ArticleVO selectNoticeArticle(int  board_num) throws DataAccessException;
}
