package com.dnb.pro.cust.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.dnb.pro.board.vo.ArticleVO;
import com.dnb.pro.mem_manage.vo.Criteria;
import com.dnb.pro.mem_manage.vo.SearchCriteria;

public interface CustDAO {
	public List selectAllFaqList(Criteria cri) throws DataAccessException;
	public int listFaqCount(Criteria cri) throws DataAccessException;
	
	public List selectAllNoticeList(SearchCriteria scri) throws DataAccessException;
	public int listNoticeCount(SearchCriteria scri) throws DataAccessException;
	public ArticleVO selectNoticeArticle(int  board_num) throws DataAccessException;
	
	//ÆË¾÷
	public List selectAllNoticeList2() throws DataAccessException;
}
