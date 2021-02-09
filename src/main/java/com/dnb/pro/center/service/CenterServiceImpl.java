package com.dnb.pro.center.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dnb.pro.board.vo.ArticleVO;
import com.dnb.pro.center.dao.CenterDAO;

@Repository("centerService")
@Transactional(propagation=Propagation.REQUIRED)  
public class CenterServiceImpl implements CenterService{
	
	@Autowired
	private CenterDAO centerDAO;
	
	@Override
	public Map<String, List<ArticleVO>> listCenter(String brd_num) throws Exception {
		Map<String, List<ArticleVO>> MapDAO = new HashMap<String, List<ArticleVO>>();
		
		List<ArticleVO> introList = centerDAO.selectCenterIntroList(brd_num);
		List<ArticleVO> videoList = centerDAO.selectCenterVideoList(brd_num);
		List<ArticleVO> serviceList = centerDAO.selectCenterServiceList(brd_num);
		
		MapDAO.put("intro", introList);
		MapDAO.put("video", videoList);
		MapDAO.put("service", serviceList);
		
		return MapDAO;
	}
	

}
