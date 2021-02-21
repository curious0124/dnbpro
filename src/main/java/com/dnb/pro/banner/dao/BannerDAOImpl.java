package com.dnb.pro.banner.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dnb.pro.banner.vo.BannerVO;

@Repository("BannerDAO")
public class BannerDAOImpl implements BannerDAO{
	@Autowired
	private SqlSession sqlSession;
	@Override
	
	public List selectBannerImage() throws DataAccessException {
		List<BannerVO> selectBannerImageList = sqlSession.selectList("mapper.banner.selectBannerImage");
		System.out.println(selectBannerImageList);
		return selectBannerImageList;
	}
}
