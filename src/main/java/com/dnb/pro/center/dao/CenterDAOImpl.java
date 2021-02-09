package com.dnb.pro.center.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dnb.pro.board.vo.ArticleVO;

@Repository("centerDAO")
public class CenterDAOImpl implements CenterDAO {
	@Autowired
	private SqlSession sqlSession;
	
	//센터소개 불러오기
	@Override
	public List<ArticleVO> selectCenterIntroList(String brd_num) throws DataAccessException {
		List<ArticleVO> intro = (List)sqlSession.selectList("mapper.board.selectCenterIntroList",brd_num);
		return intro;
	}

	@Override
	public List<ArticleVO> selectCenterVideoList(String brd_num) throws DataAccessException {
		List<ArticleVO> video = (List)sqlSession.selectList("mapper.board.selectCenterVideoList",brd_num);
		return video;
	}

	@Override
	public List<ArticleVO> selectCenterServiceList(String brd_num) throws DataAccessException {
		List<ArticleVO> service = (List)sqlSession.selectList("mapper.board.selectCenterServiceList",brd_num);
		return service;
	}

}
