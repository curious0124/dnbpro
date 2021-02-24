package com.dnb.pro.cust.service;

import java.util.List;

import com.dnb.pro.board.vo.ArticleVO;
import com.dnb.pro.mem_manage.vo.Criteria;
import com.dnb.pro.mem_manage.vo.SearchCriteria;

public interface CustService {
	public List listFaqArticles(Criteria cri) throws Exception;
	public int listFaqCount(Criteria cri) throws Exception;
	
	public List listNoticeArticles(SearchCriteria scri) throws Exception;
	public int listNoticeCount(SearchCriteria scri) throws Exception;
	
	public ArticleVO viewNoticeArticle(int board_num) throws Exception;
	
//	ÆË¾÷
	public List listNoticeArticles2() throws Exception;
}
