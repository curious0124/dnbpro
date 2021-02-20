package com.dnb.pro.banner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dnb.pro.banner.dao.BannerDAO;
import com.dnb.pro.banner.vo.BannerVO;

@Service("BannerService")
@Transactional(propagation = Propagation.REQUIRED)
public class BannerServiceImpl implements BannerService{
	@Autowired
	private BannerDAO BannerDAO;

	@Override
	public List<BannerVO> selectBannerImage() throws Exception{
		List<BannerVO> selectBannerImageList = BannerDAO.selectBannerImage();
		return selectBannerImageList;
	}

}
