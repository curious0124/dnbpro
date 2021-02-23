package com.dnb.pro.cust.service;

import java.util.List;

import com.dnb.pro.board.vo.ArticleVO;
import com.dnb.pro.board.vo.Criteria;

public interface CustService {
	public List listFaqArticles(Criteria cri) throws Exception;
	public int listFaqCount(Criteria cri) throws Exception;
	
	
	public List listNoticeArticles() throws Exception;
	public ArticleVO viewNoticeArticle(int board_num) throws Exception;
}
