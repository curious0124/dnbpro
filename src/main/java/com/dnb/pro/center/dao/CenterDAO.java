package com.dnb.pro.center.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.dnb.pro.board.vo.ArticleVO;

public interface CenterDAO {
	public List<ArticleVO> selectCenterIntroList(String brd_num) throws DataAccessException;
	public List<ArticleVO> selectCenterVideoList(String brd_num) throws DataAccessException;
	public List<ArticleVO> selectCenterServiceList(String brd_num) throws DataAccessException;
}
