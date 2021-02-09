package com.dnb.pro.center.service;

import java.util.List;
import java.util.Map;

import com.dnb.pro.board.vo.ArticleVO;

public interface CenterService {
	public Map<String, List<ArticleVO>> listCenter(String brd_num) throws Exception;
	

}
