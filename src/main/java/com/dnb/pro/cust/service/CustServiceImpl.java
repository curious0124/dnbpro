package com.dnb.pro.cust.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dnb.pro.board.vo.ArticleVO;
import com.dnb.pro.cust.dao.CustDAO;
import com.dnb.pro.board.vo.Criteria;

@Service("custService")
@Transactional(propagation = Propagation.REQUIRED)
public class CustServiceImpl implements CustService{
	@Autowired
	private CustDAO custDAO;
	
	@Override
	public List listFaqArticles(Criteria cri) throws Exception {
		
		return custDAO.selectAllFaqList(cri);
	}

	@Override
	public int listFaqCount(Criteria cri) throws Exception {
		return custDAO.listFaqCount(cri);
	}

	
	@Override
	public List<ArticleVO> listNoticeArticles() throws Exception {
		List<ArticleVO> articlesNoticeList = custDAO.selectAllNoticeList();
		return articlesNoticeList;
	}
	
	@Override
	public ArticleVO viewNoticeArticle(int board_num) throws Exception {
		ArticleVO articleVO = custDAO.selectNoticeArticle(board_num);
		return articleVO;
	}

	

}
