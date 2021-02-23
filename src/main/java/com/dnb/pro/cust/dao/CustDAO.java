package com.dnb.pro.cust.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.dnb.pro.board.vo.ArticleVO;
import com.dnb.pro.board.vo.Criteria;

public interface CustDAO {
	public List selectAllFaqList(Criteria cri) throws DataAccessException;
	public int listFaqCount(Criteria cri) throws DataAccessException;
	public List selectAllNoticeList() throws DataAccessException;
	public ArticleVO selectNoticeArticle(int  board_num) throws DataAccessException;
}
