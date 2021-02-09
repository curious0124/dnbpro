package com.dnb.pro.cust.service;

import java.util.List;

import com.dnb.pro.board.vo.ArticleVO;

public interface CustService {
	public List listArticles() throws Exception;
	public List listNoticeArticles() throws Exception;
	public ArticleVO viewNoticeArticle(int board_num) throws Exception;
}
