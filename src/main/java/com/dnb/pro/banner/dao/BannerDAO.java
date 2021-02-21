package com.dnb.pro.banner.dao;


import java.util.List;

import org.springframework.dao.DataAccessException;

import com.dnb.pro.board.vo.ArticleVO;

public interface BannerDAO {

	
	public List selectBannerImage() throws DataAccessException;

}
