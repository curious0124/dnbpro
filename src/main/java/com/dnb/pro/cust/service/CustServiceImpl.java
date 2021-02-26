package com.dnb.pro.cust.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dnb.pro.board.vo.ArticleVO;
import com.dnb.pro.cust.dao.CustDAO;
import com.dnb.pro.mem_manage.vo.SearchCriteria;
import com.dnb.pro.mem_manage.vo.Criteria;

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
	public List<ArticleVO> listNoticeArticles(SearchCriteria scri) throws Exception {
		List<ArticleVO> articlesNoticeList = custDAO.selectAllNoticeList(scri);
		return articlesNoticeList;
	}
	
	@Override
	public int listNoticeCount(SearchCriteria scri) throws Exception {
		return custDAO.listNoticeCount(scri);
	}
	
	@Override
	public ArticleVO viewNoticeArticle(int board_num) throws Exception {
		ArticleVO articleVO = custDAO.selectNoticeArticle(board_num);
		return articleVO;
	}
	
//ÆË¾÷
	@Override
	public List<ArticleVO> listNoticeArticles2() throws Exception {
		List<ArticleVO> articlesNoticeList = custDAO.selectAllNoticeList2();
		return articlesNoticeList;
	}

	

	

}
